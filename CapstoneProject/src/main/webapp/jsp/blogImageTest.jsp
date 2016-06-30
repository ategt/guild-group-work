<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Post</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>

        <div class="container">
            <form method="POST" action="./create" class="form-horizontal">

                <%@ include file="header.jsp" %>

                <div class="container">
                    <form method="POST" action="./create" class="form-horizontal">


                        <div class="form-group">
                            <label for="title" class="col-md-4 control-label">Title: </label>
                            <div class="col-md-8">
                                <input type="text" id="title-input" name="title" class="form-control"></input>
                            </div>
                        </div>

                        <div class="form-group" id='author-input-div'>
                            <label for="author" class="col-md-4 control-label">Author </label>
                            <div class="col-md-8">
                                <select class="btn btn-default dropdown" id="author-input" name="authorId">
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.id}" class="form-control">${user.name}</option>
                                    </c:forEach>
                                </select>

                            </div>
                            <div id="add-order-validation-category-error" class="validation-errors pull-right"></div>
                        </div>

                        <div class="form-group" id='category-input-div'>
                            <label for="category" class="col-md-4 control-label"> Category: </label>
                            <div class="col-md-8">
                                <select class="btn btn-default dropdown" id="category-input" name="categoryId">
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.id}" class="form-control">${category.name}</option>
                                    </c:forEach>
                                </select>
                                <!--<input type="text" id="state-input" class="form-control"></input>-->
                            </div>
                            <div id="add-order-validation-category-error" class="validation-errors pull-right"></div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-md-4 control-label"> Content:</label>
                            <div class="col-md-8">
                                <textarea id="content-input" name="content" class="form-control"></textarea>
                            </div>
                        </div>
                        <input id="create-submit" type="submit" class="btn btn-default center-block"/>
                    </form>
                </div>

                <input id="create-submit" type="submit" class="btn btn-default"></input>
                <a href="blog/showUnapprovedPost"id="create-submit" type="submit" class="btn btn-default">Submit for approval</a>

            </form>

            <button class="btn btn-default add-image-button" value="Add Image" >Add Image</button>

            <div class="image-size">
                <select class="btn btn-default dropdown" id="image-size-input" name="image-size-input">
                    <option value="0">Native</option>
                    <option value="1">Large</option>
                    <option value="2">Medium</option>
                    <option value="3">Small</option>
                </select>
            </div>

        </div>


    </div>

    <%@ include file="selectImagesModal.jsp" %>
    <%@ include file="selectSingleImageModal.jsp" %>


    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
    
    
    
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


        });

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
        tinymce.init({
            selector: 'textarea',
            height: 500,
            theme: 'modern',
            plugins: [
                'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                'searchreplace wordcount visualblocks visualchars code fullscreen',
                'insertdatetime media nonbreaking save table contextmenu directionality',
                'emoticons template paste textcolor colorpicker textpattern imagetools'
            ],
            toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
            toolbar2: 'print preview media | forecolor backcolor emoticons',
            image_advtab: true,
            templates: [
                {title: 'Test template 1', content: 'Test 1'},
                {title: 'Test template 2', content: 'Test 2'}
            ],
            content_css: [
                'http://www.tinymce.com/css/codepen.min.css'
            ]
        });


        //tinymce.activeEditor.insertContent('<img alt="Smiley face" height="42" width="42" src="' + sr + '"/>');

        $(document).ready(function ()
        {

            $(document).on('click', '.add-image-button', function (e) {

                var imageSize = $('#image-size-input').val();

                console.log(imageSize);

                var sr = "http://localhost:8080/CapstoneProject/image/showimage/248";
                var imgLink = '<img alt="Added Image" src="' + sr + '"/>';
                if (imageSize == 0) {

                } else if (imageSize == 3) {
                    imgLink = '<img style="width: 50px;heigth: 50px;" alt="Added Image" src="' + sr + '"/>';
                } else if (imageSize == 2) {
                    imgLink = '<img style="width: 150px;heigth: 150px;" alt="Added Image" src="' + sr + '"/>';
                } else if (imageSize == 1) {
                    imgLink = '<img style="width: 300px;heigth: 300px;" alt="Added Image" src="' + sr + '"/>';

                }



                tinymce.activeEditor.insertContent(imgLink);

            });
        });

    </script>
</body>
</html>

