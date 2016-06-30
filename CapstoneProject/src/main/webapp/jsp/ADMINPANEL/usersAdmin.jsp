<%-- 
    Document   : users
    Created on : Jun 28, 2016, 5:08:15 PM
    Author     : apprentice
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head> 
    <body>
        
<table class="table table-bordered table-hover" id="user-table">

    <tr>
        <th>User Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Date Joined</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${users}" var="user">
        <tr id="user-row-${user.id}">
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
            <td><fmt:formatDate pattern="MM/dd/yyyy" value="${user.joinedOn}"/></td>
            <td><a data-user-id="${user.id}" data-toggle="modal" data-target="#editUserModal">Edit</a></td>
            <td><a data-user-id="${user.id}" class="delete-link">Delete</a></td>
        </tr>
    </c:forEach>

</table>
        
        
         <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>
    <script src="${pageContext.request.contextPath}/js/user.js"></script>
    </body>


</html>