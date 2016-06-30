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

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tinymce.js"></script>
   
</body>
</html>

