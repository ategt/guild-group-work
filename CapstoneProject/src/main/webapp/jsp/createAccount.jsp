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
        <br/>
        <a href="${pageContext.request.contextPath}/account"><p class="small">Create an Account</p></a>


    </div>




    <div class="login-box1 animated1 fadeInUp1">
        <div class="box-header">
            <h2>Create Account</h2>
        </div>
        <label for="username">Username</label>
        <br/>
        <input type="text" id="create-username">
        <br/>
        <label for="password">Password</label>
        <br/>
        <input type="password" id="create-password">
        <br/>
        <label for="email">Email</label>
        <br/>
        <input type="email" id="create-email">
        <br/>
        <input id="create-account" type="submit"></input>

        <a href="${pageContext.request.contextPath}/"><p class="small">Already Have an Account?</p></a>


    </div>


    <script>

        var contextRoot = '${pageContext.request.contextPath}';

    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/createUsers.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>


</body>
</html>


