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

<!--        <form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
            <div class="login-box animated ">
                <div class="box-header">
                    <h2>Log In</h2>
                </div>
                <form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
                    <label for="username">Username</label><br/>
                    <input type="text" name="username" id="login-username"/><br/>
                    <label for="password">Password</label><br/>
                    <input type="password" name="password" id="login-password"/><br/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Login"/>-->

                    <!--<<<<<<< HEAD
                                <label for="username">Username</label>
                                <br/>
                                <input type="text" id="username" name="username">
                                <br/>
                                <label for="password">Password</label>
                                <br/>
                                <input type="password" id="password" name="password">
                                <br/>
                                <button type="submit">Sign In</button>
                                <br>
                                <c:if test="${loginError == 1}">
                                            <div>Error logging in</div>
                                        </c:if>
                                <br>
                                <a href="${pageContext.request.contextPath}/home/"/><button type="submit">Continue As A Guest</button></a>
                    =======
                                </form>
                    
                                <a href="${pageContext.request.contextPath}/home/"/><button type="submit">Continue As A Guest</button></a>
                    >>>>>>> 64fd5d8bffafc02d93c6e548e2da4e8786de601b-->
                    <br/>
                    <a href="${pageContext.request.contextPath}/account"><p class="small">Create an Account</p></a>


            </div>
    </div>
</form>




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
    
   




<!--            <form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST">
                    
                    Username: <input type="text" name="username"/><br/>
                    Password: <input type="password" name="password"/><br/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" value="Login"/>
                    
                    <c:if test="${loginError == 1}">
                        <div>Error logging in</div>
                    </c:if>
                    
                </form>
            <br/>
            <a href="#"><p class="small">Forgot your password?</p></a>



        </div>
    </div>-->


<!--
--><script>

    var contextRoot = '${pageContext.request.contextPath}'

</script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/createUsers.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>


</body>
</html>


