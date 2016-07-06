<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <meta charset="utf-8">
        <title>Pats Warehouse Blog</title>

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
        <br/>
        <a href="${pageContext.request.contextPath}/account"><p class="small">Create an Account</p></a>


    </div>

    <form:form method="POST" commandName="user" action="${pageContext.request.contextPath}/createUser/">
        <div class="login-box1 animated1 fadeInUp1">
            <div class="box-header">
                <h2>Create Account</h2>
            </div>
            
            <div class="form-group">
                <label for="name" class="col-md-4 control-label">Username </label>
                <div class="col-md-8">
                    <form:input path="name" class="form-control"></form:input><br/>
                    <form:errors path="name"  class="form-control error-message"/>
                </div>
            </div>
                
            <br/>
            
            <div class="form-group">
                <label for="password" class="col-md-4 control-label">Password </label>
                <div class="col-md-8">
                    <form:input path="password" type="password" class="form-control"></form:input><br/>
                    <form:errors path="password"  class="form-control error-message"/>
                </div>
            </div>

            <br/>
            
            <div class="form-group">
                <label for="email" class="col-md-4 control-label">Email </label>
                <div class="col-md-8">
                    <form:input path="email" class="form-control"></form:input><br/>
                    <form:errors path="email"  class="form-control error-message"/>
                </div>
            </div>
                
            <br/>
            <input type="submit" value="Submit">
            <a href="${pageContext.request.contextPath}/"><p class="small">Already Have an Account?</p></a>
        </div>
    </form:form>  

    <script>

        var contextRoot = '${pageContext.request.contextPath}';

    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!--    <script src="${pageContext.request.contextPath}/js/createUsers.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>-->


</body>
</html>


