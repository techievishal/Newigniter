<?php
$buttonAttributes = $this->getButtonAttributes($record, $column);
?>
<?php if (strlen($buttonAttributes)) { ?>
    <a class="btn btn-success">
        Lock
    </a>
<?php } ?>
