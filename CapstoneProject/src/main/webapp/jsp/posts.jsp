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
        <th>Title</th>
        <th>Author</th>
        <th>Category</th>
        <th>Date Posted</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${posts}" var="post">
        <tr id="user-row-${post.id}">
            <td>${post.title}</td>
            <td>${post.user.name}</td>
            <td>${post.category}</td>
            <td><fmt:formatDate pattern="MM/dd/yyyy" value="${post.postedOn}"/></td>
            <td><a data-user-id="${post.id}">Edit</a></td>
            <td><a data-user-id="${post.id}" class="delete-link">Delete</a></td>
        </tr>
    </c:forEach>

</table>


