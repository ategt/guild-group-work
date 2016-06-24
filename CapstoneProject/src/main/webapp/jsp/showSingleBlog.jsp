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

    </head>
    <body>
        <div class="container">
            <h1>Capstone</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                      <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                    <li role="presentation" ><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                    

                </ul>    
            </div>

            <div class="row-fluid top30 pagetitle">

                <div class="container">

                    <div class="row">

                        <div class="col-md-12"><h1>Single Blog Post</h1></div>


                    </div>

                </div>



            </div>
            <div class="container">





             





                        </div>

                        <hr>
                        

                        <div items="${singlePost}" var="post">

                        

                            
                                <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">${post.title}</h3>
                                <h4 class="text-muted"><span class="glyphicon glyphicon-lock"></span>${posts.category}</h4>
                                <h5>${post.content}</h5>

                                <p class="text-muted">Created by <a href="#">${post.author.name}</a></p>
                                 <h5 class="text-muted">Posted on : ${post.postedOn}</h5>
<!--                                    <h5 class = "text-right"class="text-muted">Ralated Topics :  <a href="#">${post.category}</a></h5>-->

                            </div>
                        </div>
                       
                        <hr>
                            </tr>
                        </div>

            
                </hr>







                    </div>
                </div>
            </div>


        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>


