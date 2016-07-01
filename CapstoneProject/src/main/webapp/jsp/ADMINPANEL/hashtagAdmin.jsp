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


<div class="well">
    <div class="list-group list-group">
    <h4 class=""> Top Trending #hashtags</h4>
      <c:forEach items="${hashTag}" var="hashtag">
      <a href="${pageContext.request.contextPath}/hashtag/${hashtag.name}" class="list-group-item"><span class = "badge"></span>${hashtag.name}</a>
      </c:forEach>
    </div>
    <hr>
</div>

<table class="table table-bordered table-hover"  id="user-table">

    <tr>
        <th>Name</th>
        <th>Uses</th>
        <!--<th>Edit</th>-->
        <!--<th>Delete</th>-->
    </tr>

    <c:forEach items="${hashtags}" var="hashtag">
        <tr id="user-row-${hashtag.id}">
            <td>${hashtag.name}</td>
            <td>${hashtag.numOfUses}</td>
            <!--<td><a data-user-id="${hashtag.id}">Edit</a></td>-->
            <!--<td><a data-user-id="${hashtag.id}" class="delete-link">Delete</a></td>-->
        </tr>
    </c:forEach>

</table>


