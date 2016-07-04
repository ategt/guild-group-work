<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Static Page</title>
        <!-- Bootstrap core CSS -->
        <!--<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutUs.css">

    </head>
    <body>
        
        <table class="table table-bordered table-hover" id="category-table">
        <tr>
            <th>Name</th>
            <th>Delete</th>
        </tr>    

            
        <c:forEach items="${categories}" var="cat">
        <tr id="category-row-${cat.id}">  
            <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#showCategoryModal">${cat.name}</a></td>
            <td><a data-category-id="${cat.id}" class="delete-link">Delete</a></td>
        </tr>

        </c:forEach>
        </table>
        
        <form method="POST" class="form-horizontal">
            <div class="form-group">
                <label for="name" class="col-md-4 control-label"> Name:</label>
                <div class="col-md-6">
                <input type="text" id="name-input" class="form-control"/>
            </div>
            </div>  
        
            <div id="add-contact-validation-errors">
        </div> 
    </div>
    
<center>
    <input id="create-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
</center>
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