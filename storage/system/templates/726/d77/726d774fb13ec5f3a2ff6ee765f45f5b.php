<?php if ($this->theme->display_crumbs AND $breadcrumbs = []) { ?>
    <div id="breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <ol class="breadcrumb">
                        <?= $breadcrumbs; ?>
                    </ol>
                </div>
            </div>
        </div>
    </div>
<?php } ?>

