<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>Hello Controller Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

<%@ include file="header.jsp" %>
    </head>

    <body>
        

        <div class="row-fluid top30 pagetitle">
            <div class="container">
                <div class="row">

                    <div class="col-md-12"><h1>Pats Warehouse and Stuff</h1></div>
                    
                </div>
            </div>
        </div>
        
        <div class="container">

            <div class="row">
                <div class="col-md-3">

                    <button type="button" class="btn btn-default btn-sm btn-block hidden-lg hidden-md" data-toggle="collapse" data-target="#demo">Refine your search <span class="caret"></span>
                    </button>
                    
                    <div id="demo" class="collapse in">
                        <hr>
                        <div class="list-group list-group">
                            <h4 class="">Categories</h4>

                            <c:forEach items="${categories}" var="cat">
                            <a class="list-group-item" href="${pageContext.request.contextPath}/blog/category/${cat.name}"><span class = "badge"></span>${cat.name}</a>
                            </c:forEach>

                            <div id="categories" class="collapse">
                            </div>
                        </div>
                    </div>

                    <div class="hidden-sm hidden-xs">

                        <hr>

                        <div class="well">
                            <div class="list-group list-group">
                                <h4 class=""> Top Trending #hashtags</h4>
                                <c:forEach items="${hashTag}" var="hashtag">
                                <a href="${pageContext.request.contextPath}/hashtag/${hashtag.name}" class="list-group-item"><span class = "badge"></span>${hashtag.name}</a>
                                </c:forEach>
                                
                        
                        <hr>
                            </div>

                        <hr>

                        <div class="well">
                            <h4>Company Catalog</h4>
                            <p><a href="#"><img src="http://f.tqn.com/y/freebies/1/L/D/S/alloy-catalog.jpg" class="img-responsive"></a></p>
                            <p>Everything you need to know about our warehouse, including mens and womens clothing, inventory, and specials.</p>
                        </div>

                        <hr>

                        <h4 class="text-center">President</h4>
                        <p><a href="#"><img class="center-block" height='200' width='200' src="http://3t7bol18ef963l8x6yzv7ja1.wpengine.netdna-cdn.com/wp-content/uploads/Patrick_400.jpg"></a></p>
                        <h4 class='text-center'>Patrick Toner</h4>
                    </div>
                </div>
                </div>
                
                <div class="col-md-9">
                    <div class="well hidden-xs"> 
                        <div class="row">
                            <div class="col-xs-4">
                                <select class="form-control">
                                    <option>Newest</option>
                                    <option>Oldest</option>
                                    <option>A-Z</option>
                                    <option>Z-A</option>
                                </select>
                            </div>
                        </div>
                        </div>
                    
                    <hr>
                    
                    <c:forEach items="${posts}" var="post">

                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                
                                <h3 class="title"><a href="blog/${post.id}">${post.title}</a></h3>
                                <h4 class="text-muted"><span class="glyphicon glyphicon-lock"></span>${post.category.name}</h4>
                                <h5>${post.content}</h5>
                                <p class="text-muted">Created by <a href="#">${post.author.name}</a></p>
                                <h5 class="text-muted">Posted on : ${post.postedOn}</h5>
                                <h4 align="right" >Status: ${post.status}</h4>
                            
                        </div>
                        </div>
                        <hr>
                    </c:forEach>
                    <ul class="pagination pagination-lg pull-right">
                        <li><a href="#">«</a></li>
                            <c:forEach items="${pages}" var="page"> 
                            <li><a  href="${pageContext.request.contextPath}/home?page=${page}" class="page">${page}</a></li>
                            </c:forEach>
                        <li><a href="#">»</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>