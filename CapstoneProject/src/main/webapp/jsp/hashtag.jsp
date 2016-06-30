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
        <th>Name</th>
        <th>Use</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach items="${hashtags}" var="hashtag">
        <tr id="user-row-${hashtag.id}">
            <td>${hashtag.name}</td>
            <td>${hashtag.numOfUses}</td>
            <td><a data-user-id="${hashtag.id}">Edit</a></td>
            <td><a data-user-id="${hashtag.id}" class="delete-link">Delete</a></td>
        </tr>
    </c:forEach>

</table>


