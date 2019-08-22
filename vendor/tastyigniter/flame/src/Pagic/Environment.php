<?php

namespace Igniter\Flame\Pagic;

use File;
use LogicException;
use Main\Contracts\TemplateLoader;

class Environment
{
    protected $globals;

    protected $runtimeInitialized = FALSE;

    protected $loadedTemplates;

    protected $staging;

    public $loader;

    protected $cache;

    /**
     * @var array Cache for global variables.
     */
    protected static $globalsCache;

    protected $templateClassPrefix = '__PagicTemplate_';

    public $optionsHash;

    /**
     * Constructor.
     * Available options:
     *  * debug: When set to true, it automatically set "auto_reload" to true as
     *           well (default to false).
     *  * charset: The charset used by the templates (default to UTF-8).
     *  * templateClass: The base template class to use for generated
     *                         templates.
     *  * cache: An absolute path where to store the compiled templates,
     *           or false to disable compilation cache.
     *
     * @param TemplateLoader $loader
     * @param array $options An array of options
     */
    public function __construct(TemplateLoader $loader, $options = [])
    {
        $this->setLoader($loader);

        $options = array_merge([
            'debug'         => FALSE,
            'charset'       => 'UTF-8',
            'templateClass' => 'Igniter\Flame\Pagic\Template',
            'cache'         => FALSE,
        ], $options);

        $this->debug = (bool)$options['debug'];
        $this->charset = strtoupper($options['charset']);
        $this->templateClass = $options['templateClass'];
        $this->setCache($options['cache']);
    }

    public function setLoader(TemplateLoader $loader)
    {
        $this->loader = $loader;
    }

    /**
     * Gets the Loader instance.
     * @return TemplateLoader
     */
    public function getLoader()
    {
        if (null === $this->loader) {
            throw new LogicException('You must set a loader first.');
        }

        return $this->loader;
    }

    /**
     * Sets the default template charset.
     *
     * @param string $charset The default charset
     */
    public function setCharset($charset)
    {
        $this->charset = strtoupper($charset);
    }

    /**
     * Gets the default template charset.
     * @return string The default charset
     */
    public function getCharset()
    {
        return $this->charset;
    }

    /**
     * Gets the current cache implementation.
     *
     * @return \Igniter\Flame\Pagic\Cache\FileSystem
     */
    public function getCache()
    {
        return $this->cache;
    }

    /**
     * Sets the current cache implementation.
     *
     * @param \Igniter\Flame\Pagic\Cache\FileSystem
     */
    public function setCache($cache)
    {
        $this->cache = $cache;
    }

    public function getTemplateClass()
    {
        return $this->templateClass;
    }

    /**
     * Renders a template.
     *
     * @param string $name The template name
     * @param array $context An array of parameters to pass to the template
     *
     * @return string The rendered template
     * @throws \Exception
     * @throws \Throwable
     */
    public function render($name, array $context = [])
    {
        return $this->load($name)->render($context);
    }

    /**
     * Loads a template.
     *
     * @param string|Template $name The template name
     *
     * @return Template
     * @throws \Exception
     */
    public function load($name)
    {
        $fileCache = $this->getCache();
        $key = $fileCache->getCacheKey($name, TRUE);

        if (isset($this->loadedTemplates[$key])) {
            return $this->loadedTemplates[$key];
        }

        $isFresh = $this->isTemplateFresh($name, $fileCache->getTimestamp($key));

        if (!$isFresh OR !File::isFile($key)) {
            $loader = $this->getLoader();
            $content = $loader->getMarkup($name);

            $fileCache->write($key, $content);
        }

        $class = $this->getTemplateClass();

        return $this->loadedTemplates[$name] = new $class($this, $key);
    }

    /**
     * Returns true if the template is still fresh.
     *
     * @param string $name The template name
     * @param int $time The last modification time of the cached template
     *
     * @return bool true if the template is fresh, false otherwise
     * @throws \Exception
     */
    public function isTemplateFresh($name, $time)
    {
        return $this->getLoader()->isFresh($name, $time);
    }

    /**
     * Registers a Global.
     *
     * New globals can be added before compiling or rendering a template;
     * but after, you can only update existing globals.
     *
     * @param string $name The global name
     * @param mixed $value The global value
     */
    public function addGlobal($name, $value)
    {
        self::$globalsCache[$name] = $value;
    }

    /**
     * Gets the registered Globals.
     *
     * @return array An array of globals
     */
    public function getGlobals()
    {
        return self::$globalsCache;
    }

    /**
     * Merges a context with the defined globals.
     *
     * @param array $context An array representing the context
     *
     * @return array The context merged with the globals
     */
    public function mergeGlobals(array $context)
    {
        // we don't use array_merge as the context being generally
        // bigger than globals, this code is faster.
        foreach ($this->getGlobals() as $key => $value) {
            if (!array_key_exists($key, $context)) {
                $context[$key] = $value;
            }
        }

        return $context;
    }
}