<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Static Page</title>
        <!--Bootstrap core CSS--> 
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <!--<link href="${pageContext.request.contextPath}/css/adminPanel.css" rel="stylesheet">-->

        <!--Custom styles for this template--> 
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!--SWC Icon--> 
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <%--<%@ include file="header.jsp" %>--%>
        
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

<!--        <div class="container-fluid-full">
            <div class="row-fluid">-->

                <!-- start: Main Menu -->
                <div id="sidebar-left" class="span2">
                    <div class="nav-collapse sidebar-nav">
                        <ul class="nav nav-tabs nav-stacked main-menu">
                            <!--<li><a href="${pageContext.request.contextPath}/adminPanel/"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Dashboard</span></a></li>-->	
                            <li><a  class="padded" href="${pageContext.request.contextPath}/home"><i class="icon-home"></i><span class="hidden-tablet">Home</span></a></li>
                            <li><a onclick="changeContent${pageContext.request.contextPath}/adminPanel/pendingPosts"><i class="icon-home"></i><span class="hidden-tablet">Pending Posts</span></a></li>
                            <li><a onclick="changeContent${pageContext.request.contextPath}/adminPanel/editPosts"><i class="icon-home"></i><span class="hidden-tablet">Edit Posts</span></a></li>
                            <a onclick="${pageContext.request.contextPath}/static">Static Pages</a>
                            <li><a  class="padded"onclick="changeContent${pageContext.request.contextPath}/adminPanel/users"><i class="icon-home"></i><span class="hidden-tablet">Manage Users</span></a></li>
                            <li><a onclick="changeContent${pageContext.request.contextPath}/adminPanel/categories"><i class="icon-home"></i><span class="hidden-tablet">Manage Categories</span></a></li>
                            <li><a onclick="changeContent${pageContext.request.contextPath}/adminPanel/hashtags"><i class="icon-home"></i><span class="hidden-tablet">Hashtags</span></a></li>
                            <li><a onclick="changeContent${pageContext.request.contextPath}/adminPanel/images"><i class="icon-home"></i><span class="hidden-tablet">Images</span></a></li>
                            
                                  <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/pendingPosts')">Pending Posts</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/editPosts')">Edit Posts</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/static/')">Edit Static Pages</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/users')">Manage Users</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/categories')">Manage Categories</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/hashtags')">Manage Hashtags</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/images')">Images</a>

                    <a class="padded" class="btn btn-success" href="${pageContext.request.contextPath}/home">Home</a>
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
                <div id="content" class="span8">


                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="${pageContext.request.contextPath}">Home</a> 
                        </li>
                    </ul>



<!--        <div id="page">

            <nav >
                <ul>
                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/pendingPosts')">Pending Posts</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/editPosts')">Edit Posts</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/static/')">Edit Static Pages</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/users')">Manage Users</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/categories')">Manage Categories</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/hashtags')">Manage Hashtags</a>

                    <a class="padded" class="btn btn-success" onclick="changeContent('${pageContext.request.contextPath}/adminPanel/images')">Images</a>

                    <a class="padded" class="btn btn-success" href="${pageContext.request.contextPath}/home">Home</a>

                </ul></nav>-->

            <section>  
                <h1>Admin Panel</h1>

            </section>

            <div class="col-md-2">
            </div>


            <div  class="col-md-8" id="admin-div">

            </div>

            <div class="com-md-2"></div>


        </div>
        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>



        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>
        <script src="${pageContext.request.contextPath}/js/user.js"></script>
        <script src="${pageContext.request.contextPath}/js/staticPages.js"></script>




        <link rel="stylesheet" href="./material.min.css">
        <script src="./material.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


    </body>
</html>

