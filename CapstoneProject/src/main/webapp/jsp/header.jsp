<%-- 
    Document   : header
    Created on : Jun 28, 2016, 3:07:47 PM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <img width="100%" height="200" src="http://www.sandbergmaskin.no/wp-content/uploads/2014/06/Light-Wood-Background-slider.jpg"/>
</head>
<body>
    <nav id="navbar-main" class="navbar navbar-inverse" id="primary">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>

                </button>
                <a class="navbar-brand" href="#">CAPSTONE</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/category" class="">Categories</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/aboutUs" class="">About Us</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/" class="">Log In</a></li>
                    <c:forEach items="${staticPages}" var="staticPage">
                        <li role="presentation"><a href="static/show/${staticPage.id}">${staticPage.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
    </nav>
</body>
</html>
