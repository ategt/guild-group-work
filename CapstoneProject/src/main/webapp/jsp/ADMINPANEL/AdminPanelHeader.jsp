<%-- 
    Document   : AdminPanelHeader
    Created on : Jul 5, 2016, 2:04:44 PM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <!--<link id="bootstrap-style" href="${pageContext.request.contextPath}/css/bootstrap.ap.min.css" rel="stylesheet">-->
        <link id="bootstrap-style" href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link id="base-style" href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link id="base-style" href="${pageContext.request.contextPath}/css/error.css" rel="stylesheet">
        <link id="base-style-responsive" href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
        <link href="https://opensource.keycdn.com/fontawesome/4.6.3/font-awesome.min.css" rel="stylesheet">
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

<!--        <div class="container-fluid-full">
            <div class="row-fluid">-->

                <!-- start: Main Menu -->
                <div id="sidebar-left" class="span2">
                    <div class="nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <!--<li><a href="${pageContext.request.contextPath}/adminPanel/"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>-->	
                            <li><a  class="padded" href="${pageContext.request.contextPath}/home"><i class="icon-home"></i><span class="hidden-tablet">Home</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/adminPanel/pendingPosts"><i class="icon-home"></i><span class="hidden-tablet">Pending Posts</span></a></li>
                            <li><a herf="${pageContext.request.contextPath}/adminPanel/editPosts"><i class="icon-home"></i><span class="hidden-tablet">Edit Posts</span></a></li>
                            <li><a herf="${pageContext.request.contextPath}/static"><i class="icon-home"></i><span class="hidden-tablet">Static Pages</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/adminPanel/users"><i class="icon-home"></i><span class="hidden-tablet">Manage Users</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/adminPanel/categories"><i class="icon-home"></i><span class="hidden-tablet">Manage Categories</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/adminPanel/hashtags"><i class="icon-home"></i><span class="hidden-tablet">Hashtags</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/adminPanel/imageadmin"><i class="icon-home"></i><span class="hidden-tablet">Images</span></a></li>
                            
                        </ul>
                    </div>
                </div>
                <!-- end: Main Menu -->
    </body>
</html>
