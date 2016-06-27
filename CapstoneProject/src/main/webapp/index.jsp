<%-- 
    Document   : homeLogin
    Created on : Jun 27, 2016, 11:24:26 AM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
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
                    <c:forEach items="${staticPages}" var="staticPage">
                    <li role="presentation"><a href="static/show/${staticPage.id}">${staticPage.title}</a></li>
                    </c:forEach>

                </ul>    
            </div>

            <div class="row-fluid top30 pagetitle">

                <div class="container">

                    <div class="row">

                        <div class="col-md-12"><h1>Pats Warehouse and Stuff</h1></div>


                    </div>

                </div>



            </div>
            <div class="container">


                <div class="row">
                    <div class="col-md-3">


                        <!--<h4 class="">Search</h4>-->

                        <!--                        <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>-->
                        <button type="button" class="btn btn-default btn-sm btn-block hidden-lg hidden-md" data-toggle="collapse" data-target="#demo">Refine your search <span class="caret"></span>

                        </button>

                        <div id="demo" class="collapse in">
                            <hr>
                            <div class="list-group list-group">
                                <h4 class="">Categories</h4>
                                
                                <c:forEach items="${categories}" var="cat">
                                    <a class="list-group-item"><span class = "badge"></span>${cat.name}</a>

                                </c:forEach>

                                <div id="categories" class="collapse">
                                    
                                </div>

                                <!--<button class="btn btn-default btn-sm btn-block" data-toggle="collapse" data-target="#categories">More <span class="caret"></span></button>-->

                            </div>
                        </div>



                        <div class="hidden-sm hidden-xs">

                            <hr>

                            <div class="well">

                                <div class="list-group list-group">
                                    <h4 class=""> Top Trending #hashtags</h4>
                                    <c:forEach items="${hashTag}" var="hashtag">
                                        <a class="list-group-item"><span class = "badge"></span>${hashtag.name}</a>

                                    </c:forEach>
                                </div>

                                <hr>

                            </div>


                            <hr>

                            <div class="well">
=======
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Daily UI - Day 1 Sign In</title>

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeLogin.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeLogin.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">Capstone <span>Blog</span></span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">Username</label>
			<br/>
			<input type="text" id="username">
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password">
			<br/>
			<button type="submit">Sign In</button>
                        <br>
                        <br>
                        <a href="${pageContext.request.contextPath}/home/"/><button type="submit">Continue As A Guest</button></a>
			<br/>
			<a href="#"><p class="small">Forgot your password?</p></a>
                        
                        
		</div>
	</div>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f

</html>


