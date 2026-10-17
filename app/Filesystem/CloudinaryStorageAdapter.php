<?php

namespace App\Filesystem;

use Cloudinary\Api\Upload\UploadApi;
use Cloudinary\Cloudinary;
use CloudinaryLabs\CloudinaryLaravel\CloudinaryStorageAdapter as BaseCloudinaryStorageAdapter;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Log;
use League\Flysystem\Config;
use League\MimeTypeDetection\MimeTypeDetector;

class CloudinaryStorageAdapter extends BaseCloudinaryStorageAdapter
{
    /**
     * Create a new Cloudinary storage adapter instance.
     */
    public function __construct(
        protected Cloudinary $cloudinaryInstance,
        ?MimeTypeDetector $mimeTypeDetector = null,
        ?string $prefix = null
    ) {
        parent::__construct($cloudinaryInstance, $mimeTypeDetector, $prefix);
    }

    /**
     * Get the URL for the file at the given path.
     */
    public function getUrl(string $path): string
    {
        $apiKey = config('filesystems.disks.cloudinary.key');

        if (empty($apiKey)) {
            return asset('storage/'.ltrim($path, '/'));
        }

        [$id, $type] = $this->prepareResource($path);

        $extension = pathinfo($path, PATHINFO_EXTENSION);

        if ($type === 'image') {
            $asset = $this->cloudinaryInstance->image($id);

            if (! empty($extension)) {
                $asset->extension($extension);
            }

            return (string) $asset->toUrl();
        }

        if ($type === 'video') {
            $asset = $this->cloudinaryInstance->video($id);

            if (! empty($extension)) {
                $asset->extension($extension);
            }

            return (string) $asset->toUrl();
        }

        return (string) $this->cloudinaryInstance->raw($id)->toUrl();
    }

    /**
     * Determine if a file exists.
     */
    public function fileExists(string $path): bool
    {
        if (empty($path)) {
            return false;
        }

        $localPath = storage_path('app/public/'.ltrim($path, '/'));

        if (file_exists($localPath)) {
            return true;
        }

        return true;
    }

    /**
     * Write file contents.
     */
    public function write(string $path, string $contents, Config $config): void
    {
        $localPath = $this->saveLocalCopy($path, $contents);

        $this->uploadWithRetry($localPath, $path);
    }

    /**
     * Write stream contents.
     */
    public function writeStream(string $path, $contents, Config $config): void
    {
        $contentsString = stream_get_contents($contents);

        $localPath = $this->saveLocalCopy($path, $contentsString);

        $this->uploadWithRetry($localPath, $path);
    }

    /**
     * Delete a file from both local storage and Cloudinary.
     */
    public function delete(string $path): void
    {
        $localPath = storage_path('app/public/'.ltrim($path, '/'));

        if (file_exists($localPath)) {
            @unlink($localPath);
        }

        [$id, $type] = $this->prepareResource($path);

        try {
            $uploadApi = $this->createRobustUploadApi();

            $uploadApi->destroy($id, [
                'resource_type' => $type,
            ]);
        } catch (\Throwable $e) {
            Log::warning("Cloudinary delete failed for {$path}: ".$e->getMessage());
        }
    }

    /**
     * Save a local copy in storage/app/public.
     */
    protected function saveLocalCopy(string $path, string $contents): string
    {
        $localPath = storage_path('app/public/'.ltrim($path, '/'));

        $directory = dirname($localPath);

        if (! is_dir($directory)) {
            mkdir($directory, 0755, true);
        }

        file_put_contents($localPath, $contents);

        return $localPath;
    }

    /**
     * Upload the given local file to Cloudinary with retry and error safety.
     */
    protected function uploadWithRetry(string $localPath, string $path): void
    {
        [$id, $type] = $this->prepareResource($path);

        $uploadApi = $this->createRobustUploadApi();

        $maxRetries = 3;

        for ($attempt = 1; $attempt <= $maxRetries; $attempt++) {
            try {
                $uploadApi->upload($localPath, [
                    'public_id' => $id,
                    'resource_type' => $type,
                    'overwrite' => true,
                ]);

                return;
            } catch (\Throwable $e) {
                Log::warning("Cloudinary upload attempt {$attempt}/{$maxRetries} failed for {$path}: ".$e->getMessage());

                if ($attempt < $maxRetries) {
                    sleep(1);
                }
            }
        }

        Log::error("Cloudinary upload permanently failed for {$path}, retained local copy.");
    }

    /**
     * Create an UploadApi instance with optimized cURL options.
     */
    protected function createRobustUploadApi(): UploadApi
    {
        $uploadApi = $this->cloudinaryInstance->uploadApi();

        try {
            $closure = \Closure::bind(fn () => $this->apiClient, $uploadApi, $uploadApi);

            $apiClient = $closure();

            if ($apiClient && isset($apiClient->httpClient)) {
                $apiKey = config('filesystems.disks.cloudinary.key');
                $apiSecret = config('filesystems.disks.cloudinary.secret');

                $clientConfig = [
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
                ];

                if (! empty($apiKey) && ! empty($apiSecret)) {
                    $clientConfig['auth'] = [$apiKey, $apiSecret];
                }

                $apiClient->httpClient = new Client($clientConfig);
            }
        } catch (\Throwable $e) {
            Log::warning('Failed to configure robust Guzzle client for Cloudinary: '.$e->getMessage());
        }

        return $uploadApi;
    }
}
