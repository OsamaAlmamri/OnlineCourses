<?php if (array_key_exists('news', $this->view_data)) { ?>
<input type="hidden" name="_id" value="<?php echo($this->view_data['news']['id'])?>">
<input type="hidden" name="_logo" value="<?php echo($this->view_data['news']['logo'])?>">
<input type="hidden" name="_updates" value="<?php echo($this->view_data['news']['_updates'])?>">
<?php }?>

<div class="form-group">
    <label for="title">العنوان </label>
    <textarea class="form-control" id="text" rows="2" placeholder="العنوان " name="title" cols="50">
        <?php if (array_key_exists('news', $this->view_data)) echo($this->view_data['news']['title']); else   echo ''; ?>
    </textarea>
</div>

<div class="form-group">
    <label for="introduction">المقدمة </label>
    <textarea class="form-control" id="introduction" rows="3" placeholder="المقدمة  " name="introduction"
              cols="50">
                <?php if (array_key_exists('news', $this->view_data)) echo($this->view_data['news']['introduction']); else   echo ''; ?>

    </textarea>
</div>

<div class="form-group">
    <label for="input-description">التفاصيل</label>
    <textarea class="form-control" id="input-description" placeholder="التفاصيل  " name="editor" cols="50"
              rows="10">
                        <?php if (array_key_exists('news', $this->view_data)) echo($this->view_data['news']['editor']); else   echo ''; ?>

    </textarea>
</div>


<div class="form-group">
    <label for="sort"> الترتيب</label>
    <input class="form-control" id="sort" placeholder="الترتيب   " name="sort" type="number"
           value="<?php if (array_key_exists('news', $this->view_data)) echo($this->view_data['news']['sort']); else   echo ''; ?>"
    >
</div>


<div class="form-group">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="">
            <label>
                <input type="checkbox" name="status" class="js-switch"
                <?php if (array_key_exists('news', $this->view_data)) if ($this->view_data['news']['status'] == 1) echo 'checked'; ?>
                />
                مفعل
            </label>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="col-md-9 col-sm-9 col-xs-12">
        <div class="">
            <label>
                <input type="checkbox" name="has_comment" class="js-switch"
                <?php if (array_key_exists('news', $this->view_data)) if ($this->view_data['news']['has_comment'] == 1) echo 'checked'; ?>
                />
                التعليقات
            </label>
        </div>
    </div>
</div>


<div class="form-group">
    <label for="exampleInputFile">الاقسام </label>

    <select class="select2 @error('categories2')  is-invalid @enderror" name="categories[]" multiple="multiple"
            data-placeholder="التصنيفات" style="width: 100%;">
        <?php foreach(Helper::getCategories() as $category){ ?>
        <option value="<?php echo $category['id']; ?>"
        <?php  if (array_key_exists('news', $this->view_data) and in_array($category['id'], json_decode($this->view_data['news']['categories2']))) echo 'selected';?> ><?php echo $category['name_ar']; ?> </option>

        <?php } ?>


    </select>
</div>

<div class="form-group">
    <label for="logo">الشعار </label>
    <input name="logo" type="file" id="logo">

</div>

<div id="logo_image">
    <?php if(array_key_exists('news', $this->view_data))  {?>
    <img src="<?php  echo($this->view_data['news']['logo']); ?>" width="100px">

    <?php }?>
</div>


