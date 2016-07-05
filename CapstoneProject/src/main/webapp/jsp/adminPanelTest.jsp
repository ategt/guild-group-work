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
        <title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
        <meta name="description" content="Bootstrap Metro Dashboard">
        <meta name="author" content="Dennis Ji">
        <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
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
                    <a class="brand" href="index.html"><span>Capstone Project</span></a>

                    <!-- start: Header Menu -->
                    <div class="nav-no-collapse header-nav">
                        <ul class="nav pull-right">


                            <!-- start: Message Dropdown -->

                            <!-- start: User Dropdown -->
                            <li class="dropdown">
                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="halflings-icon white user"></i> USER
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-menu-title">
                                        <span>Account Settings</span>
                                    </li>
                                    <!--<li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>-->
                                    <li><a href="${pageContext.request.contextPath}/logout"><i class="halflings-icon off"></i> Logout</a></li>
                                </ul>
                            </li>
                            <!-- end: User Dropdown -->
                        </ul>
                    </div>
                    <!-- end: Header Menu -->

                </div>
            </div>
        </div>
        <!-- start: Header -->

        <div class="container-fluid-full">
            <div class="row-fluid">

                <!-- start: Main Menu -->
                <div id="sidebar-left" class="span2">
                    <div class="nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <li><a href="index.html"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>	
                            <li><a href="messages.html"><i class="icon-home"></i><span class="hidden-tablet"> Blog Home</span></a></li>
                            <li><a href="messages.html"><i class="icon-user"></i><span class="hidden-tablet"> Users</span></a></li>
                            <li><a href="messages.html"><i class="icon-file"></i><span class="hidden-tablet"> Static Pages</span></a></li>
                            <li><a href="messages.html"><i class="icon-tasks"></i><span class="hidden-tablet"> Categories</span></a></li>
                            <li><a href="messages.html"><i class="icon-th"></i><span class="hidden-tablet"> Hash Tags</span></a></li>

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
                <div id="content" class="span10"><!--


                    <ul class="breadcrumb">

                    </ul>

                    <div class="row-fluid sortable">		
                        <div class="box span12">

                            <div class="box-header" data-original-title>
                                <h2><i class="halflings-icon user"></i><span class="break"></span>Users</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                                                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Date registered</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <c:forEach items="${users}" var="user">

                                            <tr id="user-row-${user.id}">
                                                <td>${user.name}</td>
                                                <td>${user.email}</td>
                                                <td><fmt:formatDate pattern="MM/dd/yyyy" value="${user.joinedOn}"/></td>
                                                <td>${user.role}</td>
                                                <td class="center">
                                                    <span class="label label-success">Active</span>
                                                </td>
                                                <td class="center">
                                                    <td><a data-category-id="${user.id}" data-toggle="modal" data-target="#showUserModal">${user.name}</a></td>
                                                        <i class="halflings-icon white edit"></i>  
                                                    </a>
                                                    <a data-user-id="${user.id}" class="btn btn-danger delete-link-user">
                                                        <i class="halflings-icon white trash"></i> 
                                                    </a>
                                                </td>
                                                <td><a  data-user-id="${user.id}" data-toggle="modal" data-target="#editUserModal">Edit</a></td>
                                                <td><a data-user-id="${user.id}" class="delete-link">Delete</a></td>
                                            </tr>

                                        </c:forEach>
                                                                                <tr>
                                                                                    <td>Dennis Ji</td>
                                                                                    <td class="center">2012/01/01</td>
                                                                                    <td class="center">Member</td>
                                                                                    <td class="center">
                                                                                        <span class="label label-success">Active</span>
                                                                                    </td>
                                                                                    <td class="center">
                                                                                        <a class="btn btn-success" href="#">
                                                                                            <i class="halflings-icon white zoom-in"></i>  
                                                                                        </a>
                                                                                        <a class="btn btn-info" href="#">
                                                                                            <i class="halflings-icon white edit"></i>  
                                                                                        </a>
                                                                                        <a class="btn btn-danger" href="#">
                                                                                            <i class="halflings-icon white trash"></i> 
                                                                                        </a>
                                                                                    </td>
                                                                                </tr>

                                    </tbody>
                                </table>            
                            </div>
                        </div>/span

                    </div>/row-->





                    <div class="row-fluid sortable">
                        <div class="box span6">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Categories</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <!--<table class="table">-->

                                <table class="table table-bordered table-hover" id="category-table">
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
                            <div class="pagination pagination-centered">
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
                            </div>     
                        </div>
                    </div>

                </div>
            </div>


            <div id="editCategoryModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
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

                            </table>



              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="edit-category-button">Save</button>
              </div>
            </div>

          </div>
        </div>




<!--                        <div class="box span6">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Hashtags</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-bordered table-hover"  id="user-table">

                                    <tr>
                                        <th>Name</th>
                                        <th>Uses</th>
                                    </tr>

                                    <c:forEach items="${hashtags}" var="hashtag">
                                        <tr id="user-row-${hashtag.id}">
                                            <td>${hashtag.name}</td>
                                            <td>${hashtag.numOfUses}</td>
                                        </tr>
                                    </c:forEach>

                                </table> 
                                <div class="pagination pagination-centered">
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
                                </div>     
                            </div>
                        </div>/span

                    </div>/span

                    <div class="row-fluid sortable">
                        <div class="box span6">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Static Pages</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table">

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

            <div class="box span6">
                <div class="box-header">
                    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Hashtags</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                    </div>
                </div>
                <div class="box-content">
                    <table class="table table-bordered table-hover"  id="user-table">

                        <tr>
                            <th>Name</th>
                            <th>Uses</th>
                        </tr>

                        <c:forEach items="${hashtags}" var="hashtag">
                            <tr id="user-row-${hashtag.id}">
                                <td>${hashtag.name}</td>
                                <td>${hashtag.numOfUses}</td>
                            </tr>
                        </c:forEach>

                    </table> 
                    <div class="pagination pagination-centered">
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
                    </div>     
                </div>
            </div><!--/span-->

        </div><!--/span-->

        <div class="row-fluid sortable">
            <div class="box span6">
                <div class="box-header">
                    <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Static Pages</h2>
                    <div class="box-icon">
                        <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                        <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                        <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                    </div>
                </div>
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
                <div class="pagination pagination-centered">
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
                </div>     
            </div>
            <!--                        
                                    <div class="box span6">
                                        <div class="box-header">
                                            <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Hashtags</h2>
                                            <div class="box-icon">
                                                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                            </div>
                                        </div>-->
            <!--                            <div class="box-content">
                                            <table class="table table-bordered table-hover"  id="user-table">
            
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Uses</th>
                                                </tr>
            
            <c:forEach items="${hashtags}" var="hashtag">
                <tr id="user-row-${hashtag.id}">
                    <td>${hashtag.name}</td>
                    <td>${hashtag.numOfUses}</td>
                </tr>
            </c:forEach>

        </table> 
        <div class="pagination pagination-centered">
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
        </div>     
    </div>
</div>/span

</div>/span-->

            <!--                    <div class="row-fluid sortable">	
                                    <div class="box span6">
                                        <div class="box-header">
                                            <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Bordered Table</h2>
                                            <div class="box-icon">
                                                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                            </div>
                                        </div>

                                    </div>  

                                    <div id="add-category-validation-errors" class="error-message">
                                    </div> 
                            </div>

                            <center>
                                <input id="create-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
                            </center>
                            </form>
                            <div class="pagination pagination-centered">
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
                            </div>     
                        </div>-->
<!--                        
                        <div class="box span6">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Hashtags</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>-->
<!--                            <div class="box-content">
                                <table class="table table-bordered table-hover"  id="user-table">

                                    <tr>
                                        <th>Name</th>
                                        <th>Uses</th>
                                    </tr>

                                    <c:forEach items="${hashtags}" var="hashtag">
                                        <tr id="user-row-${hashtag.id}">
                                            <td>${hashtag.name}</td>
                                            <td>${hashtag.numOfUses}</td>
                                        </tr>
                                    </c:forEach>

                                </table> 
                                <div class="pagination pagination-centered">
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
                                </div>     
                            </div>
                        </div>/span

                    </div>/span-->

<!--                    <div class="row-fluid sortable">	
                        <div class="box span6">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Bordered Table</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Date registered</th>
                                            <th>Role</th>
                                            <th>Status</th>                                          
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/01/01</td>
                                            <td class="center">Member</td>
                                            <td class="center">
                                                <span class="label label-success">Active</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/02/01</td>
                                            <td class="center">Staff</td>
                                            <td class="center">
                                                <span class="label label-important">Banned</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/02/01</td>
                                            <td class="center">Admin</td>
                                            <td class="center">
                                                <span class="label">Inactive</span>
                                            </td>                                        
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/03/01</td>
                                            <td class="center">Member</td>
                                            <td class="center">
                                                <span class="label label-warning">Pending</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/01/21</td>
                                            <td class="center">Staff</td>
                                            <td class="center">
                                                <span class="label label-success">Active</span>
                                            </td>                                        
                                        </tr>                                   
                                    </tbody>
                                </table>  
                                <div class="pagination pagination-centered">
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
                                </div>     
                            </div>
                        </div>/span

                        <div class="box span6">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Condensed Table</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Date registered</th>
                                            <th>Role</th>
                                            <th>Status</th>                                          
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/01/01</td>
                                            <td class="center">Member</td>
                                            <td class="center">
                                                <span class="label label-success">Active</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/02/01</td>
                                            <td class="center">Staff</td>
                                            <td class="center">
                                                <span class="label label-important">Banned</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/02/01</td>
                                            <td class="center">Admin</td>
                                            <td class="center">
                                                <span class="label">Inactive</span>
                                            </td>                                        
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/03/01</td>
                                            <td class="center">Member</td>
                                            <td class="center">
                                                <span class="label label-warning">Pending</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/01/21</td>
                                            <td class="center">Staff</td>
                                            <td class="center">
                                                <span class="label label-success">Active</span>
                                            </td>                                        
                                        </tr>                                   
                                    </tbody>
                                </table>  
                                <div class="pagination pagination-centered">
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
                                </div>     
                            </div>
                        </div>/span

                    </div>/row-->

<!--                    <div class="row-fluid sortable">	
                        <div class="box span12">
                            <div class="box-header">
                                <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Combined All Table</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-bordered table-striped table-condensed">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Date registered</th>
                                            <th>Role</th>
                                            <th>Status</th>                                          
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/01/01</td>
                                            <td class="center">Member</td>
                                            <td class="center">
                                                <span class="label label-success">Active</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/02/01</td>
                                            <td class="center">Staff</td>
                                            <td class="center">
                                                <span class="label label-important">Banned</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/02/01</td>
                                            <td class="center">Admin</td>
                                            <td class="center">
                                                <span class="label">Inactive</span>
                                            </td>                                        
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/03/01</td>
                                            <td class="center">Member</td>
                                            <td class="center">
                                                <span class="label label-warning">Pending</span>
                                            </td>                                       
                                        </tr>
                                        <tr>
                                            <td>Dennis Ji</td>
                                            <td class="center">2012/01/21</td>
                                            <td class="center">Staff</td>
                                            <td class="center">
                                                <span class="label label-success">Active</span>
                                            </td>                                        
                                        </tr>                                   
                                    </tbody>
                                </table>  
                                <div class="pagination pagination-centered">
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
                                </div>     
                            </div>
                        </div>/span
                    </div>/row-->

                                        <div class="box-content">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Username</th>
                                                        <th>Date registered</th>
                                                        <th>Role</th>
                                                        <th>Status</th>                                          
                                                    </tr>
                                                </thead>   
                                                <tbody>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/01/01</td>
                                                        <td class="center">Member</td>
                                                        <td class="center">
                                                            <span class="label label-success">Active</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/02/01</td>
                                                        <td class="center">Staff</td>
                                                        <td class="center">
                                                            <span class="label label-important">Banned</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/02/01</td>
                                                        <td class="center">Admin</td>
                                                        <td class="center">
                                                            <span class="label">Inactive</span>
                                                        </td>                                        
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/03/01</td>
                                                        <td class="center">Member</td>
                                                        <td class="center">
                                                            <span class="label label-warning">Pending</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/01/21</td>
                                                        <td class="center">Staff</td>
                                                        <td class="center">
                                                            <span class="label label-success">Active</span>
                                                        </td>                                        
                                                    </tr>                                   
                                                </tbody>
                                            </table>  
                                            <div class="pagination pagination-centered">
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
                                            </div>     
                                        </div>
                                    </div>/span
            
                                    <div class="box span6">
                                        <div class="box-header">
                                            <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Condensed Table</h2>
                                            <div class="box-icon">
                                                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                            </div>
                                        </div>
                                        <div class="box-content">
                                            <table class="table table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th>Username</th>
                                                        <th>Date registered</th>
                                                        <th>Role</th>
                                                        <th>Status</th>                                          
                                                    </tr>
                                                </thead>   
                                                <tbody>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/01/01</td>
                                                        <td class="center">Member</td>
                                                        <td class="center">
                                                            <span class="label label-success">Active</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/02/01</td>
                                                        <td class="center">Staff</td>
                                                        <td class="center">
                                                            <span class="label label-important">Banned</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/02/01</td>
                                                        <td class="center">Admin</td>
                                                        <td class="center">
                                                            <span class="label">Inactive</span>
                                                        </td>                                        
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/03/01</td>
                                                        <td class="center">Member</td>
                                                        <td class="center">
                                                            <span class="label label-warning">Pending</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/01/21</td>
                                                        <td class="center">Staff</td>
                                                        <td class="center">
                                                            <span class="label label-success">Active</span>
                                                        </td>                                        
                                                    </tr>                                   
                                                </tbody>
                                            </table>  
                                            <div class="pagination pagination-centered">
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
                                            </div>     
                                        </div>
                                    </div>/span
            
                                </div>/row-->

            <!--                    <div class="row-fluid sortable">	
                                    <div class="box span12">
                                        <div class="box-header">
                                            <h2><i class="halflings-icon align-justify"></i><span class="break"></span>Combined All Table</h2>
                                            <div class="box-icon">
                                                <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                                <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                                <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                            </div>
                                        </div>
                                        <div class="box-content">
                                            <table class="table table-bordered table-striped table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th>Username</th>
                                                        <th>Date registered</th>
                                                        <th>Role</th>
                                                        <th>Status</th>                                          
                                                    </tr>
                                                </thead>   
                                                <tbody>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/01/01</td>
                                                        <td class="center">Member</td>
                                                        <td class="center">
                                                            <span class="label label-success">Active</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/02/01</td>
                                                        <td class="center">Staff</td>
                                                        <td class="center">
                                                            <span class="label label-important">Banned</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/02/01</td>
                                                        <td class="center">Admin</td>
                                                        <td class="center">
                                                            <span class="label">Inactive</span>
                                                        </td>                                        
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/03/01</td>
                                                        <td class="center">Member</td>
                                                        <td class="center">
                                                            <span class="label label-warning">Pending</span>
                                                        </td>                                       
                                                    </tr>
                                                    <tr>
                                                        <td>Dennis Ji</td>
                                                        <td class="center">2012/01/21</td>
                                                        <td class="center">Staff</td>
                                                        <td class="center">
                                                            <span class="label label-success">Active</span>
                                                        </td>                                        
                                                    </tr>                                   
                                                </tbody>
                                            </table>  
                                            <div class="pagination pagination-centered">
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
                                            </div>     
                                        </div>
                                    </div>/span
                                </div>/row-->



        </div><!--/.fluid-container-->

        <!-- end: Content -->

<div class="modal hide fade" id="myModal">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>Settings</h3>
    </div>
    <div class="modal-body">
        <p>Here settings can be configured...</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
        <a href="#" class="btn btn-primary">Save changes</a>
    </div>
</div>

<div class="clearfix"></div>

<footer>

    <p>
        <span style="text-align:left;float:left">&copy; 2013 <a href="http://jiji262.github.io/Bootstrap_Metro_Dashboard/" alt="Bootstrap_Metro_Dashboard">Bootstrap Metro Dashboard</a></span>

    </p>

</footer>

<!-- start: JavaScript-->
<script>
    var contextRoot = '${pageContext.request.contextPath}';
</script>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.0.0.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.0.custom.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.ui.touch-punch.js"></script>

<script src="${pageContext.request.contextPath}/js/modernizr.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>

<script src='${pageContext.request.contextPath}/js/fullcalendar.min.js'></script>

<script src='${pageContext.request.contextPath}/js/jquery.dataTables.min.js'></script>

<script src="${pageContext.request.contextPath}/js/excanvas.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flot.resize.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.chosen.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.uniform.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.cleditor.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.noty.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.elfinder.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.raty.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.iphone.toggle.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.uploadify-3.1.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.gritter.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.imagesloaded.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.masonry.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.knob.modified.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.sparkline.min.js"></script>

<script src="${pageContext.request.contextPath}/js/counter.js"></script>

<script src="${pageContext.request.contextPath}/js/retina.js"></script>

<script src="${pageContext.request.contextPath}/js/custom.js"></script>


<script src="${pageContext.request.contextPath}/js/categories.js"></script>
<!--<script src="${pageContext.request.contextPath}/js/custom.js"></script>-->
<script src="${pageContext.request.contextPath}/js/adminPanelTest.js"></script>
<script src="${pageContext.request.contextPath}/js/user.js"></script>


<!-- end: JavaScript-->

</body>
</html>