<?php namespace Igniter\Local\Resources;

use Igniter\Api\Classes\ApiController;

/**
 * Categories API Controller
 */
class Categories extends ApiController
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
        'model' => \Admin\Models\Categories_model::class,
        'transformer' => \Igniter\Local\Resources\Transformers\CategoryTransformer::class,
    ];
}