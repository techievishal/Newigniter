<?= form_open(current_url(),
    [
        'role' => 'form',
        'method' => 'POST',
        'data-request' => 'account::onLogin',
    ]
); ?>

<div class="form-group">
    <div class="input-group">
       <input
            type="text"
            name="email"
            id="login-email"
            class="form-control input-lg"
            placeholder="<?= lang('igniter.user::default.settings.label_email'); ?>"
            autofocus=""
            required
        />
        
    </div>
    <?= form_error('email', '<span class="text-danger">', '</span>'); ?>
</div>

<div class="form-group">
    <div class="input-group">
        <input
            type="password"
            name="password"
            id="login-password"
            class="form-control input-lg"
            placeholder="<?= lang('igniter.user::default.settings.label_password'); ?>"
            required
        />
        
    </div>
    <?= form_error('password', '<span class="text-danger">', '</span>'); ?>
</div>



<div class="form-group">
    <div class="row">
        <div class="col-12">
            <button
                type="submit"
                class="btn btn-primary btn-block btn-lg"
            ><?= lang('igniter.user::default.login.button_login'); ?></button>
        </div>
    </div>
</div>

<?= form_close(); ?>

