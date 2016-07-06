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
        <div class="container">
            <h1>Pat's Dresses and Stuff</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
                </ul>    
            </div>
            <div class="row">
                <div class="col-md-12">
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
                </div>
                <div class="row">
                    <div class="col-md-12">
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
                                    <td><a>Edit</a></td>
                                    <td><a data-user-id="${user.id}" class="delete-link" id="delete-user">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
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
                    </div>
                    <div class="col-md-6">
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
                </div>
                 <div class="row">

                    <div class="col-md-12 center-block">

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
                    </div> 
                </div>
            </div>



            <!--        <div id="showTaxModal" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Tax Details</h4>
                                </div>
                                <div class="modal-body">
            
                                    <table class="table table-bordered">
            
                                        <tr>
                                            <th>State:</th>
                                            <td id="tax-state"></td>
                                        </tr>
                                        <tr>
                                            <th>Tax Rate:</th>
                                            <td id="tax-taxrate"></td>
                                        </tr>
            
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div> /.modal-content 
                        </div> /.modal-dialog 
                    </div> /.modal 
            
                    <div id="editTaxModal" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title">Edit Tax Details</h4>
                                </div>
                                <div class="modal-body">
            
                                    <table class="table table-bordered">
            
                                        <tr>
                                            <th>State:</th>
                                            <td>
                                                <input type="text" id="edit-tax-state">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Tax Rate:</th>
                                            <td> 
                                                <input type="text" id="edit-tax-taxrate">
                                            </td>
                                        </tr>
            
            
                                    </table>
            
                                    <div id="edit-tax-validation-errors" class="pull-right"></div>
            
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-default" id="edit-tax-button">Save</button>
                                </div>
                            </div> /.modal-content 
                        </div> /.modal-dialog 
                    </div> /.modal -->

            <script>
            var contextRoot = "${pageContext.request.contextPath}";
            </script>

            <!-- Placed at the end of the document so the pages load faster -->
            <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/adminDelete.js"></script>

    </body>
</html>

