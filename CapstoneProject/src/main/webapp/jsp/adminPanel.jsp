<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Static Page</title>
         <!--Bootstrap core CSS--> 
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/adminPanel.css" rel="stylesheet">

         <!--Custom styles for this template--> 
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

         <!--SWC Icon--> 
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <%--<%@ include file="header.jsp" %>--%>

    </head>
    <body>

 

            <div id="page">

                <nav >
                    <ul>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/pendingPosts')">Pending Posts</a>
                       
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/editPosts')">Edit Posts</a>
                       
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/staticPages')">Edit Static Pages</a>
                        
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/users')">Manage Users</a>
                      
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/categories')">Manage Categories</a>
                       
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/hashtags')">Manage Hashtags</a>
                        <a class="padded" class="btn btn-success" href="${pageContext.request.contextPath}/home">Home</a>
                    </ul></nav>

                <section>  
                    <h1>Admin Panel</h1>

                </section>
                    
                    <div class="col-md-2">
                    </div>
                    
                   
                    <div  class="col-md-8" id="admin-div">
                        
                    </div>
                    
                    <div class="com-md-2"></div>
                  

    </div>
    <script>
        var contextRoot = "${pageContext.request.contextPath}";
    </script>



    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>
    <script src="${pageContext.request.contextPath}/js/user.js"></script>

    
    
    <link rel="stylesheet" href="./material.min.css">
<script src="./material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


</body>
</html>

