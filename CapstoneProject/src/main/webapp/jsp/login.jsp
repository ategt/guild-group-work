<%-- 
    Document   : homeLogin
    Created on : Jun 27, 2016, 11:24:26 AM
    Author     : apprentice
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <meta charset="utf-8">
    <title>Daily UI - Day 1 Sign In</title>

    <!--Google Fonts--> 
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeLogin.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="top">
            <h1 id="title" class="hidden"><span id="logo">Capstone <span>Blog</span></span></h1>
        </div>

        <form:form action="${pageContext.request.contextPath}/j_spring_security_check" commandName="user" method="POST">
            <div class="login-box animated ">
                <div class="box-header">
                    <h2>Log In</h2>
                </div>
                <!--<form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">-->
                    <label for="username">Username</label><br/>
                    <input type="text" name="username" id="login-username"/><br/>
                    <label for="password">Password</label><br/>
                    <input type="password" name="password" id="login-password"/><br/>
                    <input type="submit" value="Login"/>
                    <br/>
                    <a href="${pageContext.request.contextPath}/createAccount"><p class="small">Create an Account</p></a>

                    <c:if test="${loginError == 1}">
                        <div>Error logging in</div>
                    </c:if>


            </div>
        </form:form>              
    </div>


    <script>

        var contextRoot = '${pageContext.request.contextPath}'

    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/createUsers.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>


</body>
</html>


