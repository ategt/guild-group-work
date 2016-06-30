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

            <br />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectImagesModal">Show Modal</button>
            <br />
            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectSingleImageModal">Show Single Modal</button>

            <hr />
            <div class="row">
                <c:forEach items="${imageIdList}" var="imageId">
                    <img style="width: 50px; height: 50px;" src="${pageContext.request.contextPath}/image/showimage/${imageId}" />
                </c:forEach>
            </div>
            <div class="image-container" >

            </div>
        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script>

            $(document).ready(function ()
            {
                $(document).on('click', '.submit-from-single-detail-button', function (e) {

                    e.preventDefault();
                    var selectedValue = $('#modal-single-image-picker').val();
                    console.log("Single Select: " + selectedValue);
                    var imageLink = '"<img src="${pageContext.request.contextPath}/image/showimage/' + selectedValue + '" />';
                    $(".image-container").html(imageLink);
                });
                $(document).on('click', '.submit-from-detail-button', function (e) {

                    e.preventDefault();
                    var selectedValues = $('#modal-image-picker').val();
                    console.log("Many Values Selected: " + selectedValues);
                    var imageLinkCum = "";
                    var imageLink = "";
                    $(selectedValues).each(function (index, value) {
                        imageLink = '<img src="${pageContext.request.contextPath}/image/showimage/' + value + '" />';
                        imageLinkCum += imageLink + "<br />";
                        console.log(imageLinkCum);
                    }
                    );
                    $(".image-container").html(imageLinkCum);
                });
            });
        </script>
        <%@ include file="selectImagesModal.jsp" %>
        <%@ include file="selectSingleImageModal.jsp" %>
    </body>
</html>

