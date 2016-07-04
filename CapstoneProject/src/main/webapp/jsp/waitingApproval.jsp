<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hello Controller Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
    <img width="100%" height="200" src="http://www.sandbergmaskin.no/wp-content/uploads/2014/06/Light-Wood-Background-slider.jpg"/>

</head>
<body>

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
                    <li role="presentation" class="active" ><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/aboutUs" class="">About Us</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/" class="">Log In</a></li>

                    <c:forEach items="${staticPages}" var="staticPage">
                        <li role="presentation"><a href="static/show/${staticPage.id}">${staticPage.title}</a></li>
                        </c:forEach>
                </ul>
            </div>
    </nav>

    <div class="row-fluid top30 pagetitle">

        <div class="container">

            <div class="row">

                <div class="col-md-12"><h1>Posts Waiting Approval</h1></div>


            </div>

        </div>



    </div>
    <div class="container">





        <div class="row">
            <div class="col-md-3">
                <button type="button" class="btn btn-default btn-sm btn-block hidden-lg hidden-md" data-toggle="collapse" data-target="#demo">Refine your search <span class="caret"></span>
                </button>

            </div>

            <div class="well hidden-xs"> 
                <div class="row">
                    <div class="col-xs-4">
                        <select class="form-control">
                            <option>Newest</option>
                            <option>Oldest</option>
                            <option>Approved</option>
                            <option>Unapproved</option>
                            <option>Denied</option>
                        </select>
                    </div>
                </div>
            </div>
            <hr>

            <c:forEach items="${posts}" var="post">
                <div class="row">
                    <div class="col-sm-4"><a href="#" class=""><img style="max-width: 200px;max-height: 200px;" src="${pageContext.request.contextPath}/image/showimage/${post.image.id}" class="img-responsive"></a>
                    </div>
                    <div class="col-sm-8">
                        <h3 class="title"><a href="blog/${post.id}">${post.title}</a></h3>
                        <h4 class="text-muted"><span class="glyphicon glyphicon-lock"></span>${post.category.name}</h4>
                        <h5>${post.content}</h5>
                        <p class="text-muted">Created by <a href="#">${post.author.name}</a></p>
                        <h5 class="text-muted">Posted on : ${post.postedOn}</h5>
                        <h4 align="right" >Status:${post.status} </h4>
                    </div>
                </div>
                <hr>
                </tr>
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