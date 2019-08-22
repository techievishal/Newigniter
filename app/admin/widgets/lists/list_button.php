<?php

foreach ($columns as $key => $column) {
    if($column->columnName == 'staff_status'){
       if($this->getColumnValue($record, $column)  == 'Enabled'){
       $btnText = 'Lock';
       $btnClass = 'btn-success'; 
       $message = 'Disable'; 
       }else{
        $btnText = 'Enter';
       $btnClass = 'btn-primary';  
       $message = 'Enable';   
       }
       ?>
        <a class="btn <?= $btnClass ?>" id="<?= $message; ?>_<?= $record->getKey(); ?>" data-request-form="#list-form" data-request="onDelete" data-request-data="_method:'DELETE'" 
        data-request-confirm="Are you sure you want to <?= $message ?> user" tabindex="0" data-original-title="" title="">
        <?= $btnText ?>
        </a>
        <input
                        type="text"
                        id="<?= 'status-'.$record->getKey() ?>"
                        class="custom-control-input"
                        value="<?= $this->getColumnValue($record, $column)?>" name="userAvailabilityCheck[<?= $record->getKey() ?>]"
                    />
        <?php
    }
 }
 
?>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

<script>
jQuery("a.btn").click(function(){

    var message = (jQuery(this).attr("id").split('_'));
    if(message[0] == 'Disable'){
       //    $("#status-"+message[1]).val('0');
    }else{
       // $("#status-"+message[1]).val('1');
    }

    $(this).prop("checked", 1);
    $("#checkbox-"+message[1]).prop("checked",1);



    
});

</script>


