<?php namespace Igniter\Frontend\Components;

use Igniter\Frontend\Models\FeaturedItems as FeaturedItemsModel;

class FeaturedItems extends \System\Classes\BaseComponent
{
    public function defineProperties()
    {
        return [
            'title' => [
                'label' => 'Title',
                'type' => 'text',
            ],
            'items' => [
                'label' => 'lang:igniter.frontend::default.featured.label_menus',
                'type' => 'selectlist',
                'mode' => 'checkbox',
            ],
            'limit' => [
                'label' => 'lang:igniter.frontend::default.featured.label_limit',
                'span' => 'left',
                'type' => 'number',
                'default' => 12,
            ],
            'itemsPerRow' => [
                'label' => 'lang:igniter.frontend::default.featured.label_items_per_row',
                'span' => 'right',
                'type' => 'select',
                'default' => 3,
                'options' => [
                    1 => 'One',
                    2 => 'Two',
                    3 => 'Three',
                    4 => 'Four',
                    5 => 'Five',
                    6 => 'Six',
                ],
            ],
            'itemWidth' => [
                'label' => 'lang:igniter.frontend::default.featured.label_dimension_w',
                'span' => 'left',
                'type' => 'number',
                'default' => 400,
            ],
            'itemHeight' => [
                'label' => 'lang:igniter.frontend::default.featured.label_dimension_h',
                'span' => 'right',
                'type' => 'number',
                'default' => 300,
            ],
        ];
    }

    public static function getItemsOptions()
    {
        return FeaturedItemsModel::dropdown('menu_name');
    }

    public function onRun()
    {
        $this->addCss('css/featured_menus.css', 'featured_menus-css');

        $this->page['featuredTitle'] = $this->property('title', lang('igniter.frontend::default.featured.text_featured_menus'));
        $this->page['featuredPerRow'] = $this->property('itemsPerRow', 3);
        $this->page['featuredWidth'] = $this->property('itemWidth', 400);
        $this->page['featuredHeight'] = $this->property('itemHeight', 300);
        $this->page['featuredMenuItems'] = $this->loadItems();
    }

    protected function loadItems()
    {
        return FeaturedItemsModel::getByIds([
            'page' => '1',
            'pageLimit' => $this->property('limit'),
            'menuIds' => $this->property('items', []),
        ]);
    }
}
