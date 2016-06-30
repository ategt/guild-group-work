<%-- 
    Document   : selectImagesModal
    Created on : Jun 29, 2016, 11:05:47 AM
    Author     : apprentice
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="selectSingleImageModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Select Images</h4>
                <br />
                Preview Image Size:
                <select id="image-preview-size" class="image-preview-size form-control">
                    <option value="1" selected="selected">50x50</option>
                    <option value="2">100x100</option>
                    <option value="3">150x150</option>
                    <option value="4">200x200</option>
                    <!--<option value="0">Native</option>-->
                </select>
              </div>
              <div class="modal-body">



                <div class="picker masonry">
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

<script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
<script>
    $("select").imagepicker({hide_select: false});

    $(document).ready(function ()
    {
        $(".image_picker_image").width(50);
        $(".image_picker_image").height(50);

        $(".image-preview-size").change(function () {

            var imageSize = $('#image-preview-size').val();

            var width = 50;
            var height = 50;

            if (imageSize == 1) {
                width = 50;
                height = 50;
            } else if (imageSize == 2) {
                width = 100;
                height = 100;
            } else if (imageSize == 3) {
                width = 150;
                height = 150;
            } else if (imageSize == 4) {
                width = 200;
                height = 200;
            }

            $(".image_picker_image").width(height);
            $(".image_picker_image").height(width);

        });

    });


</script>

