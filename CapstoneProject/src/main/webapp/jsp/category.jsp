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
        <title>Hello Controller Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
    <thead>
    <img width="100%" height="200" src="http://www.sandbergmaskin.no/wp-content/uploads/2014/06/Light-Wood-Background-slider.jpg"/>
</thead> 



<nav id="navbar-main" class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>

            </button>
            <a class="navbar-brand" href="#">CAPSTONE</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li role="presentation" ><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li role="presentation" ><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                <li role="presentation" ><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/categories" class="">Categories</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/aboutUs" class="">About Us</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/" class="">Log In</a></li>
                
                    <c:forEach items="${staticPages}" var="staticPage">
                    <li role="presentation"><a href="static/show/${staticPage.id}">${staticPage.title}</a></li>
                    </c:forEach>
            </ul>
        </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-6">


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
        </div> 
        <div class="col-md-6">
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
    </div>

    <input id="create-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
</form>

</div>



<div id="showCategoryModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Category Details</h4>
              </div>
              <div class="modal-body">

                <table class="table table-bordered" id="show-category-table">

                    <tr>
                        <th>Name:</th>
                        <td id="category-name"></td>
                    </tr>

                </table>



              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>

          </div>
        </div>


<div id="editCategoryModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Category</h4>
              </div>
              <div class="modal-body">

                <table class="table table-bordered" id="edit-category-table">

                    <input type="hidden" id="edit-id"/>

                    <tr>
                        <th>Category:</th>
                        <td>
                            <input type="text" id="edit-category-name"/>
                        </td>
                    </tr>

                </table>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="edit-category-button">Save</button>
              </div>
            </div>

          </div>
        </div>

<<<<<<< HEAD
    <script>
        var contextRoot = '${pageContext.request.contextPath}';
=======
<script>
    var contextRoot = '${pageContext.request.contextPath}'
>>>>>>> 5c8d3348bb2f8c0c7063782826511c66893b161f

</script>




</div>
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/categories.js"></script>

</body>
</html>
