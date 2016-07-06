<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<img width="100%" height="200" src="http://www.sandbergmaskin.no/wp-content/uploads/2014/06/Light-Wood-Background-slider.jpg"/>
<nav id="navbar-main" class="navbar navbar-inverse" id="primary">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>

        </button>
        <a class="navbar-brand" href="#">CAPSTONE</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li role="presentation"><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li role="presentation" ><a href="${pageContext.request.contextPath}/admin/">Admin Panel</a></li>

            <c:forEach items="${staticPages}" var="staticPage">
                <li role="presentation"><a href="${pageContext.request.contextPath}/static/show/${staticPage.id}">${staticPage.title}</a></li>
            </c:forEach>

            <li role="presentation"><a href="${pageContext.request.contextPath}/logout" class="">Log Out</a></li>
        </ul>
    </div>
</nav>
