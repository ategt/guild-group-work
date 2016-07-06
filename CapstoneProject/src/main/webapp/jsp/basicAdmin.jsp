<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <title>Simple Admin Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">

            <%@ include file="header.jsp" %>


            <table>
                <caption>Blog Post Options</caption>
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/blog/">Create Post</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/blog/edit">Edit Post</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="${pageContext.request.contextPath}/adminPanel/pendingPosts">Publish Post</a>
                    </td>
                </tr>
            </table>                






            <a href="${pageContext.request.contextPath}/blog/">Create Post</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/blog/')">Create Post</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/pendingPosts')">Pending Posts</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/editPosts/')">Edit Posts</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/static/')">Edit Static Pages</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/users')">Manage Users</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/categories')">Manage Categories</a>

            <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/hashtags')">Manage Hashtags</a>
            <a class="padded" class="btn btn-success" href="${pageContext.request.contextPath}/home">Home</a>



        </td>

    </table>



</div>

<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>
</html>