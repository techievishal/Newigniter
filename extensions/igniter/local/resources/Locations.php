<?php namespace Igniter\Local\Resources;

use Igniter\Api\Classes\ApiController;

/**
 * Locations API Controller
 */
class Locations extends ApiController
{
    public $restConfig = [
        'actions' => [
            'index' => [
                'pageSize' => 20,
            ],
            'store' => [],
            'show' => [],
            'update' => [],
            'destroy' => [],
        ],
        'relations' => [],
        'model' => \Admin\Models\Locations_model::class,
        'transformer' => \Igniter\Local\Resources\Transformers\LocationTransformer::class,
    ];
}