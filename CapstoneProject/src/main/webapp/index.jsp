<%-- 
    Document   : homeLogin
    Created on : Jun 27, 2016, 11:24:26 AM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <meta charset="utf-8">
    <title>Daily UI - Day 1 Sign In</title>

    Google Fonts 
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homeLogin.css">
    Custom Stylesheet 
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

            <form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
                    
                    Username: <input type="text" name="username"/><br/>
                    Password: <input type="password" name="password"/><br/>
<!--                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
                    <input type="submit" value="Login"/>
                    
                    <c:if test="${loginError == 1}">
                        <div>Error logging in</div>
                    </c:if>
                    
                </form>
            <br/>
            <a href="#"><p class="small">Forgot your password?</p></a>


        </div>
    </div>
</body>


</html>


