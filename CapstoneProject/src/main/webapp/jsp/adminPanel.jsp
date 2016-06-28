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

        <%@ include file="header.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div id="pending-articles">
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div id="demo" class="collapse in">
                        <hr>
                        <div class="list-group list-group">
                            <h4 class="">Admin</h4>
                            <a class="list-group-item" href="#"><span class = "badge"></span>Pending Posts</a>
                            <a class="list-group-item" href="#"><span class = "badge"></span>Edit Posts</a>
                            <a class="list-group-item" href="#"><span class = "badge"></span>Edit Static Pages</a>
                            <a class="list-group-item" href="#"><span class = "badge"></span>Manage Users</a>
                            <a class="list-group-item" href="#"><span class = "badge"></span>Manage Categories</a>
                            <a class="list-group-item" href="#"><span class = "badge"></span>Manage Hashtags</a>

                            <a class="list-group-item" href="#"><span class = "badge"></span>Pending Posts</a>

                        </div>
                    </div>
                </div>
                <div class="col-md-10" id="admin-div">
                    <h1>testing</h1>
                </div>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    </body>
</html>

