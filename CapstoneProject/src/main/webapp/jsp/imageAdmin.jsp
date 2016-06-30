<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/js/image-picker/image-picker.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <!--<link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">-->

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">

            <div class="image-admin-panel">
              <div class="image-admin-header">
                <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                <h4 class="modal-title">Select Images</h4>
                    <br />
                    Preview Image Size:
                    <select id="image-preview-size" class="image-preview-size form-control">
                        <option value="1" selected="selected">50x50</option>
                        <option value="2">100x100</option>
                        <option value="3">150x150</option>
                        <option value="4">200x200</option>
                        <!--<option value="0">Native</option>-->
                    </select>
              </div>
              <div class="image-admin-body">

                    <div class="picker">
                        <select multiple="multiple" style="width: 500px; height: 150px;" id="admin-image-picker" class="image-picker show-html">
                            <c:forEach items="${imageIdList}" var="imageId">
                                <option data-img-src="${pageContext.request.contextPath}/image/showimage/${imageId}" value="${imageId}">${pageContext.request.contextPath}/image/showimage/${imageId}</option>
                            </c:forEach>
                        </select>
                    </div>

              </div>
              <div class="modal-footer">

                <button type="button" class="delete-selected-images btn btn-default" >Delete Selected</button>
                <!--<button type="button" class="submit-from-detail-button btn btn-default" data-dismiss="modal">Submit</button>-->
                <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->

              </div>
            </div>


            <br />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectImagesModal">Show Modal</button>
            <br />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectSingleImageModal">Show Single Modal</button>

            <hr />
            <div class="row">
                <c:forEach items="${imageIdList}" var="imageId">
                    <img style="width: 50px; height: 50px;" src="${pageContext.request.contextPath}/image/showimage/${imageId}" />
                </c:forEach>
            </div>
            <div class="image-container" >

            </div>




        </div>

        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script>

            $(document).ready(function ()
            {
                $(document).on('click', '.submit-from-single-detail-button', function (e) {

                    e.preventDefault();
                    var selectedValue = $('#modal-single-image-picker').val();
                    console.log("Single Select: " + selectedValue);
                    var imageLink = '"<img src="${pageContext.request.contextPath}/image/showimage/' + selectedValue + '" />';
                    $(".image-container").html(imageLink);
                });
                $(document).on('click', '.submit-from-detail-button', function (e) {

                    e.preventDefault();
                    var selectedValues = $('#modal-image-picker').val();
                    console.log("Many Values Selected: " + selectedValues);
                    var imageLinkCum = "";
                    var imageLink = "";
                    $(selectedValues).each(function (index, value) {
                        imageLink = '<img src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
                        imageLinkCum += imageLink + "<br />";
                        console.log(imageLinkCum);
                    }
                    );
                    $(".image-container").html(imageLinkCum);
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

                        //var contactId = $(e.target).data('contact-id');

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

//                        imageLink = '<img src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
//                        imageLinkCum += imageLink + "<br />";
//                        console.log(imageLinkCum);
                    }
                    );

                    location.reload();
                    //$(".image-container").html(imageLinkCum);
                });
            });
        </script>




        <%--<%@ include file="selectImagesModal.jsp" %>--%>
        <%--<%@ include file="selectSingleImageModal.jsp" %>--%>













        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>

        <script>
            $("select").imagepicker({hide_select: false});

            $(document).ready(function ()
            {
                $(".image_picker_image").width(50);
                $(".image_picker_image").height(50);

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

            });


        </script>

        <script>
            $("select").imagepicker({hide_select: false});

            $(document).ready(function ()
            {
                $(".image_picker_image").width(50);
                $(".image_picker_image").height(50);

                $(document).on('click', '.submit-from-detail-button', function (e) {

                    e.preventDefault();

                    var selectedValues = $('#modal-image-picker').val();
                    console.log(selectedValues);

                    var imageSize = $('#image-size-input').val();

                    console.log(imageSize);

                    //var sr = "http://localhost:8080/CapstoneProject/image/showimage/248";

                    var imageLinkCum = "";
                    var imageLink = "";
                    $(selectedValues).each(function (index, value) {
                        //imageLink = '<img src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
                        imageLink = '<img ' + determineImageSize(imageSize) + ' src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
                        imageLinkCum += imageLink + "<br />";
                        console.log(imageLinkCum);
                    }
                    );


                    //var imgLink = '<img alt="Image From Database" src="' + sr + '"/>';
                    //                if (imageSize == 0) {
                    //
                    //                } else if (imageSize == 3) {
                    //                    imgLink = '<img style="width: 50px;heigth: 50px;" alt="Added Image" src="' + sr + '"/>';
                    //                } else if (imageSize == 2) {
                    //                    imgLink = '<img style="width: 150px;heigth: 150px;" alt="Added Image" src="' + sr + '"/>';
                    //                } else if (imageSize == 1) {
                    //                    imgLink = '<img style="width: 300px;heigth: 300px;" alt="Added Image" src="' + sr + '"/>';
                    //
                    //                }



                    //tinymce.activeEditor.insertContent(imageLinkCum);



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

                //        $(".image-preview-size").change(function () {
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
                //        });

            });


        </script>

    </body>
</html>

