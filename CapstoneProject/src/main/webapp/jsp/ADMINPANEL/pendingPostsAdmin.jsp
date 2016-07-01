<%-- 
    Document   : pendingPostsAdmin
    Created on : Jun 30, 2016, 2:08:37 PM
    Author     : apprentice
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
           <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Posts</title>
    </head>
    <body>
         <c:forEach items="${pendingPosts}" var="post">

                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img style="max-width: 200px;max-height: 200px;" src="${pageContext.request.contextPath}/image/showimage/${post.image.id}" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                
                                <h3 class="title"><a href="blog/${post.id}">${post.title}</a></h3>
                                <h4 class="text-muted"><span class="glyphicon glyphicon-lock"></span>${post.category.name}</h4>
                                <h5>${post.content}</h5>
                                <p class="text-muted">Created by <a href="#">${post.author.name}</a></p>
                                <h5 class="text-muted">Posted on : ${post.postedOn}</h5>
                                <div align="right">
                                <button >Publish</button>
                                </div>
                                <h4 align="right" >Status: ${post.status}</h4>
                            
                        </div>
                        </div>
                        <hr>
                    </c:forEach>
HELLO
    </body>
</html>
