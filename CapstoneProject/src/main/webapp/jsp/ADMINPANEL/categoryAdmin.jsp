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
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>    


                                    <c:forEach items="${categories}" var="cat">
                                        <tr id="category-row-${cat.id}">  
                                            <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#showCategoryModal">${cat.name}</a></td>
                                            <td><a data-category-id="${cat.id}" data-toggle="modal" data-target="#editCategoryModal" class="btn btn-info edit-category-button">
                                                    <i class="halflings-icon white edit"></i> 
                                                </a>EDIT</td>
                                            <td><a data-category-id="${cat.id}"  class="btn btn-danger delete-link-category">
                                                    <i class="halflings-icon white trash"></i> 
                                                </a>DELETE</td>
                                        </tr>

                                    </c:forEach>
                                    </tbody>
                                </table> 

                                <form method="POST" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="name" class="col-md-4 control-label"> Name:</label>
                                        <div class="col-md-6">
                                            <input type="text" id="name-input" class="form-control"/>
                                        </div>
                                    </div>  

                                    <div id="add-category-validation-errors" class="error-message">
                                    </div> 
                            </div>

                            <center>
                                <input id="create-category-submit" class="btn btn-primary pull-right"  type="submit" value="Submit"/>
                            </center>
                            </form>
                            
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
                <h4 class="modal-title">Edit Category Details</h4>
              </div>
              <div class="modal-body">

                            <table class="table table-bordered" id="edit-category-table">

                                <input type="hidden" id="edit-id"/>
                                <tr>
                                    <th>Name:</th>
                                    <td>
                                        <input type="text" id="edit-category-name"/>
                                    </td>

                            </table>



              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="edit-category-button">Save</button>
              </div>
            </div>

          </div>
        </div>

<script>
    var contextRoot = '${pageContext.request.contextPath}';

</script>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/categories.js"></script>


</body>
</html>