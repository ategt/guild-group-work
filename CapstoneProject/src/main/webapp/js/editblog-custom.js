

$(document).ready(function ()
{

    $('#selectSingleImageModal').on('show.bs.modal', function (e) {
        $(".image_picker_image").width(50);
        $(".image_picker_image").height(50);
    });

    $('#selectImagesModal').on('show.bs.modal', function (e) {
        $(".image_picker_image").width(50);
        $(".image_picker_image").height(50);
    });

    $("#multi-image-preview-size").change(function () {

        var imageSize = $('#multi-image-preview-size').val();

        var width = 50;
        var height = 50;

        if (imageSize == 1) {
            width = 50;
            height = 50;
        } else if (imageSize == 2) {
            width = 100;
            height = 100;
        } else if (imageSize == 3) {
            width = 150;
            height = 150;
        } else if (imageSize == 4) {
            width = 200;
            height = 200;
        }

        $(".image_picker_image").width(height);
        $(".image_picker_image").height(width);

    });
    
    $("#single-image-preview-size").change(function () {

        var imageSize = $('#single-image-preview-size').val();

        var width = 50;
        var height = 50;

        if (imageSize == 1) {
            width = 50;
            height = 50;
        } else if (imageSize == 2) {
            width = 100;
            height = 100;
        } else if (imageSize == 3) {
            width = 150;
            height = 150;
        } else if (imageSize == 4) {
            width = 200;
            height = 200;
        }

        $(".image_picker_image").width(height);
        $(".image_picker_image").height(width);

    });

    function determineImageSize(imageSize) {
        var imgLink = "";
        if (imageSize == 0) {
            imgLink = "";
        } else if (imageSize == 3) {
            imgLink = 'style="width: 50px;heigth: 50px;"';
        } else if (imageSize == 2) {
            imgLink = 'style="width: 150px;heigth: 150px;"';
        } else if (imageSize == 1) {
            imgLink = 'style="width: 300px;heigth: 300px;"';

        }
        return imgLink;
    }

    $(document).on('click', '.submit-from-single-detail-button', function (e) {

        e.preventDefault();

        var selectedValue = $('#modal-single-image-picker').val();

        console.log(selectedValue);

        $('#thumbId').val(selectedValue);
        $('#thumb-container').html('<img style="max-width: 150px; max-height: 200px;" src="' + contextRoot + '/image/showimage/' + selectedValue + '" />');


    });
    $(document).on('click', '.submit-from-detail-button', function (e) {

        e.preventDefault();

        var selectedValues = $('#modal-image-picker').val();
        console.log(selectedValues);

        var imageSize = $('#image-size-input').val();

        console.log(imageSize);

        var imageLinkCum = "";
        var imageLink = "";
        $(selectedValues).each(function (index, value) {
            //imageLink = '<img src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
            imageLink = '<img ' + determineImageSize(imageSize) + ' src="' + contextRoot + '/image/showimage/' + value + '" />';
            imageLinkCum += imageLink + "<br />";
            console.log(imageLinkCum);
        }
        );

        tinymce.activeEditor.insertContent(imageLinkCum);

    });

    $(".image-picker").imagepicker({hide_select: true});

});

//tinymce.activeEditor.insertContent('<img alt="Smiley face" height="42" width="42" src="' + sr + '"/>');

//$(document).ready(function ()
//{
//
//    $(document).on('click', '.add-image-button', function (e) {
//
//
//
//        var imageSize = $('#image-size-input').val();
//
//        console.log(imageSize);
//
//        var sr = "http://localhost:8080/CapstoneProject/image/showimage/248";
//        var imgLink = '<img alt="Added Image" src="' + sr + '"/>';
//        if (imageSize == 0) {
//
//        } else if (imageSize == 3) {
//            imgLink = '<img style="width: 50px;heigth: 50px;" alt="Added Image" src="' + sr + '"/>';
//        } else if (imageSize == 2) {
//            imgLink = '<img style="width: 150px;heigth: 150px;" alt="Added Image" src="' + sr + '"/>';
//        } else if (imageSize == 1) {
//            imgLink = '<img style="width: 300px;heigth: 300px;" alt="Added Image" src="' + sr + '"/>';
//
//        }
//
//
//
//        tinymce.activeEditor.insertContent(imgLink);
//
//    });
//});


