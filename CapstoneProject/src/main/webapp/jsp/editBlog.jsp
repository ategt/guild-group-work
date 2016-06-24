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
            <form:form method="POST" commandName="blogPost" action="${pageContext.request.contextPath}/edit/${blogPost.id}" >
                 
                <div class="form-group">
                    <form:label path="id" class="col-sm-3 control-label" >Slug:</form:label>

                    <div class="col-sm-7">
                        <form:input path="id" style="text-align: center" class="form-control" type="text" disabled="true" />
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="slug" class="col-sm-3 control-label" >Slug:</form:label>

                    <div class="col-sm-7">
                        <form:input path="slug" style="text-align: center" class="form-control" type="text" disabled="true" />
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="title" class="col-sm-3 control-label" >Title:</form:label>

                    <div class="col-sm-7">
                        <form:input path="title" style="text-align: center" class="form-control" type="text" disabled="true" />
                    </div>
                </div>

                <div class="form-group">
                    <form:label path="content" for="productName" class="col-sm-3 control-label" >Product:</form:label>

                        <div class="col-sm-7">
                        <form:input path="content" style="text-align: center" class="form-control" type="text" id="productName" placeholder="Product Name" />
                    </div>
                </div>


                
            </form:form>
                            
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

