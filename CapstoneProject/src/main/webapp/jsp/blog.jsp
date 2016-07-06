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
        <link href="${pageContext.request.contextPath}/js/image-picker/image-picker.css" rel="stylesheet">

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

                <div class="row">
                    <div class="col-md-2 text-center">
                        <div class="row">
                            <h3><u>ThumbNail</u></h3>
                            <div onclick="javascript:$('#selectSingleImageModal').modal();" id="thumb-container" class="thumb-container">
                                <img style="max-width: 200px;max-height: 200px;" src="${pageContext.request.contextPath}/image/showimage/${blogPost.image.id}" class="img-responsive">
                            </div>

                            <div class="text-center">
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectSingleImageModal" >Set Thumbnail Image</button>
                            </div>
                        </div>
                        <br />
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

                        <form method="POST" action="${pageContext.request.contextPath}/blog/create" class="form-horizontal">
                            <div class="form-group">
                                <label for="title" class="col-md-4 control-label">Title: </label>
                                <div class="col-md-8">
                                    <input type="text" id="title-input" name="title" class="form-control"></input>
                                </div>
                            </div>

                            <input type="hidden" id="thumbId" name="thumbId" value="${blogPost.image.id}" />

                            <div class="form-group" id='author-input-div'>
                                <label for="author" class="col-md-4 control-label">Author: </label>
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
                                <div id="add-validation-category-error" class="validation-errors pull-right"></div>
                            </div>
                            <div class="form-group">
                                <label for="date" class="col-md-4 control-label">Publish On: </label>
                                <div class="col-md-8">
                                    <input type="date" path="publishOn" class= "date" name = "publishOn" value = "<fmt:formatDate value="${cForm.publishOn}" pattern="yyyy-MM-dd" />"/>                    </div>
                                <div id="add-validation-date-error" class="validation-errors pull-right"></div>
                            </div>
                            <div class="form-group">
                                <label for="date" class="col-md-4 control-label">Expiration Date: </label>
                                <div class="col-md-8">
                                    <input type="date" path="expireOn" class= "date" name = "expireOn" value = "<fmt:formatDate value="${cForm.expireOn}" pattern="yyyy-MM-dd" />"/>                    </div>
                                <div id="add-validation-date-error" class="validation-errors pull-right"></div>
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

