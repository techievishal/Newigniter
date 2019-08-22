<?php foreach ($records as $record) { ?>
    <tr style="">
        <?php if ($showDragHandle) { ?>
           <!-- <td class="list-action">
                <div class="btn btn-handle">
                    <i class="fa fa-bars"></i>
                </div>
            </td> -->
        <?php } ?>

        <?php if ($showCheckboxes) { ?>
            <td class="list-action">
                <div class="custom-control custom-checkbox" style="visibility:hidden" >
                    <input 
                        type="checkbox"
                        id="<?= 'checkbox-'.$record->getKey() ?>"
                        class="custom-control-input"
                        value="<?= $record->getKey(); ?>" name="checked[]"
                    />

                    <label class="custom-control-label" for="<?= 'checkbox-'.$record->getKey() ?>">&nbsp;</label>
                </div> 
            </td>
        <?php } ?>

        <?php foreach ($columns as $key => $column) { ?>
            <?php if ($column->type != 'button') continue; ?>
            <td class="list-action <?= $column->cssClass ?>">
                <?= $this->makePartial('lists/list_button', ['record' => $record, 'column' => $columns]) ?>
            </td>
        <?php } ?>

        <?php $index = $url = 0; ?>
        <?php foreach ($columns as $key => $column) { ?>
            <?php $index++; ?>
            <?php if ($column->type == 'button') continue; ?>
            <td
                class="list-col-index-<?= $index ?> list-col-name-<?= $column->getName() ?> list-col-type-<?= $column->type ?> <?= $column->cssClass ?>"
            >
            
                <?= $this->getColumnValue($record, $column) ?>
            </td>
        <?php } ?>

        <?php if ($showSetup) { ?>
            <td class="list-setup">&nbsp;</td>
        <?php } ?>
    </tr>
<?php } ?>
