<?php

namespace App\Console\Commands;

use Cloudinary\Cloudinary;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class SyncImagesToCloudinary extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cloudinary:sync-local-images {--force : Overwrite existing Cloudinary assets}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Upload all existing local media files (products, categories, channels/logo, banners/themes) to Cloudinary';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $cloudName = config('filesystems.disks.cloudinary.cloud') ?: env('CLOUDINARY_CLOUD_NAME');
        $apiKey = config('filesystems.disks.cloudinary.key') ?: env('CLOUDINARY_KEY');
        $apiSecret = config('filesystems.disks.cloudinary.secret') ?: env('CLOUDINARY_SECRET');

        if (empty($cloudName) || empty($apiKey) || empty($apiSecret)) {
            $this->error('Cloudinary credentials missing in .env! Please configure CLOUDINARY_CLOUD_NAME, CLOUDINARY_KEY, and CLOUDINARY_SECRET.');

            return 1;
        }

        $cloudinary = new Cloudinary([
            'cloud' => [
                'cloud_name' => $cloudName,
                'api_key' => $apiKey,
                'api_secret' => $apiSecret,
            ],
            'api' => [
                'connection_timeout' => 30,
                'timeout' => 120,
            ],
            'url' => [
                'secure' => true,
            ],
        ]);

        $publicStoragePath = storage_path('app/public');

        if (! File::isDirectory($publicStoragePath)) {
            $this->error('Directory storage/app/public not found!');

            return 1;
        }

        $allFiles = File::allFiles($publicStoragePath);

        // Filter out .gitignore and non-image/non-media files if necessary
        $filesToUpload = array_values(array_filter($allFiles, function ($file) {
            return $file->getFilename() !== '.gitignore';
        }));

        $totalFiles = count($filesToUpload);
        $this->info('Scanning storage/app/public...');
        $this->info("Found {$totalFiles} media files to sync (including categories, channel logos, banners, themes, products).");

        $uploadApi = $cloudinary->uploadApi();

        try {
            $closure = \Closure::bind(fn () => $this->apiClient, $uploadApi, $uploadApi);
            $apiClient = $closure();

            if ($apiClient && isset($apiClient->httpClient)) {
                $apiClient->httpClient = new Client([
                    'base_uri' => $apiClient->getBaseUri(),
                    'connect_timeout' => 30,
                    'timeout' => 120,
                    'http_errors' => false,
                    'curl' => [
                        CURLOPT_IPRESOLVE => CURL_IPRESOLVE_V4,
                        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                        CURLOPT_SSL_VERIFYPEER => false,
                        CURLOPT_FORBID_REUSE => true,
                    ],
                    'headers' => [
                        'User-Agent' => 'CloudinaryPHP/'.Cloudinary::VERSION.' (PHP '.PHP_VERSION.')',
                    ],
                    'auth' => [$apiKey, $apiSecret],
                ]);
            }
        } catch (\Throwable $e) {
            // Keep default if reflection fails
        }

        $progressBar = $this->output->createProgressBar($totalFiles);
        $progressBar->start();

        $uploadedCount = 0;
        $skippedCount = 0;
        $failedCount = 0;
        $overwrite = (bool) $this->option('force');

        foreach ($filesToUpload as $file) {
            $relativePath = str_replace('\\', '/', $file->getRelativePathname());

            $pathInfo = pathinfo($relativePath);
            $dirname = str_replace('\\', '/', $pathInfo['dirname'] ?? '');
            $filename = $pathInfo['filename'] ?? '';
            $publicId = ($dirname !== '.' && ! empty($dirname) ? $dirname.'/' : '').$filename;

            $maxRetries = 3;
            $uploaded = false;

            for ($attempt = 1; $attempt <= $maxRetries; $attempt++) {
                try {
                    $uploadApi->upload($file->getRealPath(), [
                        'public_id' => $publicId,
                        'resource_type' => 'auto',
                        'overwrite' => $overwrite,
                    ]);

                    $uploadedCount++;
                    $uploaded = true;
                    break;
                } catch (\Throwable $e) {
                    if (str_contains(strtolower($e->getMessage()), 'already exists')) {
                        $skippedCount++;
                        $uploaded = true;
                        break;
                    }

                    if ($attempt < $maxRetries) {
                        sleep(1);

                        continue;
                    }

                    $this->line('');
                    $this->error("Failed to upload {$relativePath}: ".$e->getMessage());
                    $failedCount++;
                }
            }

            $progressBar->advance();
        }

        $progressBar->finish();
        $this->line('');

        $this->info('==========================================');
        $this->info('Cloudinary Sync Completed!');
        $this->info("Uploaded successfully: {$uploadedCount}");
        $this->info("Skipped (already exist): {$skippedCount}");
        if ($failedCount > 0) {
            $this->warn("Failed: {$failedCount}");
        }
        $this->info('==========================================');

        return 0;
    }
}
