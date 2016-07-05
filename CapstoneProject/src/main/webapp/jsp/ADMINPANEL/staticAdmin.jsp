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
        <link href="${pageContext.request.contextPath}/js/image-picker/image-picker.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <!--<link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">-->

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

        <style>
            /*            #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
                        #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
                        #sortable li span { position: absolute; margin-left: -1.3em; }*/
        </style>
        <style>

            #thumb-container {
                width: 200px;
                height: 200px;
            }

            .drop-area {
                width: 300px;
/*                height: 300px;*/
                border: 2px solid black;
            }

        </style>

    </head>
    <body>

        <%@ include file="header.jsp" %>

        <div class="container">
            <div id="dragandrophandler">


                <div class="row">

                    <div class="col-md-6">

                        <table class="table table-bordered table-hover" id="static-page-table">
                            <tr>
                                <th>Page Title</th>
                                <th><span class="glyphicon glyphicon-edit"></span> Edit</th>
                                <th><i class="glyphicon glyphicon-remove"></i> Delete</th>
                            </tr>
                            <tbody id="sortable">
                                <c:forEach items="${staticPages}" var="staticPage">
                                    <tr sort-id="${staticPage.id}" id="static-page-row-${staticPage.id}">
                                        <td><a href="${staticPage.id}">${staticPage.title}</a></td>
                                        <td><a href="edit/${staticPage.id}">Edit</a></td>
                                        <td><a data-static-page-id="${staticPage.id}" class="delete-link">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
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

                            <div class="row">
                                <div class="col-md-12 text-center">

                                    <p>
                                        Image Options:
                                    </p>
                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectImagesModal" value="Add Image From Database" >Add Image To Post From Database</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
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
                            <br />
                            <div class="row">
                                <div class="drop-area">
                                    Drag and Drop Files here to Add them to the Editor Or Click the button above to add images from our database.
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <%@ include file="selectImagesModal.jsp" %>
        <%@ include file="selectSingleImageModal.jsp" %>

        <!-- Placed at the end of the document so the pages load faster -->

        <script>
            var contextRoot = '${pageContext.request.contextPath}';

        </script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/staticPage.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
        <script src="${pageContext.request.contextPath}/js/editblog-custom.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce-drop-file.js"></script>


        <script>

            $(function () {
                $("#sortable").sortable({
                    cursor: 'move',
                    opacity: 0.65,
                    stop: function (event, ui) {
                        var staticPagePositions = $(this).sortable('toArray', {attribute: 'sort-id'});
                        console.log(staticPagePositions);
                        var fd = new FormData();
                        fd.append('positionArray', staticPagePositions);
                        $.ajax({
                            url: contextRoot + "/static/order",
                            type: 'POST',
                            data: fd,
                            processData: false,
                            contentType: false,
                            success: function (data, status) {
                                console.log(data);
                            },
                            error: function (data, status) {
                            }
                        });
                    }
//                    change: function (event, ui) {
//
////ADD AJAX REQUEST HERE TO SEND AN ARRAY WITH ORDER VALUES......CALCULATE HERE FIRST...oR SERVER SIDE BETTER
//
//
//
//                    }
                });



                $("#sortable").disableSelection();
            });
        </script>

    </body>
</html>

