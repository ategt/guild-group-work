<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Static Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/js/image-picker/image-picker.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <style>

            #thumb-container {
                width: 200px;
                height: 200px;
            }

            .drop-area {
                width: 300px;
                height: 300px;
                border: 2px solid black;
            }

        </style>

    </head>
    <body>

        <div class="container">
            <div id="dragandrophandler">
                <%@ include file="header.jsp" %>
                <div class="row">
                    <div class="col-md-2 text-center">
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
                    </div>

                    <div class="col-md-10">

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
            </div>
        </div>

        <%@ include file="selectImagesModal.jsp" %>
        <%@ include file="selectSingleImageModal.jsp" %>

        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
        <script src="${pageContext.request.contextPath}/js/editblog-custom.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce-drop-file.js"></script>

    </body>
</html>

