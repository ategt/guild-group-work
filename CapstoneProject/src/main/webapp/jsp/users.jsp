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


