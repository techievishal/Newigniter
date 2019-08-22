<?php

return [
    'fields' => [
        'setup' => [
            'type' => 'section',
            'comment' => 'lang:igniter.payregister::default.square.help_square',
        ],
        'transaction_mode' => [
            'label' => 'lang:igniter.payregister::default.square.label_transaction_mode',
            'type' => 'radio',
            'default' => 'test',
            'options' => [
                'test' => 'lang:igniter.payregister::default.square.text_test',
                'live' => 'lang:igniter.payregister::default.square.text_live',
            ],
        ],
        'live_app_id' => [
            'label' => 'lang:igniter.payregister::default.square.label_live_app_id',
            'type' => 'text',
            'trigger' => [
                'action' => 'show',
                'field' => 'transaction_mode',
                'condition' => 'value[live]',
            ],
        ],
        'live_access_token' => [
            'label' => 'lang:igniter.payregister::default.square.label_live_access_token',
            'type' => 'text',
            'trigger' => [
                'action' => 'show',
                'field' => 'transaction_mode',
                'condition' => 'value[live]',
            ],
        ],
        'live_location_id' => [
            'label' => 'lang:igniter.payregister::default.square.label_live_location_id',
            'type' => 'text',
            'trigger' => [
                'action' => 'show',
                'field' => 'transaction_mode',
                'condition' => 'value[live]',
            ],
        ],
        'test_app_id' => [
            'label' => 'lang:igniter.payregister::default.square.label_test_app_id',
            'type' => 'text',
            'trigger' => [
                'action' => 'show',
                'field' => 'transaction_mode',
                'condition' => 'value[test]',
            ],
        ],
        'test_access_token' => [
            'label' => 'lang:igniter.payregister::default.square.label_test_access_token',
            'type' => 'text',
            'trigger' => [
                'action' => 'show',
                'field' => 'transaction_mode',
                'condition' => 'value[test]',
            ],
        ],
        'test_location_id' => [
            'label' => 'lang:igniter.payregister::default.square.label_test_location_id',
            'type' => 'text',
            'trigger' => [
                'action' => 'show',
                'field' => 'transaction_mode',
                'condition' => 'value[test]',
            ],
        ],
        'order_total' => [
            'label' => 'lang:igniter.payregister::default.label_order_total',
            'type' => 'number',
            'span' => 'left',
            'comment' => 'lang:igniter.payregister::default.help_order_total',
        ],
        'order_status' => [
            'label' => 'lang:igniter.payregister::default.label_order_status',
            'type' => 'select',
            'span' => 'right',
            'options' => ['Admin\Models\Statuses_model', 'getDropdownOptionsForOrder'],
            'comment' => 'lang:igniter.payregister::default.help_order_status',
        ],
    ],
];