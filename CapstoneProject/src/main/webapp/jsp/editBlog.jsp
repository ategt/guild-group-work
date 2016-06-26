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
            <form:form method="POST" commandName="blogPostCommand" action="${pageContext.request.contextPath}/blog/edit/" >

                <div class="form-group">
                    <form:label path="id" class="col-sm-3 control-label" >ID:</form:label>

                        <div class="col-sm-7">
                        <form:input path="id" style="text-align: center" class="col-sm-9 form-control" type="text" disabled="true" />
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="title" class="col-sm-3 control-label" >Title:</form:label>

                        <div class="col-sm-7">
                        <form:input path="title" style="text-align: center" class="form-control" type="text" disabled="true" />
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="content" class="col-sm-3 control-label" >Content:</form:label>

                        <div class="col-sm-7">
                        <form:input path="content" style="text-align: center" class="form-control" type="text" />
                    </div>
                </div>


                <div class="form-group" id="author-input-div">
                    <label path="author" class="col-md-4 control-label">Author: <label>
                        <div class="col-md-8">
                            <select class="btn btn-default dropdown" id="author-input" name="authorId">
                            <c:forEach items="${users}" var="user">
                                <option value="${user.id}" class="form-control">${user.name}</option>
                            </c:forEach>
                        </select>
                        <!--<input type="text" id="state-input" class="form-control"></input>-->
                    </div>
                    <div id="add-order-validation-category-error" class="validation-errors pull-right">
                    </div>
                </div>

                <div class="form-group" id="category-input-div">
                    <label path="category" class="col-md-4 control-label"> Category: </label>
                        <div class="col-md-8">
                        <select class="btn btn-default dropdown" id="category-input" name="categoryId">
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.id}" class="form-control">${category.name}</option>
                            </c:forEach>
                        </select>
                        <!--<input type="text" id="state-input" class="form-control"></input>-->
                    </div>
                    <div id="add-order-validation-category-error" class="validation-errors pull-right">

                    </div>
                </div>
                    
                    <input type="submit" value="submit" />

            </form:form>

        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>
