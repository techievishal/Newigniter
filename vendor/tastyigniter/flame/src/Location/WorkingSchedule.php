<?php namespace Igniter\Flame\Location;

use Carbon\Carbon;
use DateInterval;
use DateTime;
use DateTimeImmutable;
use DateTimeInterface;
use DateTimeZone;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use InvalidArgumentException;

class WorkingSchedule
{
    protected $type;

    protected $timezone;

    /**
     * @var \Igniter\Flame\Location\WorkingPeriod[] Holds working periods
     */
    protected $periods = [];

    /**
     * @var \Igniter\Flame\Location\WorkingPeriod[] Holds working periods exceptions
     */
    protected $exceptions = [];

    protected $days;

    /**
     * @var DateTime
     */
    protected $now;

    /**
     * @param null $timezone
     * @param int $days
     */
    public function __construct($timezone = null, $days = 5)
    {
        $this->timezone = $timezone ? new DateTimeZone($timezone) : null;
        $this->days = $days;

        $this->periods = WorkingDay::mapDays(function () {
            return new WorkingPeriod;
        });
    }

    /**
     * @param $days
     * @param $periods
     * @param array $exceptions
     * @return self
     *
     * $periods = [
     *    [
     *      'day' => 'monday',
     *      'open' => '09:00',
     *      'close' => '12:00'
     *    ],
     *    [
     *      'day' => 'monday',
     *      'open' => '09:00',
     *      'close' => '12:00'
     *    ],
     *    'wednesday' => [
     *      ['09:00', '12:00'],
     *      ['09:00', '12:00']
     *    ]
     * ];
     */
    public static function create($days, $periods, $exceptions = [])
    {
        return (new static(null, $days))->fill([
            'periods' => $periods,
            'exceptions' => $exceptions,
        ]);
    }

    public function fill($data)
    {
        $exceptions = Arr::get($data, 'exceptions', []);
        $periods = $this->parsePeriods(Arr::get($data, 'periods', []));

        $this->setPeriods($periods);
        $this->setExceptions($exceptions);

        return $this;
    }

    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    public function setNow(DateTime $now)
    {
        $this->now = $now;

        return $this;
    }

    public function setTimezone($timezone)
    {
        $this->timezone = new DateTimeZone($timezone);
    }

    public function exceptions(): array
    {
        return $this->exceptions;
    }

    //
    //
    //

    /**
     * @param string $day
     * @return \Igniter\Flame\Location\WorkingPeriod
     * @throws \Igniter\Flame\Location\Exceptions\WorkingHourException
     */
    public function forDay(string $day): WorkingPeriod
    {
        $day = WorkingDay::normalizeName($day);

        return $this->periods[$day];
    }

    /**
     * @param \DateTimeInterface $date
     * @return \Igniter\Flame\Location\WorkingPeriod
     */
    public function forDate(DateTimeInterface $date): WorkingPeriod
    {
        $date = $this->applyTimezone($date);

        return $this->exceptions[$date->format('Y-m-d')]
            ?? ($this->exceptions[$date->format('m-d')]
                ?? $this->forDay(WorkingDay::onDateTime($date)));
    }

    public function isOpen()
    {
        return $this->isOpenAt(new DateTime());
    }

    public function isOpening()
    {
        return $this->nextOpenAt(new DateTime()) ? TRUE : FALSE;
    }

    public function isClosed()
    {
        return $this->isClosedAt(new DateTime());
    }

    public function isOpenOn(string $day): bool
    {
        return count($this->forDay($day)) > 0;
    }

    public function isClosedOn(string $day): bool
    {
        return !$this->isOpenOn($day);
    }

    public function isOpenAt(DateTimeInterface $dateTime): bool
    {
        $dateTime = $this->applyTimezone($dateTime);

        return $this->forDate($dateTime)->isOpenAt(
            WorkingTime::fromDateTime($dateTime)
        );
    }

    public function isClosedAt(DateTimeInterface $dateTime): bool
    {
        return !$this->isOpenAt($dateTime);
    }

    public function nextOpenAt(DateTimeInterface $dateTime): DateTimeInterface
    {
        if (!$dateTime instanceof DateTimeImmutable)
            $dateTime = clone $dateTime;

        $nextOpenAt = $this->forDate($dateTime)->nextOpenAt(
            WorkingTime::fromDateTime($dateTime)
        );

        while ($nextOpenAt === FALSE) {
            $dateTime = $dateTime->modify('+1 day')->setTime(0, 0);
            $workingTime = WorkingTime::fromDateTime($dateTime);

            $forDate = $this->forDate($dateTime);
            $nextOpenAt = !$forDate->isEmpty()
                ? $forDate->nextOpenAt($workingTime)
                : $workingTime;
        }

        $dateTime = $dateTime->setTime(
            $nextOpenAt->toDateTime()->format('G'),
            $nextOpenAt->toDateTime()->format('i')
        );

        return $dateTime;
    }

    /**
     * Returns the next closed time.
     *
     * @param \DateTimeInterface $dateTime
     * @return \DateTimeInterface
     */
    public function nextCloseAt(DateTimeInterface $dateTime): DateTimeInterface
    {
        if (!$dateTime instanceof DateTimeImmutable)
            $dateTime = clone $dateTime;

        $nextCloseAt = $this->forDate($dateTime)->nextCloseAt(
            WorkingTime::fromDateTime($dateTime)
        );

        while ($nextCloseAt === FALSE) {
            $dateTime = $dateTime->modify('+1 day')->setTime(0, 0);
            $workingTime = WorkingTime::fromDateTime($dateTime);

            $forDate = $this->forDate($dateTime);
            $nextCloseAt = !$forDate->isEmpty()
                ? $forDate->nextCloseAt($workingTime)
                : $workingTime;
        }

        $dateTime = $dateTime->setTime(
            $nextCloseAt->toDateTime()->format('G'),
            $nextCloseAt->toDateTime()->format('i')
        );

        return $dateTime;
    }

    /**
     * @param DateTime|null $dateTime
     * @return WorkingPeriod
     */
    public function getPeriod($dateTime = null)
    {
        return $this->forDate($this->parseDate($dateTime));
    }

    public function getPeriods()
    {
        return $this->periods;
    }

    public function getOpenTime($format = null)
    {
        $time = $this->nextOpenAt(new DateTime());

        return ($time AND $format) ? $time->format($format) : $time;
    }

    public function getCloseTime($format = null)
    {
        $time = $this->nextCloseAt(new DateTime());

        return ($time AND $format) ? $time->format($format) : $time;
    }

    /**
     * @param DateTime|mixed Date or timestamp
     *
     * @return string
     */
    public function checkStatus($dateTime = null)
    {
        $dateTime = $this->parseDate($dateTime);

        if ($this->isOpenAt($dateTime))
            return WorkingPeriod::OPEN;

        if ($this->nextOpenAt($dateTime))
            return WorkingPeriod::OPENING;

        if ($this->isClosedAt($dateTime))
            return WorkingPeriod::CLOSED;

        return WorkingPeriod::CLOSED;
    }

    /**
     * @param int $interval
     * @param \DateTime|null $dateTime
     * @return Collection
     * @throws \Exception
     */
    public function getTimeslot(int $interval = 15, DateTime $dateTime = null)
    {
        $dateTime = Carbon::instance($this->parseDate($dateTime));
        $checkDateTime = $dateTime->copy()->addMinutes($interval);
        $dateInterval = new DateInterval('PT'.($interval ?: 15).'M');

        $start = $dateTime->copy()->startOfDay()->subDay();
        $end = $dateTime->copy()->startOfDay()->addDay($this->days);

        $result = [];
        for ($date = $start; $date->lte($end); $date->addDay()) {
            $indexValue = $date->toDateString();
            $timeslot = $this->filterTimeslot(
                $this->forDate($date)->timeslot($dateInterval),
                $indexValue, $checkDateTime
            );

            if ($timeslot->isEmpty())
                continue;

            // Use date string as array key to allow range to span over a week.
            $result[$indexValue] = $timeslot;
        }

        return collect($result)->sort();
    }

    protected function now()
    {
        return $this->now ?? $this->now = new DateTime();
    }

    protected function setPeriods(array $periods)
    {
        foreach ($periods as $day => $period) {
            $this->periods[$day] = WorkingPeriod::create($period);
        }
    }

    protected function setExceptions(array $exceptions)
    {
        foreach ($exceptions as $day => $exception) {
            $this->exceptions[$day] = WorkingPeriod::create($exception);
        }
    }

    protected function parseDate($start = null)
    {
        if (!$start)
            return $this->now();

        if (is_string($start))
            return new DateTime($start);

        if ($start instanceof DateTime)
            return $start;

        throw new InvalidArgumentException('The datetime must be an instance of DateTime.');
    }

    protected function parsePeriods($periods)
    {
        $parsedPeriods = [];
        foreach ($periods as $day => $period) {
            if ($period instanceof Contracts\WorkingHourInterface) {
                if (!$period->isEnabled()) continue;

                $day = WorkingDay::normalizeName($period->getDay());
                $parsedPeriods[$day][] = [
                    $period->getOpen(),
                    $period->getClose(),
                ];
            }
            else if (is_array($period)) {
                $day = WorkingDay::normalizeName($day);
                $parsedPeriods[$day] = array_merge(
                    $parsedPeriods[$day] ?? [], $period
                );
            }
        }

        return $parsedPeriods;
    }

    protected function applyTimezone(DateTimeInterface $date)
    {
        if ($this->timezone AND method_exists($date, 'setTimezone'))
            $date = $date->setTimezone($this->timezone);

        return $date;
    }

    protected function filterTimeslot(Collection $timeslot, string $date, DateTime $checkDateTime)
    {
        return $timeslot->map(function (WorkingTime $slot) use ($date) {
            return new DateTime($date.' '.$slot->format());
        })->filter(function (DateTime $dateTime) use ($checkDateTime) {
            return Carbon::instance($checkDateTime)->lte($dateTime);
        })->values();
    }
}
