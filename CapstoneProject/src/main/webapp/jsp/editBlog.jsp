<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Static Page</title>
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

        </style>

        <%@ include file="header.jsp" %>
    </head>

    <body>
        <div class="container">
            <div id="dragandrophandler">
                <div class="row">
                    <div class="col-md-2 text-center">
                        <div class="row">
                            <div onclick="javascript:$('#selectSingleImageModal').modal();" id="thumb-container" class="thumb-container">
                                <img style="max-width: 200px;max-height: 200px;" src="${pageContext.request.contextPath}/image/showimage/${blogPost.image.id}" class="img-responsive">
                            </div>

                            <div class="text-center">
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectSingleImageModal" >Set Thumbnail Image</button>
                            </div>
                        </div>
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
                    </div>
                    <div class="col-md-10">
                        <form:form method="POST" action="./" class="form-horizontal">
                            <input type="hidden" name="id" value="${blogPost.id}"/>
                            <div class="form-group">
                                <label for="title" class="col-md-4 control-label">Title: </label>
                                <div class="col-md-8">
                                    <input type="text" id="edit-title-input" name="title" class="form-control" value="${blogPost.title}"></input>
                                </div>
                            </div>

                            <input type="hidden" id="thumbId" name="thumbId" value="${blogPost.image.id}" />

                            <div class="form-group" id="author-input-div">
                                <label for="author" class="col-md-4 control-label">Author </label>
                                <div class="col-md-8">
                                    <select class="btn btn-default dropdown" id="edit-author-input" name="authorId">
                                        <c:forEach items="${users}" var="user">
                                            <option value="${user.id}" class="form-control">${user.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="add-order-validation-author-error" class="validation-errors pull-right"></div>
                            </div>
                            <div class="form-group" id='category-input-div'>
                                <label for="category" class="col-md-4 control-label"> Category: </label>
                                <div class="col-md-8">
                                    <select class="btn btn-default dropdown" id="edit-category-input" name="categoryId">
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}" class="form-control">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="add-order-validation-category-error" class="validation-errors pull-right"></div>
                            </div>
                            <div class="form-group">
                                <label for="content" class="col-md-4 control-label"> Content:</label>
                                <div class="col-md-8">
                                    <textarea id="edit-content-input" name="content" class="form-control">${blogPost.content}</textarea>
                                </div>
                            </div>
                            <input id="create-submit" type="submit" class="btn btn-default center-block"/>

                        </form:form>

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
