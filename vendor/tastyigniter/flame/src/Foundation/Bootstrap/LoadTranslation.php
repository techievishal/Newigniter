<?php

namespace Igniter\Flame\Foundation\Bootstrap;

use Igniter\Flame\Translation\FileLoader;
use Igniter\Flame\Translation\Localization;
use Igniter\Flame\Translation\Translator;
use Illuminate\Contracts\Foundation\Application;

class LoadTranslation
{
    /**
     * Register Auto Loader
     *
     * @param  \Illuminate\Contracts\Foundation\Application $app
     *
     * @return void
     */
    public function bootstrap(Application $app)
    {
        $app->singleton('translation.loader', function ($app) {
            return new FileLoader($app['files'], $app['path.lang']);
        });

        $app->singleton('translator', function ($app) {
            $loader = $app['translation.loader'];

            // When registering the translator component, we'll need to set the default
            // locale as well as the fallback locale. So, we'll grab the application
            // configuration so we can easily get both of these values from there.
            $locale = $app['config']['app.locale'];

            $trans = new Translator($loader, $locale);

            $trans->setFallback($app['config']['app.fallback_locale']);

            return $trans;
        });

        $app->singleton('translator.localization', function ($app) {
            $locale = setting('default_language', $app['config']['app.locale']);
            $config['supportedLocales'] = setting('supported_languages', []);
            $config['detectBrowserLocale'] = setting('detect_language', []);

            return new Localization($app['request'], $locale, $config);
        });
    }
}