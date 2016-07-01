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

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
    </head>

    <body>

        

        <div class="container">
            <form:form method="POST" action="./" class="form-horizontal">
                <input type="hidden" name="id" value="${blogPost.id}"/>
                <div class="form-group">
                    <label for="title" class="col-md-4 control-label">Title: </label>
                    <div class="col-md-8">
                        <input type="text" id="edit-title-input" name="title" class="form-control" value="${blogPost.title}"></input>
                    </div>
                </div>

                <div class="form-group" id='author-input-div'>
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
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce.js"></script>

    </body>
</html>
