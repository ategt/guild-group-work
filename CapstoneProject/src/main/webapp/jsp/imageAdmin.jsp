<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Image Administration Panel</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/js/image-picker/image-picker.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <style>

            #status1
            {
                width:400px;
                height:400px;
                padding:10px 10px 10px 10px;
                margin-bottom:10px;
                overflow: scroll;
            }

            .thumb-container
            {
                border:3px solid black;
                width:200px;
                height:200px;
                color:red;
                text-align:center;vertical-align:middle;
                padding:10px 10px 10px 10px;
                margin-bottom:10px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div id="dragandrophandler">

                <%@ include file="header.jsp" %>

                <div class="image-admin-panel">
                    <div class="row">
                        <div class="col-md-6">

                            <div onclick="javascript:$('#selectSingleImageModal').modal();" id="thumb-container" class="thumb-container">
                                <img style="max-width: 150px; max-height: 200px;" src="${pageContext.request.contextPath}/image/showimage/0" />
                            </div>


                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectSingleImageModal">Select Default Thumbnail Image</button>
                        </div>
                    </div>
              <div class="image-admin-body">

                        <div class="picker">
                            <select multiple="multiple" style="width: 500px; height: 150px;" id="admin-image-picker" class="image-picker show-html">
                                <c:forEach items="${imageIdList}" var="imageId">
                                    <option data-img-src="${pageContext.request.contextPath}/image/showimage/${imageId}" value="${imageId}">${pageContext.request.contextPath}/image/showimage/${imageId}</option>
                                </c:forEach>
                            </select>

                        </div>

              </div>
              <div class="image-admin-footer">

                        <div class="row">
                            <div class="col-md-6">
                                <form:form method="POST" commandName="file" enctype="multipart/form-data">

                                    Click Here To Upload An Image To The Server:
                                    <input type="file" class="btn btn-default" name="file" />
                                    <input type="submit" class="btn btn-default" value="upload" />
                                    <form:errors path="file" cssStyle="color: #ff0000;" />

                                </form:form>
                            </div>
                            <div class="col-md-6">
                <button type="button" class="delete-selected-images btn btn-default" >Delete Selected Images From The Database</button>
                            </div>
                        </div>
              </div>
            </div>
                <div class="row">
                    <div class="col-md-6">
                        <div id="status1">You can drag and drop an image into the center of this page, to add it to the database.</div>
                    </div>

                </div>
            </div>
        </div>

        <div id="selectSingleImageModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">

              <div class="modal-body">

                        <div class="picker masonry" style="overflow: scroll;max-height: 400px;">
                            <select style="width: 500px;" id="modal-single-image-picker" class="image-picker show-html">
                                <c:forEach items="${imageIdList}" var="imageId">
                                    <option data-img-src="${pageContext.request.contextPath}/image/showimage/${imageId}" value="${imageId}">${pageContext.request.contextPath}/image/showimage/${imageId}</option>
                                </c:forEach>
                            </select>
                        </div>



              </div>
              <div class="modal-footer">

                <button type="button" class="submit-from-single-detail-button btn btn-default" data-dismiss="modal">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

              </div>
            </div>

          </div>
        </div>

        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>



        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admindropfile.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker-admin.js"></script>



    </body>
</html>
