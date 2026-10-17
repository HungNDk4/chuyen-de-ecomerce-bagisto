<?php

namespace App\Providers;

use App\Filesystem\CloudinaryStorageAdapter;
use Barryvdh\Debugbar\Facades\Debugbar;
use Cloudinary\Cloudinary;
use Illuminate\Filesystem\FilesystemAdapter;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\ParallelTesting;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\ServiceProvider;
use League\Flysystem\Filesystem;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $allowedIPs = array_map('trim', explode(',', config('app.debug_allowed_ips', '')));

        $allowedIPs = array_filter($allowedIPs);

        if (empty($allowedIPs)) {
            return;
        }

        if (in_array(Request::ip(), $allowedIPs)) {
            Debugbar::enable();
        } else {
            Debugbar::disable();
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        ParallelTesting::setUpTestDatabase(function (string $database, int $token) {
            Artisan::call('db:seed');
        });

        $this->app['filesystem']->extend('cloudinary', function ($app, $config) {
            if (isset($config['url']) && filled($config['url'])) {
                $cloudinary = new Cloudinary($config['url']);
            } else {
                $cloudinary = new Cloudinary([
                    'cloud' => [
                        'cloud_name' => $config['cloud'] ?? '',
                        'api_key' => $config['key'] ?? '',
                        'api_secret' => $config['secret'] ?? '',
                    ],
                    'url' => [
                        'secure' => $config['secure'] ?? true,
                        'analytics' => false,
                    ],
                    'api' => [
                        'connection_timeout' => 30,
                        'timeout' => 120,
                        'upload_timeout' => 120,
                    ],
                ]);
            }

            $adapter = new CloudinaryStorageAdapter($cloudinary, null, $config['prefix'] ?? null);

            return new FilesystemAdapter(
                new Filesystem($adapter, $config),
                $adapter,
                $config
            );
        });
    }
}
