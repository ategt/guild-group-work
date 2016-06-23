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
            <h1>Capstone</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}">Home</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                </ul>    
            </div>

            <div>

                <form method="POST" action="./create" class="form-horizontal">

                    <div class="form-group">
                        <label for="title" class="col-md-4 control-label">Title: </label>
                        <div class="col-md-8">
                            <input type="text" id="title-input" name="title" class="form-control"></input>
                        </div>
                    </div>
<!--                    <div class="form-group">
                        <label for="author" class="col-md-4 control-label">Author </label>
                        <div class="col-md-8">
                            <input type="text" id="author-input" class="form-control"></input>
                        </div>
                    </div>-->
                    <div class="form-group" id='author-input-div'>
                        <label for="author" class="col-md-4 control-label">Author </label>
                        <div class="col-md-8">
                            <select class="btn btn-default dropdown" id="author-input" name="author">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.id}"class="form-control">${user.name}</option>
                                </c:forEach>
                            </select>
                            <!--<input type="text" id="state-input" class="form-control"></input>-->
                        </div>
                        <div id="add-order-validation-category-error" class="validation-errors pull-right"></div>
                    </div>
<!--                    <div class="form-group">
                        <label for="category" class="col-md-4 control-label"> Category: </label>
                        <div class="col-md-8">
                            <input type="text" id="category-input" class="form-control"></input>
                        </div>
                    </div>-->
                    <div class="form-group" id='category-input-div'>
                        <label for="category" class="col-md-4 control-label"> Category: </label>
                        <div class="col-md-8">
                            <select class="btn btn-default dropdown" id="category-input" name="category">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}"class="form-control">${category.name}</option>
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
                    '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
                    '//www.tinymce.com/css/codepen.min.css'
                ]
            });
        </script>
    </body>
</html>

