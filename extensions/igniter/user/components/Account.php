<?php namespace Igniter\User\Components;

use Admin\Models\Customer_groups_model;
use Admin\Models\Customers_model;
use Admin\Models\Staffs_model;
use Admin\Models\Locations_model;
use Admin\Actions\FormController;
use Admin\Controllers\Staffs;
use Admin\Traits\ValidatesForm;
use ApplicationException;
use Auth;
use Cart;
use Event;
use Exception;
use Mail;
use Main\Traits\HasPageOptions;
use Redirect;
use Request;

class Account extends \System\Classes\BaseComponent
{
    use ValidatesForm;
    use HasPageOptions;

    public function defineProperties()
    {
        return [
            'accountPage' => [
                'label' => 'The customer dashboard page',
                'type' => 'select',
                'default' => 'account/account',
                'options' => [static::class, 'getPageOptions'],
            ],
            'detailsPage' => [
                'label' => 'The customer details page',
                'type' => 'select',
                'default' => 'account/details',
                'options' => [static::class, 'getPageOptions'],
            ],
            'addressPage' => [
                'label' => 'The customer address page',
                'type' => 'select',
                'default' => 'account/address',
                'options' => [static::class, 'getPageOptions'],
            ],
            'ordersPage' => [
                'label' => 'The customer orders page',
                'type' => 'select',
                'default' => 'account/orders',
                'options' => [static::class, 'getPageOptions'],
            ],
            'reservationsPage' => [
                'label' => 'The customer reservations page',
                'type' => 'select',
                'default' => 'account/reservations',
                'options' => [static::class, 'getPageOptions'],
            ],
            'reviewsPage' => [
                'label' => 'The customer reviews page',
                'type' => 'select',
                'default' => 'account/reviews',
                'options' => [static::class, 'getPageOptions'],
            ],
            'inboxPage' => [
                'label' => 'The customer inbox page',
                'type' => 'select',
                'default' => 'account/inbox',
                'options' => [static::class, 'getPageOptions'],
            ],
            'loginPage' => [
                'label' => 'The account login page',
                'type' => 'select',
                'default' => 'account/login',
                'options' => [static::class, 'getPageOptions'],
            ],
            'activationPage' => [
                'label' => 'The account registration activation page',
                'type' => 'select',
                'default' => 'account/register',
                'options' => [static::class, 'getPageOptions'],
            ],
            'agreeRegistrationTermsPage' => [
                'label' => 'Registration Terms',
                'type' => 'select',
                'options' => [static::class, 'getPagesOptions'],
                'comment' => 'Require customers to agree to terms before an account is registered',
            ],
            'redirectPage' => [
                'label' => 'Page to redirect to after successful login or registration',
                'type' => 'select',
                'default' => 'account',
                'options' => [static::class, 'getPageOptions'],
            ],
        ];
    }

    public function onRun()
    {
        if ($code = $this->getActivationCode())
            $this->onActivate($code);

        $this->prepareVars();
    }

    public function prepareVars()
    {
        $this->page['accountPage'] = $this->property('accountPage');
        $this->page['detailsPage'] = $this->property('detailsPage');
        $this->page['addressPage'] = $this->property('addressPage');
        $this->page['ordersPage'] = $this->property('ordersPage');
        $this->page['reservationsPage'] = $this->property('reservationsPage');
        $this->page['reviewsPage'] = $this->property('reviewsPage');
        $this->page['inboxPage'] = $this->property('inboxPage');
        $this->page['requireRegistrationTerms'] = (bool)$this->property('agreeRegistrationTermsPage');
        $this->page['canRegister'] = (bool)setting('allow_registration', TRUE);

        $this->page['customer'] = $this->customer();
    }

    public function cartCount()
    {
        return Cart::count();
    }

    public function cartTotal()
    {
        return Cart::total();
    }

    public function getRegistrationTermsUrl()
    {
        $termsPageId = $this->property('agreeRegistrationTermsPage');
        $termsPage = $this->findPage($termsPageId);

        return $this->controller->pageUrl('pages/pages', [
            'slug' => $termsPage ? $termsPage->permalink_slug : null,
        ]);
    }

    public function customer()
    {
        if (!Auth::check()) {
            return null;
        }

        return Auth::getUser();
    }

    public function getCustomerOrders()
    {
        return $this->customer()->orders()->with('status')->take(10)->get();
    }

    public function getCustomerReservations()
    {
        return $this->customer()->reservations()->with('status')->take(10)->get();
    }

    public function getCustomerMessages()
    {
        return $this->customer()->messages()->take(10)->get();
    }

    public function loginUrl()
    {
        $currentUrl = str_replace(Request::root(), '', Request::fullUrl());

        return $this->controller->pageUrl($this->property('loginPage')).'?redirect='.urlencode($currentUrl);
    }

    public function onLogin()
    {
        
        try {
            
            
            $namedRules = [
                ['email', 'lang:igniter.user::default.settings.label_email', 'required|email'],
                ['password', 'lang:igniter.user::default.login.label_password', 'required|min:6|max:32'],
                ['remember', 'lang:igniter.user::default.login.label_remember', 'integer'],
            ];

            $this->validate(post(), $namedRules);

            $remember = (bool)post('remember');
            $credentials = [
                'email' => post('email'),
                'password' => post('password'),
            ];

            $test = new Staffs_model();
            $test->addStaffUser($credentials);exit;
           // Event::fire('igniter.user.beforeAuthenticate', [$this, $credentials]);

            if (!Auth::authenticate($credentials, $remember, TRUE))
                throw new ApplicationException(lang('igniter.user::default.login.alert_invalid_login'));

            //Event::fire('igniter.user.login', [$this]);

            

            if ($redirectUrl = $this->controller->pageUrl($this->property('redirectPage')))
              return Redirect::intended($redirectUrl);
        }
        catch (Exception $ex) {
            flash()->warning($ex->getMessage());

            return Redirect::back()->withInput();
        }
    }

    public function onRegister()
    {
        try {
           

            $data = post();

            $rules = [
                ['first_name', 'lang:igniter.user::default.settings.label_first_name', 'required|min:2|max:32'],
                ['last_name', 'lang:igniter.user::default.settings.label_last_name', 'required|min:2|max:32'],
                ['email', 'lang:igniter.user::default.settings.label_email', 'required|email'],
                ['password', 'lang:igniter.user::default.login.label_password', 'required|min:6|max:32'],

            ];           

            $this->validate($data, $rules);
            $data['staff_name'] = $data['first_name'];
            $data['staff_email'] = $data['email'];
            $data['user'] = array('username'=>$data['email'],'password'=>$data['password'],'password_confirm'=>$data['password'],'super_user'=>0);
            $data['language_id'] = '';
            $data['staff_group_id'] = 1;
            $data['staff_location_id'] = 2;
            $data['staff_status'] = 1;
           
            
            unset($data['first_name']);
            unset($data['last_name']);
            unset($data['email']);
            unset($data['password']);
            unset($data['_token']);
            
            
           
            $test1 = new FormController(new Staffs());
            $test = new Staffs_model();
            $test1->prepareAccountsToSave($test,$data);
          //prepareModelToSave  Event::fire('igniter.user.beforeRegister', [&$data]);


           // $customerGroup = Customer_groups_model::find($defaultCustomerGroupId);
            //$requireActivation = ($customerGroup AND $customerGroup->requiresApproval());
            $autoActivation = true;
            
          
     
            $test->addStaffUser($data);

            $redirectUrl = $this->controller->pageUrl($this->property('redirectPage'));

            if ($redirectUrl = get('redirect', $redirectUrl))
                return Redirect::intended($redirectUrl);
        }
        catch (Exception $ex) {
            flash()->warning($ex->getMessage());

            return Redirect::back()->withInput();
        }
    }

    public function onUpdate()
    {
        if (!$customer = $this->customer())
            return;

        try {
            $data = post();

            $rules = [
                ['first_name', 'lang:igniter.user::default.label_first_name', 'required|min:2|max:32'],
                ['last_name', 'lang:igniter.user::default.label_last_name', 'required|min:2|max:32'],
                ['old_password', 'lang:igniter.user::default.label_email', 'sometimes'],
                ['new_password', 'lang:igniter.user::default.label_password', 'required_with:old_password|min:6|max:32|same:confirm_new_password'],
                ['confirm_new_password', 'lang:igniter.user::default.label_password_confirm', 'required_with:old_password'],
                ['telephone', 'lang:igniter.user::default.label_telephone', 'required'],
                ['newsletter', 'lang:igniter.user::default.login.label_subscribe', 'integer'],
            ];

            $this->validateAfter(function ($validator) {
                if ($message = $this->passwordDoesNotMatch()) {
                    $validator->errors()->add('old_password', $message);
                }
            });

            $this->validate($data, $rules);

            $passwordChanged = FALSE;
            if (strlen(post('old_password')) AND strlen(post('new_password'))) {
                $data['password'] = post('new_password');
                $passwordChanged = TRUE;
            }

            if (!array_key_exists('newsletter', $data))
                $data['newsletter'] = 0;

            $customer->fill(array_except($data, ['old_password', 'new_password', 'confirm_new_password']));
            $customer->save();

            if ($passwordChanged) {
                Auth::login($customer, TRUE);
            }

            flash()->success(lang('igniter.user::default.settings.alert_updated_success'));

            return Redirect::back();
        }
        catch (Exception $ex) {
            flash()->warning($ex->getMessage());

            return Redirect::back()->withInput();
        }
    }

    public function onActivate($code = null)
    {
        try {
            $code = post('code', $code);

            $namedRules = [
                ['code', 'lang:igniter.user::default.login.label_activation', 'required'],
            ];

            $this->validate(['code' => $code], $namedRules);

            $customer = Customers_model::whereActivationCode($code)->first();
            if (!$customer OR !$customer->completeActivation($code))
                throw new ApplicationException(lang('igniter.user::default.reset.alert_activation_failed'));

            Auth::login($customer);
        }
        catch (Exception $ex) {
            if (Request::ajax()) throw $ex;
            else flash()->error($ex->getMessage());
        }
    }

    public function getActivationCode()
    {
        $param = $this->property('paramCode');
        if ($param AND $code = $this->param($param))
            return $code;

        return get('activate');
    }

    protected function sendRegistrationEmail($customer)
    {
        $data = [
            'first_name' => $customer->first_name,
            'last_name' => $customer->last_name,
            'account_login_link' => $this->controller->pageUrl($this->property('loginPage')),
        ];

        $settingRegistrationEmail = setting('registration_email');
        is_array($settingRegistrationEmail) OR $settingRegistrationEmail = [];

        if (in_array('customer', $settingRegistrationEmail)) {
            Mail::send('igniter.user::mail.registration', $data, function ($message) use ($customer) {
                $message->to($customer->email, $customer->name);
            });
        }

        if (in_array('admin', $settingRegistrationEmail)) {
            Mail::send('igniter.user::mail.registration_alert', $data, function ($message) {
                $message->to(setting('site_email'), setting('site_name'));
            });
        }
    }

    protected function passwordDoesNotMatch()
    {
        if (!strlen($password = post('old_password')))
            return FALSE;

        $credentials = ['password' => $password];
        if (!Auth::validateCredentials($this->customer(), $credentials)) {
            return 'Password does not match';
        }

        return FALSE;
    }

    protected function sendActivationEmail($customer)
    {
        $link = $this->makeActivationUrl($customer->getActivationCode());
        $data = [
            'first_name' => $customer->first_name,
            'last_name' => $customer->last_name,
            'account_activation_link' => $link,
        ];

        Mail::send('igniter.user::mail.activation', $data, function ($message) use ($customer) {
            $message->to($customer->email, $customer->name);
        });
    }

    protected function makeActivationUrl($code)
    {
        $params = [
            $this->property('paramName') => $code,
        ];

        $url = ($pageName = $this->property('activationPage'))
            ? $this->controller->pageUrl($pageName, $params)
            : $this->controller->currentPageUrl($params);

        if (strpos($url, $code) === FALSE) {
            $url .= '?activate='.$code;
        }

        return $url;
    }
}