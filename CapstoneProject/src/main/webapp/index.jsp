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
            <label for="username">Username</label>
            <br/>
            <input type="text" id="login-username">
            <br/>
            <label for="password">Password</label>
            <br/>
            <input type="password" id="login-password">
            <br/>
            <button type="submit">Sign In</button>
            <br>
            <br>
            <a href="${pageContext.request.contextPath}/home/"/><button type="submit">Continue As A Guest</button></a>
            <br/>
            <a data-toggle="modal" data-target="#showAccountModal"><p class="small">Create an Account</p></a>


        </div>
    </div>



    <!--<div id="showAccountModal" class="modal fade" role="dialog">
          <div class="modal-dialog">
    
             Modal content
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Account</h4>
              </div>
              <div class="modal-body">
    
                    <table class="table table-bordered" id="show-category-table">
    
                         <tr>
                            <th>Username:</th>
                            <td>
                                <input type="text" id="user-name"/>
                            </td>
                        </tr>
                         <tr>
                            <th>Password:</th>
                            <td>
                                <input type="text" id="user-password"/>
                            </td>
                        </tr>
                         <tr>
                            <th>Email:</th>
                            <td>
                                <input type="text" id="user-email"/>
                            </td>
                        </tr>
    
                    </table>
    
    
    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
    
          </div>
        </div>-->

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
        <input id="create-submit" type="submit"></input>



    </div>
</div>

</body>
<script>
//    $(document).ready(function () {
//        $('#logo').addClass('animated fadeInDown');
//        $("input:text:visible:first").focus();
//    });
//    $('#username').focus(function () {
//        $('label[for="username"]').addClass('selected');
//    });
//    $('#username').blur(function () {
//        $('label[for="username"]').removeClass('selected');
//    });
//    $('#password').focus(function () {
//        $('label[for="password"]').addClass('selected');
//    });
//    $('#password').blur(function () {
//        $('label[for="password"]').removeClass('selected');
//    });
</script>


<script>
    var contextRoot = '${pageContext.request.contextPath}';

</script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/createUsers.js"></script>


</html>


