<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="selectImagesModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Select Images</h4>
                <br />
                Preview Image Size:
                <select id="multi-image-preview-size" class="image-preview-size form-control">
                    <option value="1" selected="selected">50x50</option>
                    <option value="2">100x100</option>
                    <option value="3">150x150</option>
                    <option value="4">200x200</option>
                    <!--<option value="0">Native</option>-->
                </select>
              </div>
              <div class="modal-body">

                <div class="picker masonry" style="overflow: scroll;max-height: 400px;">
                     <select multiple="multiple" style="width: 500px; height: 150px;" id="modal-image-picker" class="image-picker show-html">
                     <c:forEach items="${imageIdList}" var="imageId">
                        <option data-img-src="${pageContext.request.contextPath}/image/showimage/${imageId}" value="${imageId}">${pageContext.request.contextPath}/image/showimage/${imageId}</option>
                    </c:forEach>
                    </select>
                </div>

              </div>
              <div class="modal-footer">

                <button type="button" class="submit-from-detail-button btn btn-default" data-dismiss="modal">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

              </div>
            </div>

          </div>
        </div>
