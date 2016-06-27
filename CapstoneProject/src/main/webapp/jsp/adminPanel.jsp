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

    <thead>
    <img width="100%" height="200" src="http://www.sandbergmaskin.no/wp-content/uploads/2014/06/Light-Wood-Background-slider.jpg"/>
</thead> 


<nav id="navbar-main" class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>

            </button>
            <a class="navbar-brand" href="#">CAPSTONE</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li role="presentation" ><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                <li role="presentation" ><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/aboutUs" class="">About Us</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/" class="">Log In</a></li>

                <c:forEach items="${staticPages}" var="staticPage">
                    <li role="presentation"><a href="static/show/${staticPage.id}">${staticPage.title}</a></li>
                    </c:forEach>
            </ul>
        </div>
</nav>
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>
</html>

