
$(document).ready(function ()
{
    $(document).on('click', '.submit-from-single-detail-button', function (e) {

        e.preventDefault();
        var selectedValue = $('#modal-single-image-picker').val();
        console.log("Single Select: " + selectedValue);

        $.ajax({
            type: "PUT",
            url: contextRoot + "/image/defaultimage/" + selectedValue,
            async: true,
            success: function (data, status) {
                console.log("Data: " + data);
                console.log("Status: " + status);
                //$('#contact-row-'+ contactId).remove();

                $('#thumb-container').html('<img style="max-width: 150px; max-height: 200px;" src="' + contextRoot + '/image/showimage/' + data + '" />');

            },
            error: function (data, status) {
                console.log("Failed - Data: " + data);
                console.log("Failed - Status: " + status);

            }
        });


        var imageLink = '"<img src="${pageContext.request.contextPath}/image/showimage/' + selectedValue + '" />';
        $(".image-container").html(imageLink);
    });
    $(document).on('click', '.delete-selected-images', function (e) {

        e.preventDefault();
        var selectedValues = $('#admin-image-picker').val();
        console.log("Images To Be Deleted: " + selectedValues);
        var imageLinkCum = "";
        var imageLink = "";
        $(selectedValues).each(function (index, value) {

            console.log('deleting: ' + value);

            e.preventDefault();

            $.ajax({
                type: "DELETE",
                url: contextRoot + "/image/" + value,
                async: false,
                success: function (data, status) {
                    console.log("Data: " + data);
                    console.log("Status: " + status);
                    //$('#contact-row-'+ contactId).remove();
                },
                error: function (data, status) {
                    console.log("Failed - Data: " + data);
                    console.log("Failed - Status: " + status);

                }
            });

        }
        );

        location.reload();

    });

    // Wire up the change preview size dropdown.
    $(".image-preview-size").change(function () {

        var imageSize = $('#image-preview-size').val();

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

    // Initialize Image Picker
    $("select").imagepicker({hide_select: false});

    //Set modal image picker thumbs to default size.
    $(".image_picker_image").width(100);
    $(".image_picker_image").height(100);


});

