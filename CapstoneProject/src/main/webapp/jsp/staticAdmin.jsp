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

        <div class="container">
            <h1>Admin Panel</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/static/">Static Pages</a></li>

                </ul>    
            </div>

            <div class="row">


                <div class="col-md-6">

                    <table class="table table-bordered table-hover" id="static-page-table">
                        <thead>
                            <tr>
                                <th>Page Title</th>
                                <th><span class="glyphicon glyphicon-edit"></span> Edit</th>
                                <th><i class="glyphicon glyphicon-remove"></i> Delete</th>
                            </tr>
                        </thead>
                        <c:forEach items="${staticPages}" var="staticPage">
                            <tr id="static-page-row-${staticPage.id}">
                                <td><a href="${staticPage.id}">${staticPage.title}</a></td>
                                <td><a data-static-page-id="${staticPage.id}" data-toggle="modal" data-target="#editAddressModal">Edit</a></td>
                                <td><a data-static-page-id="${staticPage.id}" class="delete-link">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div> 

                <div class="col-md-6">

                    <form method="POST" action="static/" class="form-horizontal">

                        <div class="form-group">
                            <label for="title" class="col-md-4 control-label">Page Title: </label>
                            <div class="col-md-8">
                                <input type="text" id="title-input" name="title" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="title" class="col-md-4 control-label">Image Id: </label>
                            <div class="col-md-8">
                                <input type="text" id="image-id" name="image_id" class="form-control"/>
                            </div>
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
        </div>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>
                var contextRoot = '${pageContext.request.contextPath}';

        </script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/staticPage.js"></script>

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

