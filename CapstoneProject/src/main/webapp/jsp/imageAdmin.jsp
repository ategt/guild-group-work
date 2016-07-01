<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <style>

            #dragandrophandler
            {
                /*border:3px solid black;*/
                /*width:400px;*/
                /*height:400px;*/
                /*color:#92AAB0;*/
                /*text-align:left;vertical-align:middle;*/
                /*padding:10px 10px 10px 10px;*/
                /*margin-bottom:10px;*/
                /*font-size:200%;*/
            }

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
                <div class="image-admin-panel">
              <div class="image-admin-header">
                <h4 class="modal-title">Select Images</h4>
                        <br />
                        Preview Image Size:
                        <select id="image-preview-size" class="image-preview-size form-control">
                            <option value="1" selected="selected">50x50</option>
                            <option value="2">100x100</option>
                            <option value="3">150x150</option>
                            <option value="4">200x200</option>
                        </select>
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
                        <div id="status1"></div>
                    </div>
                    <div class="col-md-6">

                        <div onclick="javascript:$('#selectSingleImageModal').modal();" id="thumb-container" class="thumb-container">
                            <img style="max-width: 150px; max-height: 200px;" src="${pageContext.request.contextPath}/image/showimage/0" />
                        </div>


                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectSingleImageModal">Select Default Thumbnail Image</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>

        <%@ include file="selectSingleImageModal.jsp" %>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admindropfile.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker-admin.js"></script>



    </body>
</html>

