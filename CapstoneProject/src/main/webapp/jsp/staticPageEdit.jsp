<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Static Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <%@ include file="header.jsp" %>

        <div class="container">


            <div class="col-md-6">

                <form method="POST" action="" class="form-horizontal">

                    <div class="form-group">
                        <label for="title" class="col-md-4 control-label">Page Title: </label>
                        <div class="col-md-8">
                            <input type="text" id="title-input" name="title" class="form-control" value="${staticPage.title}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="title" class="col-md-4 control-label">Image Id: </label>
                        <div class="col-md-8">
                            <input type="text" id="image-id" name="image_id" class="form-control" value="${staticPage.image_id}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="content" class="col-md-4 control-label"> Content:</label>
                        <div class="col-md-8">
                            <textarea id="content-input" name="content" class="form-control">${staticPage.content}</textarea>
                        </div>
                    </div>
                    <input id="create-submit" type="submit" class="btn btn-default center-block"/>
                </form>
            </div>

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
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
                    'http://fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
                    'http://www.tinymce.com/css/codepen.min.css'
                ]
            });
        </script>

    </body>
</html>
