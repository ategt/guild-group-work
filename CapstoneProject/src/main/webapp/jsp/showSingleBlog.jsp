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
        <div class="container">
            <h1>Single Blog Post</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}">Home</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                         <li role="presentation"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                </ul>    
            </div>
                
                <div class="row-fluid top30 pagetitle">
  
  <div class="container">
    
    <div class="row">
      
      <div class="col-md-12"><h1>Title</h1></div>
      
      
    </div>
    
  </div>
  
  
  
</div>
<div class="container">
  
      <hr>
      
      
      <div class="row">
        <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
        </div>
        <div class="col-sm-8">
          <h3 class="title" id="title-input">Title</h3>
          <p class="text-muted"><span class="glyphicon glyphicon-lock"></span> Available Exclusively for Premium Members</p>
          <p>Body.</p>
          
          <p class="text-muted">Created by <a href="#">Author</a></p>
          
          </hr>
      
      
      

      
      
    </div>
  </div>
</div>


<!--        

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/blog.js"></script>
        <script src="${pageContext.request.contextPath}/js/tinymce/js/tinymce/tinymce.min.js"></script>
    </body>
</html>

