<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/js/image-picker/image-picker.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <!--<link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">-->

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">

            <div class="row">
                <div class="picker masonry">
                    <select multiple="multiple" style="width: 300px; height: 150px;" class="image-picker show-html">
                        <c:forEach items="${imageIdList}" var="imageId">
                            <option data-img-src="${pageContext.request.contextPath}/image/showimage/${imageId}" value="${imageId}">${imageId}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <hr />
            <div class="row">
                <c:forEach items="${imageIdList}" var="imageId">
                    <img style="width: 50px; height: 50px;" src="${pageContext.request.contextPath}/image/showimage/${imageId}" />
                </c:forEach>
            </div>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
        <script src="${pageContext.request.contextPath}/js/masonry.pkgd.js"></script>

        <script>
            $("select").imagepicker({hide_select: false});

            $(document).ready(function ()
            {
                $(".image_picker_image").width(150);
                $(".image_picker_image").height(150);

            });
        </script>

    </body>
</html>

