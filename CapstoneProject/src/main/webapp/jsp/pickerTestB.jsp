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

 <!--<button type="button" class="edit-from-detail-button btn btn-default" data-dismiss="modal">Edit</button>-->
            <br />
 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#selectImagesModal">Show Modal</button>
            <!--<a data-toggle="modal" data-target="#selectImagesModal">Edit</a>-->

<!-- data-dvd-id="${dvd.id}" 
data-toggle="modal" 
data-target="#editDetailModal"-->

            <hr />
            <div class="row">
                <c:forEach items="${imageIdList}" var="imageId">
                    <img style="width: 50px; height: 50px;" src="${pageContext.request.contextPath}/image/showimage/${imageId}" />
                </c:forEach>
            </div>
        </div>




        <!--Modals--> 



        <div id="selectImagesModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Select Images</h4>
              </div>
              <div class="modal-body">



                        <div class="picker masonry">
                            <select multiple="multiple" style="width: 500px; height: 150px;" id="modal-image-picker" class="image-picker show-html">
                                <c:forEach items="${imageIdList}" var="imageId">
                                    <option data-img-src="${pageContext.request.contextPath}/image/showimage/${imageId}" value="${imageId}">${pageContext.request.contextPath}/image/showimage/${imageId}</option>
                                </c:forEach>
                            </select>
                        </div>



              </div>
              <div class="modal-footer">
                        <!--<button type=\"button\" data-dvd-id=\"" + data.id + "\" class=\"edit-from-detail-button btn btn-default\" data-dismiss=\"modal\">Edit</button>-->

                <button type="button" class="submit-from-detail-button btn btn-default" data-dismiss="modal">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

              </div>
            </div>

          </div>
        </div>












        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/image-picker/image-picker.js"></script>
        <script src="${pageContext.request.contextPath}/js/masonry.pkgd.js"></script>

        <script>
            $("select").imagepicker({hide_select: false});

            $(document).ready(function ()
            {
                $(".image_picker_image").width(150);
                $(".image_picker_image").height(150);

                //$('#myimage').width(700); // Units are assumed to be pixels
                //$('#myimage').height(700);

                $(document).on('click', '.submit-from-detail-button', function (e) {

                    e.preventDefault();
//                    var dvdId = $(e.target).data('dvd-id');
//                    var curDvdId = $(e.currentTarget).data('dvd-id');

//                    console.log(curDvdId);
//                    console.log(dvdId);

                    //$("#editDetailModal").modal();

                    //pullUpEditMenu(dvdId);


                    var selectedValues = $('#modal-image-picker').val();
                    
                    

                    console.log(selectedValues);

//                    $(selectedValues).each(function (index, element) {
//                        var e = element;
//                        
//                        var i = index;
//                        
//                        console.log("Element: " + e);
//                        //console.log("Index: " + i);
//                        
//                        
//
//                    });

// element == this
//                        $(element).css("backgroundColor", "yellow");
//                        if ($(this).is("#stop")) {
//                            $("span").text("Stopped at div index #" + index);
//                            return false;
//                        }




//                    var foo = [];
//                    $('#modal-image-picker :selected').each(function (i, selected) {
//                        foo[i] = $(selected).text();
//                    });

                });

            });


        </script>

    </body>
</html>

