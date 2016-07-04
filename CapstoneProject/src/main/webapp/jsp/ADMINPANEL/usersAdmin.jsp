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
<html>
    <head>

    </head> 
    <body>

        <table class="table table-bordered table-hover" id="user-table">

            <tr>
                <th>User Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Date Joined</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <c:forEach items="${users}" var="user">
              
                <tr id="user-row-${user.id}">
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td><fmt:formatDate pattern="MM/dd/yyyy" value="${user.joinedOn}"/></td>
                    <td><a  data-user-id="${user.id}" data-toggle="modal" data-target="#editUserModal">Edit</a></td>
                    <td><a data-user-id="${user.id}" class="delete-link">Delete</a></td>
                </tr>
       
            </c:forEach>
                
        </table>
                
                
                
                <div id="editUserModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit User</h4>
              </div>
              <div class="modal-body">

                <table class="table table-bordered" id="edit-user-table">

                    <input type="hidden" id="edit-id"/>

                    <tr>
                        <th>Username:</th>
                        <td>
                            <input type="text" id="edit-user-name"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Password:</th>
                        <td>
                            <input type="password" id="edit-user-password"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>
                            <input type="text" id="edit-user-email"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Role:</th>
                        <td>
                            <select id="edit-user-role">
                                <option>ROLE_USER</option>
                                <option>ROLE_AUTHOR</option>
                                <option>ROLE_ADMIN</option>
                            </select>
                            <!--<input type="text" id="edit-user-role"/>-->
                        </td>
                    </tr>

                </table>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" id="edit-user-button">Save</button>
              </div>
            </div>

          </div>
        </div>



        </table>
        <script>
        var contextRoot = '${pageContext.request.contextPath}';
        </script>

        <script src="${pageContext.request.contextPath}/js/user.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminPanel.js"></script>




    </body>




</html>