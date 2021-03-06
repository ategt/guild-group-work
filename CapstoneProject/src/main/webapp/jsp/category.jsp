<%-- 
    Document   : catagories
    Created on : Jun 22, 2016, 10:46:13 AM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Pats Warehouse Blog</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutUs.css">
        <%@ include file="header.jsp" %>
    </head>
    <body>

        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <table class="table table-striped" id='category-table'>
                <tr>
                    <th>Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>    

                <c:forEach items="${categories}" var="cat">
                    <tr id="category-row-${cat.id}">
                        <!--<td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#showCategoryModal">${cat.name}</a></td>-->
                        <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#showCategoryModal">${cat.name}</a></td>
                        <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#editCategoryModal">Edit</a></td>
                        <td><a data-category-id="${cat.id}" class="delete-link">Delete</a></td>
                    </tr>

                </c:forEach>

            </table>
            <form method="POST" class="form-horizontal">

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="name" class="col-md-4 control-label"> Name:</label>
                        <div class="col-md-8">
                            <input type="text" id="name-input" class="form-control"/>
                        </div>
                    </div>  
                </div>


                <div style="height:160; width:370px; padding-left: 50px;" class="alert alert-info pull-right">
                    <strong>Please fill out ALL of the fields!</strong> 


                    <div id="add-contact-validation-errors">
                    </div> 
                </div>

                <input id="create-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
            </form>

        </div>

        <script>
            var contextRoot = '${pageContext.request.contextPath}';

        </script>

        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/categories.js"></script>


    </body>
</html>