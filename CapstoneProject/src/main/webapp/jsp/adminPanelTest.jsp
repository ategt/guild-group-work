<%-- 
    Document   : adminPanelTest
    Created on : Jul 2, 2016, 3:10:55 PM
    Author     : apprentice
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- start: Meta -->
        <meta charset="utf-8">
        <title>Admin Panel</title>
        <!-- end: Meta -->

        <!-- start: Mobile Specific -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- end: Mobile Specific -->

        <!-- start: CSS -->
        <link id="bootstrap-style" href="${pageContext.request.contextPath}/css/bootstrap.ap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link id="base-style" href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link id="base-style" href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
        <link id="base-style-responsive" href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
        <link href="https://opensource.keycdn.com/fontawesome/4.6.3/font-awesome.min.css" rel="stylesheet">

        <!-- end: CSS -->


        <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                <link id="ie-style" href="css/ie.css" rel="stylesheet">
        <![endif]-->

        <!--[if IE 9]>
                <link id="ie9style" href="css/ie9.css" rel="stylesheet">
        <![endif]-->

        <!-- start: Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- end: Favicon -->




    </head>

    <body>
        <!-- start: Header -->
        <div class="navbar">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.html"><span>Capstone Project</span></a><!--

                     start: Header Menu 
                    -->                            <div class="nav-no-collapse header-nav">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="halflings-icon white user"></i> ${user.name}
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-menu-title">
                                        <span>Account Settings</span>
                                    </li>
                                    <li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>
                                    <li><a href="${pageContext.request.contextPath}/logout"><i class="halflings-icon off"></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!--
                     end: Header Menu 

                    -->                        </div>
            </div>
        </div>
        <!-- start: Header -->

        <div class="container-fluid-full">
            <div class="row-fluid">

                <!-- start: Main Menu -->
                <div id="sidebar-left" class="span2">
                    <div class="nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <!--<li><a href="index.html"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>-->	
                            <li><a href="${pageContext.request.contextPath}/home"><i class="icon-home"></i><span class="hidden-tablet"> Blog Home</span></a></li>
                        </ul>
                    </div>
                </div>
                <!-- end: Main Menu -->

                <noscript>
                <div class="alert alert-block span10">
                    <h4 class="alert-heading">Warning!</h4>
                    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
                </div>
                </noscript>

                <!-- start: Content -->
                <div id="content" class="span10">


                    <!--                    <ul class="breadcrumb">
                                            <li>
                                                <i class="icon-home"></i>
                                                <a href="index.html">Home</a> 
                                                <i class="icon-angle-right"></i>
                                            </li>
                                            <li><a href="#">Tables</a></li>
                                        </ul>-->

                    <div class="row-fluid sortable">		
                        <div class="box span12">
                            <!--                            <div class="box-header" data-original-title>
                                                            <h2><i class="halflings-icon user"></i><span class="break"></span>Users</h2>
                                                            <div class="box-icon">
                                                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                                                                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                                            </div>
                                                        </div>-->
                            <div class="box-content">
                                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <thead>
                                        <tr>
                                            <th>Author</th>
                                            <th>Title</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <c:forEach items="${pendingPosts}" var="post">

                                            <tr id="post-row-${post.id}">
                                                <td>${post.author.name}</td>
                                                <td>${post.title}</td>
                                                <td class="center">
                                                    <span class="label label-danger">Pending</span>
                                                </td>
                                                <td class="center">
                                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/blog/publish/${post.id}">
                                                        <i class="halflings-icon white bootstrap-datatable"></i>  
                                                    </a>
                                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/blog/edit/${post.id}">
                                                        <i class="halflings-icon white edit"></i>  
                                                    </a>
                                                    <a data-post-id="${post.id}" class="btn btn-danger delete-link-post">
                                                        <i class="halflings-icon white trash"></i> 
                                                    </a>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>            
                            </div>
                        </div><!--/span-->

                    </div><!--/row-->
                    <div class="row-fluid sortable">		
                        <div class="box span12">
                            <div class="box-content">

                                <table class="table table-bordered table-hover" id="user-table">

                                    <tr>
                                        <th>User Name</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Date Joined</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>

                                    <c:forEach items="${users}" var="user">

                                        <tr id="user-row-${user.id}">
                                            <td>${user.name}</td>
                                            <td>${user.email}</td>
                                            <td>${user.role}</td>
                                            <td><fmt:formatDate pattern="MM/dd/yyyy" value="${user.joinedOn}"/></td>
                                            <td><a  data-user-id="${user.id}" data-toggle="modal" data-target="#editUserModal">Edit</a></td>
                                            <td><a data-user-id="${user.id}" class="delete-user-link">Delete</a></td>
                                        </tr>

                                    </c:forEach>

                                </table>



                                <div id="editUserModal" class="modal fade" role="dialog">
          <div class="modal-dialog">


            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit User</h4>
              </div>
              <div class="modal-body">

                                                <table class="table table-bordered" id="edit-user-table">

                                                    <input type="hidden" id="edit-id"/>

                                                    <tr>
                                                        <th>Username:</th>
                                                        <td>
                                                            <input type="text" id="edit-user-name"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Password:</th>
                                                        <td>
                                                            <input type="password" id="edit-user-password"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email:</th>
                                                        <td>
                                                            <input type="text" id="edit-user-email"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Role:</th>
                                                        <td>
                                                            <select id="edit-user-role">
                                                                <option>ROLE_USER</option>
                                                                <option>ROLE_AUTHOR</option>
                                                                <option>ROLE_ADMIN</option>
                                                            </select>
                                                            <!--<input type="text" id="edit-user-role"/>-->
                                                        </td>
                                                    </tr>

                                                </table>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="edit-user-button">Save</button>
              </div>
            </div>

          </div>
        </div>  

                            </div>
                        </div><!--/span-->

                    </div><!--/row-->

                    <div class="row-fluid sortable">
                        <div class="box span6">
                            <div class="box-content">
                                <table class="table table-bordered " id="category-table">
                                    <tr>
                                        <th>Name</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>    


                                    <c:forEach items="${categories}" var="cat">
                                        <tr id="category-row-${cat.id}">  
                                            <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#showCategoryModal">${cat.name}</a></td>
                                            <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#editCategoryModal" class="btn btn-info edit-category-button">
                                                    <i class="halflings-icon white edit"></i> 
                                                </a></td>
                                            <td><a data-category-id="${cat.id}"  class="btn btn-danger delete-link-category">
                                                    <i class="halflings-icon white trash"></i> 
                                                </a></td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table> 

                                <form method="POST" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="name" class="col-md-4 control-label"> Name:</label>
                                        <div class="col-md-6">
                                            <input type="text" id="name-input" class="form-control"/>
                                        </div>
                                    </div>  

                                    <div id="add-category-validation-errors" class="error-message">
                                    </div> 
                            </div>

                            <center>
                                <input id="create-category-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
                            </center>
                            </form>
                            <!--                            <div class="pagination pagination-centered">
                                                            <ul>
                                                                <li><a href="#">Prev</a></li>
                                                                <li class="active">
                                                                    <a href="#">1</a>
                                                                </li>
                                                                <li><a href="#">2</a></li>
                                                                <li><a href="#">3</a></li>
                                                                <li><a href="#">4</a></li>
                                                                <li><a href="#">Next</a></li>
                                                            </ul>
                                                        </div>     -->
                        </div>

                        <div id="editCategoryModal" class="modal fade" tabindex="-1" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Edit Category Details</h4>
                                    </div>
                                    <div class="modal-body">

                                        <table class="table table-bordered" id="edit-category-table">
                                            <input type="hidden" id="edit-id"/>
                                            <tr>
                                                <th>Name:</th>
                                                <td>
                                                    <input type="text" id="edit-category-name"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-danger" id="edit-category-button">Save</button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->

                        <div class="box span6">
                            <div class="box-content">
                                <table class="table table-bordered table-hover"  id="user-table">

                                    <tr>
                                        <th>Name</th>
                                        <th>Uses</th>
                                    </tr>

                                    <c:forEach items="${hashTag}" var="hashtag">
                                        <tr id="user-row-${hashtag.id}">
                                            <td>${hashtag.name}</td>
                                            <td>${hashtag.numOfUses}</td>
                                        </tr>
                                    </c:forEach>

                                </table> 
                                <!--                                <div class="pagination pagination-centered">
                                                                    <ul>
                                                                        <li><a href="#">Prev</a></li>
                                                                        <li class="active">
                                                                            <a href="#">1</a>
                                                                        </li>
                                                                        <li><a href="#">2</a></li>
                                                                        <li><a href="#">3</a></li>
                                                                        <li><a href="#">4</a></li>
                                                                        <li><a href="#">Next</a></li>
                                                                    </ul>
                                                                </div>     -->
                            </div>
                        </div><!--/span-->

                    </div><!--/span-->

                    <div class="row-fluid sortable">
                        <div class="box span6">
                            <div class="box-content">
                                <!--<table class="table">-->

                                <table class="table table-bordered table-hover" id="category-table">
                                    <tr>
                                        <th>Name</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>    


                                    <c:forEach items="${staticPages}" var="staticPage">
                                        <tr id="category-row-${staticPage.id}">  
                                            <td>${staticPage.title}</td>
                                            <td><a data-category-id="${staticPage.id}" class="delete-link">Edit</a></td>
                                            <td><a data-category-id="${staticPage.id}" class="delete-link">Delete</a></td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table> 

                                <form method="POST" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="name" class="col-md-4 control-label"> Name:</label>
                                        <div class="col-md-6">
                                            <input type="text" id="name-input" class="form-control"/>
                                        </div>
                                    </div>  

                                    <div id="add-category-validation-errors" class="error-message">
                                    </div> 
                            </div>

                            <center>
                                <input id="create-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
                            </center>
                            </form>
                            <!--                            <div class="pagination pagination-centered">
                                                            <ul>
                                                                <li><a href="#">Prev</a></li>
                                                                <li class="active">
                                                                    <a href="#">1</a>
                                                                </li>
                                                                <li><a href="#">2</a></li>
                                                                <li><a href="#">3</a></li>
                                                                <li><a href="#">4</a></li>
                                                                <li><a href="#">Next</a></li>
                                                            </ul>
                                                        </div>     -->
                        </div>


                        <!-- start: JavaScript-->
                        <script>
                            var contextRoot = '${pageContext.request.contextPath}';
                        </script>

                        <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
                        <!--<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.0.0.min.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.0.custom.min.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/jquery.ui.touch-punch.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/modernizr.js"></script>-->

                        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                        <!--
                                <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
                        
                                <script src='${pageContext.request.contextPath}/js/fullcalendar.min.js'></script>
                        
                                <script src='${pageContext.request.contextPath}/js/jquery.dataTables.min.js'></script>
                        
                                <script src="${pageContext.request.contextPath}/js/excanvas.js"></script>
                                <script src="${pageContext.request.contextPath}/js/jquery.flot.js"></script>
                                <script src="${pageContext.request.contextPath}/js/jquery.flot.pie.js"></script>
                                <script src="${pageContext.request.contextPath}/js/jquery.flot.stack.js"></script>
                                <script src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script>
                        
                                <script src="${pageContext.request.contextPath}/js/jquery.chosen.min.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/jquery.uniform.min.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/jquery.cleditor.min.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/jquery.noty.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/jquery.elfinder.min.js"></script>-->

<!--        <script src="${pageContext.request.contextPath}/js/jquery.raty.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.iphone.toggle.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.uploadify-3.1.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.gritter.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.imagesloaded.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.masonry.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.knob.modified.js"></script>

        <script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/counter.js"></script>

        <script src="${pageContext.request.contextPath}/js/retina.js"></script>-->

        <!--<script src="${pageContext.request.contextPath}/js/custom.js"></script>-->


                        <script src="${pageContext.request.contextPath}/js/categories.js"></script>
                        <!--<script src="${pageContext.request.contextPath}/js/custom.js"></script>-->
                        <script src="${pageContext.request.contextPath}/js/adminPanelTest.js"></script>
                        <script src="${pageContext.request.contextPath}/js/user.js"></script>
                        <script src="${pageContext.request.contextPath}/js/deletepost.js"></script>


                        <!-- end: JavaScript-->

                        </body>
                        </html>