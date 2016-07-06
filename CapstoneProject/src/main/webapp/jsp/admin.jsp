<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Panel</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container">
            
            <div class="row">

                <div class="col-md-12">
                    <h1>Pending Posts</h1>
                    <table class="table table-bordered table-hover" id="pending-posts-table">
                        <tr>
                            <td>Author</td>
                            <td>Title</td>
                            <td>Publish</td>
                            <td>Edit</td>
                            <td>Delete</td>
                        </tr>
                        <c:forEach items="${pendingPosts}" var="post">
                            <tr id="post-row-${post.id}">
                                <td>${post.author.name}</td>
                                <td><a href='${pageContext.request.contextPath}/blog/${post.id}'>${post.title}</a></td>
                                <td><a href='${pageContext.request.contextPath}/blog/publish/${post.id}'>Publish</a></td>
                                <td><a href='${pageContext.request.contextPath}/blog/edit/${post.id}'>Edit</a></td>
                                <td><a data-post-id="${post.id}" class="delete-link" id="delete-post">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <button class='btn btn-primary center-block'><a style="color: white"href="${pageContext.request.contextPath}/blog/create">Create New Post</a></button>
                </div>
                <div class="row">

                    <div class="col-md-12">
                        <h1>Users</h1>
                        <table class="table table-bordered table-hover" id="user-table">
                            <tr>
                                <td>ID</td>
                                <td>Name</td>
                                <td>Role</td>
                                <td>Edit</td>
                                <td>Delete</td>
                            </tr>
                            <c:forEach items="${users}" var="user">
                                <tr id="user-row-${user.id}">
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.role}</a></td>
                                    <td><a <a data-user-id='${user.id}' data-toggle='modal' data-target='#editUserModal'>Edit</a></td>
                                    <td><a data-user-id="${user.id}" class="delete-link" id="delete-user">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h1>Categories</h1>
                        <table class="table table-bordered table-hover" id="category-table">
                            <tr>
                                <td>ID</td>
                                <td>Name</td>
                                <td>Edit</td>
                                <td>Delete</td>
                            </tr>
                            <c:forEach items="${categories}" var="category">
                                <tr id="category-row-${category.id}">
                                    <td>${category.id}</td>
                                    <td>${category.name}</td>
                                    <td><a data-category-id="${category.id}" data-toggle="modal" data-target="#editCategoryModal">Edit</a></td>
                                    <td><a data-category-id="${category.id}" class="delete-link" id="delete-category">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <form method="POST" class="form-horizontal">
                            <div class="form-group">
                                <label for="name" class="col-md-4">Name: </label>
                                <div class="col-md-8">
                                    <input type="text" id="category-input" class="form-control"/>                           
                                </div>
                            </div>
                            <input id="category-create-submit" type="submit" class="btn btn-primary center-block"/>
                            <div id="add-category-validation-errors" class="pull-right"></div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <h1>Hashtags</h1>
                        <table class="table table-bordered table-hover" id="hashtag-table">
                            <tr>
                                <td>ID</td>
                                <td>Name</td>
                                <td>Number Of Uses</td>
                            </tr>
                            <c:forEach items="${hashtags}" var="hashtag">
                                <tr id="category-row-${hashtag.id}">
                                    <td>${hashtag.id}</td>
                                    <td>${hashtag.name}</td>
                                    <td>${hashtag.numOfUses}</td>                                </tr>
                                </c:forEach>
                        </table>
                    </div>
                </div><br/>
                <div class="row">

                    <div class="col-md-12 center-block">
                        <h1>Static Pages</h1>
                        <table class="table table-bordered table-hover" id="static-page-table">
                            <tr>
                                <th>Page Title</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            <tbody id="sortable">
                                <c:forEach items="${staticPages}" var="staticPage">
                                    <tr sort-id="${staticPage.id}" id="static-page-row-${staticPage.id}">
                                        <td><a href="${staticPage.id}">${staticPage.title}</a></td>
                                        <td><a href="${pageContext.request.contextPath}/static/edit/${staticPage.id}">Edit</a></td>
                                        <td><a data-static-page-id="${staticPage.id}" class="delete-static">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <button class='btn btn-primary center-block'><a style="color: white"href="${pageContext.request.contextPath}/static/">Create New Static Page</a></button><br/><br/>
                    </div> 
                </div>
            </div>
        </div>

            <div id="editCategoryModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Edit Category Details</h4>
                        </div>
                        <div class="modal-body">

                            <table class="table table-bordered">
                                <input type="hidden" id="edit-id"/>
                                <tr>
                                    <th>Name:</th>
                                    <td>
                                        <input type="text" id="edit-category">
                                    </td>
                                </tr>
                            </table>

                            <div id="edit-tax-validation-errors" class="pull-right"></div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" id="edit-category-button">Save</button>
                        </div>
                    </div> 
                </div> 
            </div> 
            <div id="editUserModal" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Edit User Details</h4>
                        </div>
                        <div class="modal-body">

                            <table class="table table-bordered">
                                <input type="hidden" id="edit-id"/>
                                <tr>
                                    <th>Name:</th>
                                    <td>
                                        <input type="text" id="edit-user-name">
                                    </td>
                                </tr>
                            </table>

                            <div id="edit-tax-validation-errors" class="pull-right"></div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" id="edit-category-button">Save</button>
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
            <script src="${pageContext.request.contextPath}/js/adminDelete.js"></script>
            <script src="${pageContext.request.contextPath}/js/category.js"></script>
            <script src="${pageContext.request.contextPath}/js/user.js"></script>

    </body>
</html>

