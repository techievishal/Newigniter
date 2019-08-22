<div class="row-fluid">
         <!-- Form -->
         <div id="toolbar" class="toolbar btn-toolbar ">
         </div>
    <div id="form-outside-tabs">
   <div class="form-fields col-md-12">
        <!-- <form method='post' action='/uploadFile' enctype='multipart/form-data' > -->
         <?= form_open(current_url(),
        [
            'id'     => 'edit-form',
            'role'   => 'form',
            'method' => 'POST',
        ]
    ); ?>
       <input type='file' name='file' >
       <input type='submit' name='submit' value='Import'>
     </form>
     </div>
     </div>
</div>

