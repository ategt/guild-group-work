<%-- 
    Document   : ADMINPANELTRY3
    Created on : Jul 5, 2016, 10:10:55 PM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link type="text/css" href="${pageContext.request.contextPath}/css/adminPanelTry3.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <head>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>

  <div class="parent2">
      <a href="${pageContext.request.contextPath}/home"><div class="test1"><i class="fa fa-user fa-2x"></i></div></a>
      <a href="${pageContext.request.contextPath}/adminPanel/pendingPosts"/><div class="test2"><i class="fa fa-graduation-cap fa-2x"></i></div></a>
  <a href="${pageContext.request.contextPath}/adminPanel/editPosts"/><div class="test3"><i class="fa fa-code fa-2x"></i></div></a>
<a href="${pageContext.request.contextPath}/static"/><div class="test4"><i class="fa fa-envelope-o fa-2x"></i></div></a>
<div class="mask2"><i class="fa fa-home fa-3x"></i></div></a>
</div>


   <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanelTry3.js"></script>
    </body>
</html>
