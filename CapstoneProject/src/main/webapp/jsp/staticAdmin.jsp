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
        <!--<link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">-->

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!--        <script src="//code.jquery.com/jquery-1.10.2.js"></script>-->
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <style>
            #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
            #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
            #sortable li span { position: absolute; margin-left: -1.3em; }
        </style>
    </head>
    <body>

        <%@ include file="header.jsp" %>

        <div class="container">

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

                    <form method="POST" action="" class="form-horizontal">

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

                    <ul id="sortable">
                        <c:forEach items="${staticPages}" var="staticPage">
                            <li id="${staticPage.id}" class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>${staticPage.title}</li>
                        </c:forEach>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 1</li>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 2</li>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 3</li>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 4</li>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 5</li>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 6</li>
                        <li class="ui-state-default"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span>Item 7</li>
                    </ul>



        <!-- Placed at the end of the document so the pages load faster -->

        <script>
            var contextRoot = '${pageContext.request.contextPath}';

            $(function () {
                $("#sortable").sortable();
                $("#sortable").disableSelection();
            });

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
                    'http://fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
                    'http://www.tinymce.com/css/codepen.min.css'
                ]
            });
        </script>

    </body>
</html>

