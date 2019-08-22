<?php if ($canRegister) { ?>
    <?= form_open(current_url(),
        [
            'role' => 'form',
            'method' => 'POST',
            'data-request' => 'account::onRegister',
        ]
    ); ?>

    <div class="form-row">
        <div class="col-sm-12">
            <div class="form-group">
            <label for="firstname">First Name</label>
                <input
                    type="text"
                    id="first-name"
                    class="form-control input-lg"
                    value="<?= set_value('first_name'); ?>"
                    name="first_name"
                    placeholder="<?= lang('igniter.user::default.settings.label_first_name'); ?>"
                    autofocus="">
                <?= form_error('first_name', '<span class="text-danger">', '</span>'); ?>
            </div>
        </div>        
    </div>
    <div class="form-row">
        <div class="col-sm-12">
            <div class="form-group">
            <label for="lastname">Last Name</label>
                <input
                    type="text"
                    id="last-name"
                    class="form-control input-lg"
                    value="<?= set_value('last_name'); ?>"
                    name="last_name"
                    placeholder="<?= lang('igniter.user::default.settings.label_last_name'); ?>">
                <?= form_error('last_name', '<span class="text-danger">', '</span>'); ?>
            </div>
        </div>
    </div>
    <div class="form-group">
    <label for="email">Email</label>
        <input
            type="text"
            id="email"
            class="form-control input-lg"
            value="<?= set_value('email'); ?>"
            name="email"
            placeholder="<?= lang('igniter.user::default.settings.label_email'); ?>">
        <?= form_error('email', '<span class="text-danger">', '</span>'); ?>
    </div>
    <div class="form-row">
        <div class="col-sm-12">
            <div class="form-group">
            <label for="password">Password</label>
                <input
                    type="password"
                    id="password"
                    class="form-control input-lg"
                    value=""
                    name="password"
                    placeholder="<?= lang('igniter.user::default.login.label_password'); ?>">
                <?= form_error('password', '<span class="text-danger">', '</span>'); ?>
            </div>
        </div>
        
    </div>





    <div class="row">
        <div class="col-12 mb-2">
            <button
                type="submit"
                class="btn btn-primary btn-block btn-lg"
            ><?= lang('igniter.user::default.login.button_register'); ?></button>
        </div>
    
    </div>
    <?= form_close(); ?>
<?php } else { ?>
    <p><?= lang('igniter.user::default.login.alert_registration_disabled') ?></p>
<?php } ?>

