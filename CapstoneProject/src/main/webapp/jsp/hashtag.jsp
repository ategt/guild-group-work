
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
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


