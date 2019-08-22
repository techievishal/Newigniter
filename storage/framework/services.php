<?php return array (
  'providers' => 
  array (
    0 => 'Illuminate\\Broadcasting\\BroadcastServiceProvider',
    1 => 'Illuminate\\Bus\\BusServiceProvider',
    2 => 'Illuminate\\Cache\\CacheServiceProvider',
    3 => 'Illuminate\\Cookie\\CookieServiceProvider',
    4 => 'Illuminate\\Encryption\\EncryptionServiceProvider',
    5 => 'Illuminate\\Foundation\\Providers\\FoundationServiceProvider',
    6 => 'Illuminate\\Hashing\\HashServiceProvider',
    7 => 'Illuminate\\Pagination\\PaginationServiceProvider',
    8 => 'Illuminate\\Pipeline\\PipelineServiceProvider',
    9 => 'Illuminate\\Queue\\QueueServiceProvider',
    10 => 'Illuminate\\Redis\\RedisServiceProvider',
    11 => 'Illuminate\\Session\\SessionServiceProvider',
    12 => 'Illuminate\\Validation\\ValidationServiceProvider',
    13 => 'Illuminate\\View\\ViewServiceProvider',
    14 => 'Fideloper\\Proxy\\TrustedProxyServiceProvider',
    15 => 'Intervention\\Image\\ImageServiceProvider',
    16 => 'Jenssegers\\Date\\DateServiceProvider',
    17 => 'Kalnoy\\Nestedset\\NestedSetServiceProvider',
    18 => 'Laravel\\Tinker\\TinkerServiceProvider',
    19 => 'Carbon\\Laravel\\ServiceProvider',
    20 => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    21 => 'Igniter\\Flame\\Database\\DatabaseServiceProvider',
    22 => 'Igniter\\Flame\\Filesystem\\FilesystemServiceProvider',
    23 => 'Igniter\\Flame\\Flash\\FlashServiceProvider',
    24 => 'Igniter\\Flame\\Html\\HtmlServiceProvider',
    25 => 'Igniter\\Flame\\Mail\\MailServiceProvider',
    26 => 'Igniter\\Flame\\Notifications\\NotificationServiceProvider',
    27 => 'Igniter\\Flame\\Html\\UrlServiceProvider',
    28 => 'Igniter\\Flame\\Scaffold\\ScaffoldServiceProvider',
    29 => 'Igniter\\Flame\\Setting\\SettingServiceProvider',
    30 => 'System\\ServiceProvider',
  ),
  'eager' => 
  array (
    0 => 'Illuminate\\Cookie\\CookieServiceProvider',
    1 => 'Illuminate\\Encryption\\EncryptionServiceProvider',
    2 => 'Illuminate\\Foundation\\Providers\\FoundationServiceProvider',
    3 => 'Illuminate\\Pagination\\PaginationServiceProvider',
    4 => 'Illuminate\\Session\\SessionServiceProvider',
    5 => 'Illuminate\\View\\ViewServiceProvider',
    6 => 'Fideloper\\Proxy\\TrustedProxyServiceProvider',
    7 => 'Intervention\\Image\\ImageServiceProvider',
    8 => 'Jenssegers\\Date\\DateServiceProvider',
    9 => 'Kalnoy\\Nestedset\\NestedSetServiceProvider',
    10 => 'Carbon\\Laravel\\ServiceProvider',
    11 => 'Igniter\\Flame\\Database\\DatabaseServiceProvider',
    12 => 'Igniter\\Flame\\Filesystem\\FilesystemServiceProvider',
    13 => 'Igniter\\Flame\\Flash\\FlashServiceProvider',
    14 => 'Igniter\\Flame\\Notifications\\NotificationServiceProvider',
    15 => 'Igniter\\Flame\\Html\\UrlServiceProvider',
    16 => 'System\\ServiceProvider',
  ),
  'deferred' => 
  array (
    'Illuminate\\Broadcasting\\BroadcastManager' => 'Illuminate\\Broadcasting\\BroadcastServiceProvider',
    'Illuminate\\Contracts\\Broadcasting\\Factory' => 'Illuminate\\Broadcasting\\BroadcastServiceProvider',
    'Illuminate\\Contracts\\Broadcasting\\Broadcaster' => 'Illuminate\\Broadcasting\\BroadcastServiceProvider',
    'Illuminate\\Bus\\Dispatcher' => 'Illuminate\\Bus\\BusServiceProvider',
    'Illuminate\\Contracts\\Bus\\Dispatcher' => 'Illuminate\\Bus\\BusServiceProvider',
    'Illuminate\\Contracts\\Bus\\QueueingDispatcher' => 'Illuminate\\Bus\\BusServiceProvider',
    'cache' => 'Illuminate\\Cache\\CacheServiceProvider',
    'cache.store' => 'Illuminate\\Cache\\CacheServiceProvider',
    'memcached.connector' => 'Illuminate\\Cache\\CacheServiceProvider',
    'hash' => 'Illuminate\\Hashing\\HashServiceProvider',
    'Illuminate\\Contracts\\Pipeline\\Hub' => 'Illuminate\\Pipeline\\PipelineServiceProvider',
    'queue' => 'Illuminate\\Queue\\QueueServiceProvider',
    'queue.worker' => 'Illuminate\\Queue\\QueueServiceProvider',
    'queue.listener' => 'Illuminate\\Queue\\QueueServiceProvider',
    'queue.failer' => 'Illuminate\\Queue\\QueueServiceProvider',
    'queue.connection' => 'Illuminate\\Queue\\QueueServiceProvider',
    'redis' => 'Illuminate\\Redis\\RedisServiceProvider',
    'redis.connection' => 'Illuminate\\Redis\\RedisServiceProvider',
    'validator' => 'Illuminate\\Validation\\ValidationServiceProvider',
    'validation.presence' => 'Illuminate\\Validation\\ValidationServiceProvider',
    'command.tinker' => 'Laravel\\Tinker\\TinkerServiceProvider',
    'command.cache.clear' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.cache.forget' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.clear-compiled' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.auth.resets.clear' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.config.cache' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.config.clear' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.down' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.environment' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.key.generate' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.package.discover' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.preset' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.failed' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.flush' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.forget' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.listen' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.restart' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.retry' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.work' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.route.cache' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.route.clear' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.route.list' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.seed' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'Illuminate\\Console\\Scheduling\\ScheduleFinishCommand' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'Illuminate\\Console\\Scheduling\\ScheduleRunCommand' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.storage.link' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.up' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.view.clear' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.app.name' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.cache.table' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.notification.table' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.failed-table' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.queue.table' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.session.table' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.serve' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'command.vendor.publish' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'migrator' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'migration.repository' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'migration.creator' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'composer' => 'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider',
    'html' => 'Igniter\\Flame\\Html\\HtmlServiceProvider',
    'form' => 'Igniter\\Flame\\Html\\HtmlServiceProvider',
    'Igniter\\Flame\\Html\\HtmlBuilder' => 'Igniter\\Flame\\Html\\HtmlServiceProvider',
    'Igniter\\Flame\\Html\\FormBuilder' => 'Igniter\\Flame\\Html\\HtmlServiceProvider',
    'mailer' => 'Igniter\\Flame\\Mail\\MailServiceProvider',
    'swift.mailer' => 'Igniter\\Flame\\Mail\\MailServiceProvider',
    'swift.transport' => 'Igniter\\Flame\\Mail\\MailServiceProvider',
    'Illuminate\\Mail\\Markdown' => 'Igniter\\Flame\\Mail\\MailServiceProvider',
    'command.create.extension' => 'Igniter\\Flame\\Scaffold\\ScaffoldServiceProvider',
    'command.create.component' => 'Igniter\\Flame\\Scaffold\\ScaffoldServiceProvider',
    'command.create.controller' => 'Igniter\\Flame\\Scaffold\\ScaffoldServiceProvider',
    'command.create.model' => 'Igniter\\Flame\\Scaffold\\ScaffoldServiceProvider',
    'setting.manager' => 'Igniter\\Flame\\Setting\\SettingServiceProvider',
    'system.setting' => 'Igniter\\Flame\\Setting\\SettingServiceProvider',
    'system.parameter' => 'Igniter\\Flame\\Setting\\SettingServiceProvider',
    'Igniter\\Flame\\Setting\\Middleware\\SaveSetting' => 'Igniter\\Flame\\Setting\\SettingServiceProvider',
  ),
  'when' => 
  array (
    'Illuminate\\Broadcasting\\BroadcastServiceProvider' => 
    array (
    ),
    'Illuminate\\Bus\\BusServiceProvider' => 
    array (
    ),
    'Illuminate\\Cache\\CacheServiceProvider' => 
    array (
    ),
    'Illuminate\\Hashing\\HashServiceProvider' => 
    array (
    ),
    'Illuminate\\Pipeline\\PipelineServiceProvider' => 
    array (
    ),
    'Illuminate\\Queue\\QueueServiceProvider' => 
    array (
    ),
    'Illuminate\\Redis\\RedisServiceProvider' => 
    array (
    ),
    'Illuminate\\Validation\\ValidationServiceProvider' => 
    array (
    ),
    'Laravel\\Tinker\\TinkerServiceProvider' => 
    array (
    ),
    'Igniter\\Flame\\Foundation\\Providers\\ConsoleSupportServiceProvider' => 
    array (
    ),
    'Igniter\\Flame\\Html\\HtmlServiceProvider' => 
    array (
    ),
    'Igniter\\Flame\\Mail\\MailServiceProvider' => 
    array (
    ),
    'Igniter\\Flame\\Scaffold\\ScaffoldServiceProvider' => 
    array (
    ),
    'Igniter\\Flame\\Setting\\SettingServiceProvider' => 
    array (
    ),
  ),
);