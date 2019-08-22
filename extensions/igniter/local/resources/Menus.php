<?php namespace Igniter\Local\Resources;

use Igniter\Api\Classes\ApiController;

/**
 * Menus API Controller
 */
class Menus extends ApiController
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
        'model' => \Admin\Models\Menus_model::class,
        'transformer' => \Igniter\Local\Resources\Transformers\MenuTransformer::class,
    ];
}