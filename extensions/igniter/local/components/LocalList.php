<?php

namespace Igniter\Local\Components;

use Admin\Models\Locations_model;
use Igniter\Local\Traits\SearchesNearby;
use Location;

class LocalList extends \System\Classes\BaseComponent
{
    use SearchesNearby;

    protected $userPosition;

    public function onRun()
    {
        $this->addCss('css/local.css', 'local-css');

        $this->id = uniqid($this->alias);
        $this->page['distanceUnit'] = $this->property('distanceUnit', setting('distance_unit'));
        $this->page['showReviews'] = $this->property('showReviews', setting('allow_reviews'));
        $this->page['timeFormat'] = $this->property('timeFormat', 'D '.setting('time_format'));
        $this->page['filterSearch'] = input('search');
        $this->page['filterSorted'] = input('sort_by');
        $this->page['filterSorters'] = $this->loadFilters();

        $this->page['userPosition'] = $this->userPosition = Location::userPosition();

        $this->page['locationsList'] = $this->loadList();
    }

    protected function loadList()
    {
        $sortBy = $this->param('sort_by');

        if ($sortBy == 'distance' AND !$this->userPosition->isValid()) {
            flash()->warning('Could not determine user location')->now();
            $sortBy = null;
        }

        switch ($sortBy) {
            case 'distance':
                $sortBy = 'distance asc';
                break;
            case 'newest':
                $sortBy = 'location_id desc';
                break;
            case 'rating':
                $sortBy = 'reviews_count desc';
                break;
            case 'name':
                $sortBy = 'location_name asc';
                break;
        }

        $options = [
            'page' => $this->param('page'),
            'pageLimit' => $this->property('pageLimit'),
            'search' => $this->param('search'),
            'sort' => $sortBy,
        ];

        if ($coordinates = $this->userPosition->getCoordinates()) {
            $options['latitude'] = $coordinates->getLatitude();
            $options['longitude'] = $coordinates->getLongitude();
        }

        $list = Locations_model::withCount([
            'reviews' => function ($q) {
                $q->isApproved();
            },
        ])->isEnabled()->listFrontEnd($options);

        return $list;
    }

    protected function loadFilters()
    {
        $url = page_url().'?';
        if ($filterSearch = input('search')) {
            $url .= 'search='.$filterSearch.'&';
        }

        $filters = [
            'distance' => [
                'name' => lang('igniter.local::default.text_filter_distance'),
                'href' => $url.'sort_by=distance',
            ],
            'newest' => [
                'name' => lang('igniter.local::default.text_filter_newest'),
                'href' => $url.'sort_by=newest',
            ],
            'rating' => [
                'name' => lang('igniter.local::default.text_filter_rating'),
                'href' => $url.'sort_by=rating',
            ],
            'name' => [
                'name' => lang('igniter.local::default.text_filter_name'),
                'href' => $url.'sort_by=name',
            ],
        ];

        return $filters;
    }
}