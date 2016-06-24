<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Flying Monkeys</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h1>The Monkey Tasked With Finding That Post Came Back Empty Handed!</h1>
            <hr/>
            <h2>It looks like that blog post does not exist.</h2>
            <div class="row">
                <div class="col-sm-offset-2 col-sm-2" >
                    <a href="${pageContext.request.contextPath}">Go To The Home Page</a>
                    
                </div>
                
                <div class="col-sm-offset-1 col-sm-2" >
                    <a href="mailto:ptoner@thesoftwareguild.com">Report This Issue To Technical Support</a>
                    
                </div>
                
            </div>
        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>

