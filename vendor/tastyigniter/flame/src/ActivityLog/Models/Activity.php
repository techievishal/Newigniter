<?php namespace Igniter\Flame\ActivityLog\Models;

use Igniter\Flame\ActivityLog\ActivityLogger;
use Igniter\Flame\ActivityLog\Contracts\ActivityInterface;
use Igniter\Flame\Database\Builder;
use InvalidArgumentException;
use Model;
use ReflectionClass;

/**
 * Activity Model Class
 *
 * @package        Igniter\Flame\ActivityLog\Models
 */
class Activity extends Model
{
    /**
     * @var array Auto-fill the created date field on insert
     */
    const CREATED_AT = 'date_added';

    const UPDATED_AT = 'date_updated';

    protected static $callbacks = [];

    protected static $activityTypes;

    /**
     * @var string The database table name
     */
    public $table = 'activities';

    /**
     * @var string The database table primary key
     */
    public $primaryKey = 'activity_id';

    public $timestamps = TRUE;

    public $casts = [
        'properties' => 'collection',
    ];

    public $dates = ['read_at', 'deleted_at'];

    public $relation = [
        'morphTo' => [
            'user' => [],
            'subject' => [],
            'causer' => [],
        ],
    ];

    //
    // Accessors & Mutators
    //

    public function getUrlAttribute()
    {
        $activity = self::getActivityTypeByType($this->type);

        if (!$activity OR !class_exists($activity->className))
            return '';

        return $activity->className::getUrl($this);

    }

    public function getMessageAttribute()
    {
        $activity = self::getActivityTypeByType($this->type);

        if (!$activity OR !class_exists($activity->className))
            return '';

        $message = $activity->className::getMessage($this);

        return app(ActivityLogger::class)->replacePlaceholders($message, $this);
    }

    //
    // Scopes
    //

    /**
     * Scope a query to only include activities by a given user.
     *
     * @param \Igniter\Flame\Database\Builder $query
     * @param Model $user
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeUser(Builder $query, Model $user)
    {
        return $query
            ->where('user_type', $user->getMorphClass())
            ->where('user_id', $user->getKey());
    }

    /**
     * Scope a query to only include activities by a given causer.
     *
     * @param \Igniter\Flame\Database\Builder $query
     * @param Model $causer
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeCausedBy(Builder $query, Model $causer)
    {
        return $query
            ->where('causer_type', $causer->getMorphClass())
            ->where('causer_id', $causer->getKey());
    }

    /**
     * Scope a query to only include activities for a given subject.
     *
     * @param \Igniter\Flame\Database\Builder $query
     * @param Model $subject
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeForSubject(Builder $query, Model $subject)
    {
        return $query
            ->where('subject_type', $subject->getMorphClass())
            ->where('subject_id', $subject->getKey());
    }

    //
    // Registration
    //

    /**
     * Returns a list of the registered activity types.
     * @return array
     */
    public static function getActivityTypes()
    {
        if (self::$activityTypes === null) {
            (new static)->loadActivityTypes();
        }

        return self::$activityTypes;
    }

    /**
     * Returns a registered activity types.
     * @param string $type
     * @return object
     */
    protected static function getActivityTypeByType($type)
    {
        return collect(self::getActivityTypes())->first(function ($activityType) use ($type) {
            return $activityType->type == $type;
        });
    }

    /**
     * Loads registered activity types from extensions
     * @return void
     */
    public function loadActivityTypes()
    {
        if (!static::$activityTypes) {
            static::$activityTypes = [];
        }

        foreach (static::$callbacks as $callback) {
            $callback($this);
        }
    }

    /**
     * Registers the activity types.
     * @param array $definitions
     */
    public function registerActivityTypes(array $definitions)
    {
        foreach ($definitions as $className) {
            $this->registerActivityType($className);
        }
    }

    public function registerActivityType($className)
    {
        if (!(new ReflectionClass($className))->implementsInterface(ActivityInterface::class))
            throw new InvalidArgumentException('Activity type '.$className.' must implement '.ActivityInterface::class);

        static::$activityTypes[$className] = (object)[
            'type' => $className::getType(),
            'className' => $className,
            'subjectModel' => $className::getSubjectModel(),
        ];
    }

    /**
     * Registers a callback function that defines activity types.
     * The callback function should register permissions by calling the manager's
     * registerActivityTypes() function. The manager instance is passed to the
     * callback function as an argument. Usage:
     * <pre>
     *   Resource::registerCallback(function($manager){
     *       $manager->registerActivityTypes([...]);
     *   });
     * </pre>
     *
     * @param callable $callback A callable function.
     */
    public static function registerCallback(callable $callback)
    {
        self::$callbacks[] = $callback;
    }
}