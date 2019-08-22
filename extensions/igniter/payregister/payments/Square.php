<?php namespace Igniter\PayRegister\Payments;

use Admin\Classes\BasePaymentGateway;
use ApplicationException;
use Exception;
use Omnipay\Omnipay;

class Square extends BasePaymentGateway
{
    public function getHiddenFields()
    {
        return [
            'square_card_nonce' => '',
        ];
    }

    public function isTestMode()
    {
        return $this->model->transaction_mode != 'live';
    }

    public function getAppId()
    {
        return $this->isTestMode() ? $this->model->test_app_id : $this->model->live_app_id;
    }

    public function getAccessToken()
    {
        return $this->isTestMode() ? $this->model->test_access_token : $this->model->live_access_token;
    }

    public function getLocationId()
    {
        return $this->isTestMode() ? $this->model->test_location_id : $this->model->live_location_id;
    }

    public function beforeRenderPaymentForm($host, $controller)
    {
        $controller->addJs('https://js.squareup.com/v2/paymentform', 'square-js');
        $controller->addJs('~/extensions/igniter/payregister/assets/process.square.js', 'process-square-js');
    }

    /**
     * Processes payment using passed data.
     *
     * @param array $data
     * @param \Admin\Models\Payments_model $host
     * @param \Admin\Models\Orders_model $order
     *
     * @return bool|\Illuminate\Http\RedirectResponse
     * @throws \ApplicationException
     */
    public function processPaymentForm($data, $host, $order)
    {
        $paymentMethod = $order->payment_method;
        if (!$paymentMethod OR $paymentMethod->code != $host->code)
            throw new ApplicationException('Payment method not found');

        if (!$this->isApplicable($order->order_total, $host))
            throw new ApplicationException(sprintf(
                lang('igniter.payregister::default.alert_min_order_total'),
                currency_format($host->order_total),
                $host->name
            ));

        try {
            $gateway = $this->createGateway();
            $fields = $this->getPaymentFormFields($order, $data);
            $response = $gateway->purchase($fields)->send();

            if (!$response->isSuccessful()) {
                $order->logPaymentAttempt('Payment error -> '.$response->getMessage(), 1, $fields, $response->getData());
                throw new Exception($response->getMessage());
            }

            if ($order->markAsPaymentProcessed()) {
                $order->logPaymentAttempt('Payment successful', 1, $fields, $response->getData());
                $order->updateOrderStatus($paymentMethod->order_status, ['notify' => FALSE]);
            }
        }
        catch (Exception $ex) {
            \Log::error($ex->getMessage());
            throw new ApplicationException('Sorry, there was an error processing your payment. Please try again later.');
        }
    }

    /**
     * @return \Omnipay\Square\Gateway|\Omnipay\Common\GatewayInterface
     */
    protected function createGateway()
    {
        $gateway = Omnipay::create('Square');

        $gateway->setAppId($this->getAppId());
        $gateway->setAccessToken($this->getAccessToken());
        $gateway->setLocationId($this->getLocationId());

        return $gateway;
    }

    protected function getPaymentFormFields($order, $data = [])
    {
        return [
            'idempotencyKey' => uniqid(),
            'amount' => number_format($order->order_total, 2, '.', ''),
            'currency' => currency()->getUserCurrency(),
            'nonce' => array_get($data, 'square_card_nonce'),
            'note' => 'Payment for Order '.$order->order_id,
            'referenceId' => (string)$order->order_id,
        ];
    }
}