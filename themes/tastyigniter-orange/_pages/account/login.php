---
title: main::lang.account.login.title
layout: default
permalink: /login

'[session]':
    security: guest

'[account]':
---
<div class="container">
    <div class="row">
        <div class="col-sm-4 mx-auto my-5">
            <div class="card">
                <div class="card-body">
                    <h1 class="card-title h4 mb-4 font-weight-normal">
                        <?= lang('main::lang.account.login.text_login'); ?>
                    </h1>

                    <?= partial('account::login'); ?>

                    
                </div>
            </div>
        </div>
    </div>
</div>
