<script src="/design/dashboard/js/jquery-3.3.1.min.js"></script>
<script src="/design/dashboard/js/popper.min.js"></script>
<script src="/design/dashboard/js/bootstrap.min.js"></script>
<script src="/design/dashboard/js/all.min.js"></script>
<script src="/design/dashboard/js/echarts-en.min.js"></script>
<script src="/design/dashboard/js/anime.min.js"></script>
<script src="/design/dashboard/js/dash.js"></script>
<script src="/design/dashboard/js/design.js"></script>
<script src="/design/dashboard/js/main.js"></script>
<script src="/design/dashboard/js/my-login.js"></script>
<script src="/design/dashboard/js/validate.js"></script>

<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>tinymce.init({
        selector: 'textarea',
        plugins: 'image code',
        toolbar: 'undo redo | image code',

        // without images_upload_url set, Upload tab won't show up
        images_upload_url: 'upload.php',

        // override default upload handler to simulate successful upload
        images_upload_handler: function (blobInfo, success, failure) {
            var xhr, formData;

            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open('POST', 'upload.php');

            xhr.onload = function() {
                var json;

                if (xhr.status != 200) {
                    failure('HTTP Error: ' + xhr.status);
                    return;
                }

                json = JSON.parse(xhr.responseText);

                if (!json || typeof json.location != 'string') {
                    failure('Invalid JSON: ' + xhr.responseText);
                    return;
                }

                success(json.location);
            };

            formData = new FormData();
            formData.append('file', blobInfo.blob(), blobInfo.filename());

            xhr.send(formData);
        },
    });</script>
<?php (Message::getMessage('errors')); ?>
<?php (Message::getMessage('oldFormData')); ?>

