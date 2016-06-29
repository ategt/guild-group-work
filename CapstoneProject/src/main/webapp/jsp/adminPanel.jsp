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
        <link href="${pageContext.request.contextPath}/css/adminPanel.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <%@ include file="header.jsp" %>

    </head>
    <body>

 

            <div id="page">

                <nav id="navv">
                    <ul>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/jsp/pendingPosts.jsp')">Pending Posts</a>
                        <br>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/jsp/editBlog.jsp')">Edit Posts</a>
                        <br>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/jsp/staticPageEditSkeleton.jsp')">Edit Static Pages</a>
                        <br>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/jsp/users.jsp')">Manage Users</a>
                        <br>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/jsp/category.jsp')">Manage Categories</a>
                        <br>
                        <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/jsp/hashtag.jsp')">Manage Hashtags</a>
                        <a class="padded" class="btn btn-success" href="${pageContext.request.contextPath}/home">Home</a>
                    </ul></nav>

                <section>  
                    <h1>Admin Panel</h1>

                </section>





                <div class="container">

                    <div class="col-md-12" id="admin-div">

                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        var contextRoot = "${pageContext.request.contextPath}";
    </script>


    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>


</body>
</html>

