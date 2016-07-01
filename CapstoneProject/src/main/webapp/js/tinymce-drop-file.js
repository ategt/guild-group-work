



function sendFileToServer(formData, status)
{
    var uploadURL = contextRoot + "/image/upload/"; //Upload URL
    var extraData = {}; //Extra Data.
    var jqXHR = $.ajax({
        xhr: function () {
            var xhrobj = $.ajaxSettings.xhr();
            if (xhrobj.upload) {
                xhrobj.upload.addEventListener('progress', function (event) {
                    var percent = 0;
                    var position = event.loaded || event.position;
                    var total = event.total;
                    if (event.lengthComputable) {
                        percent = Math.ceil(position / total * 100);
                    }
                    //Set progress
                    status.setProgress(percent);
                }, false);
            }
            return xhrobj;
        },
        url: uploadURL,
        type: "POST",
        contentType: false,
        processData: false,
        cache: false,
        data: formData,
        success: function (data) {
            status.setProgress(100);

            $("#status1").append("File upload Done<br>");

            //e.preventDefault();

            var imageLink = '<img ' + determineImageSize(imageSize) + ' src="' + contextRoot + '/image/showimage/' + data + '" />';

            tinymce.activeEditor.insertContent(imageLink);

//
//        var selectedValues = $('#modal-image-picker').val();
//        console.log(selectedValues);
//
//        var imageSize = $('#image-size-input').val();
//
//        console.log(imageSize);
//
//        var imageLinkCum = "";
//        var imageLink = "";
//        $(selectedValues).each(function (index, value) {
//            //imageLink = '<img src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
//            imageLink = '<img ' + determineImageSize(imageSize) + ' src="' + contextRoot + '/image/showimage/' + value + '" />';
//            imageLinkCum += imageLink + "<br />";
//            console.log(imageLinkCum);
//        }
//        );
//
//        tinymce.activeEditor.insertContent(imageLinkCum);
//
//
//
//            var imageUrl = '<option data-img-src="' + contextRoot + '/image/showimage/' + data + '" value="' + data + '">' + contextRoot + '/image/showimage/' + data + '</option>';
//
//            console.log(imageUrl);
//            $('#admin-image-picker')
//                    .append(imageUrl);
//
//            $("select").imagepicker({hide_select: false});
//
//            var imageSize = $('#image-preview-size').val();
//
//            var width = 50;
//            var height = 50;
//
//            if (imageSize == 1) {
//                width = 50;
//                height = 50;
//            } else if (imageSize == 2) {
//                width = 100;
//                height = 100;
//            } else if (imageSize == 3) {
//                width = 150;
//                height = 150;
//            } else if (imageSize == 4) {
//                width = 200;
//                height = 200;
//            }
//
//            $(".image_picker_image").width(height);
//            $(".image_picker_image").height(width);
//


        },
        error: function (data, status) {
            //var errors = data.responseJSON.errors;
            alert("Error!");
        }
    });

    status.setAbort(jqXHR);
}

var rowCount = 0;
function createStatusbar(obj)
{
    rowCount++;
    var row = "odd";
    if (rowCount % 2 == 0)
        row = "even";
    //this.statusbar = $("<div class='statusbar " + row + "'></div>");
    this.statusbar = $("#status1").appendTo($("<div class='statusbar " + row + "'></div>"));
    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
    //this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
    this.abort = $("<div class='abort'>Abort</div>").appendTo(this.statusbar);
    obj.after(this.statusbar);

    this.setFileNameSize = function (name, size)
    {
        var sizeStr = "";
        var sizeKB = size / 1024;
        if (parseInt(sizeKB) > 1024)
        {
            var sizeMB = sizeKB / 1024;
            sizeStr = sizeMB.toFixed(2) + " MB";
        } else
        {
            sizeStr = sizeKB.toFixed(2) + " KB";
        }

        this.filename.html(name);
        this.size.html(sizeStr);
    };
    this.setProgress = function (progress)
    {
        var progressBarWidth = progress * this.progressBar.width() / 100;
        this.progressBar.find('div').animate({width: progressBarWidth}, 10).html(progress + "% ");
        if (parseInt(progress) >= 100)
        {
            this.abort.hide();
        }
    };
    this.setAbort = function (jqxhr)
    {
        var sb = this.statusbar;
        this.abort.click(function ()
        {
            jqxhr.abort();
            sb.hide();
        });
    };
}
function handleFileUpload(files, obj)
{
    for (var i = 0; i < files.length; i++)
    {
        var fd = new FormData();
        fd.append('file', files[i]);

        var status = new createStatusbar(obj); //Using this we can set progress.
        status.setFileNameSize(files[i].name, files[i].size);
        sendFileToServer(fd, status);

    }
}
$(document).ready(function ()
{
    var obj = $("#dragandrophandler");
    obj.on('dragenter', function (e)
    {
        e.stopPropagation();
        e.preventDefault();
        $(this).css('border', '2px solid #0B85A1');
    });
    obj.on('dragover', function (e)
    {
        e.stopPropagation();
        e.preventDefault();
    });
    obj.on('drop', function (e)
    {

        $(this).css('border', '2px hidden #0B85A1');
        e.preventDefault();

        var files = e.originalEvent.dataTransfer.files;

        //We need to send dropped files to Server
        handleFileUpload(files, obj);

    });

    $(document).on('dragenter', function (e)
    {
        e.stopPropagation();
        e.preventDefault();
    });
    $(document).on('dragover', function (e)
    {
        e.stopPropagation();
        e.preventDefault();
        obj.css('border', '2px hidden #0B85A1');
    });
    $(document).on('drop', function (e)
    {
        e.stopPropagation();
        e.preventDefault();

    });

});

var imageSize = 0;

$("#image-size-input").change(function () {

    imageSize = $('#image-size-input').val();

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
