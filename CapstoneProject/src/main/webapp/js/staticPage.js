/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {


//    $('#create-submit').on('click', function (e) {
//
//        e.preventDefault();
//
//        $('#add-contact-validation-errors').empty();
//        var staticPageData = JSON.stringify({
//            name: $('#name-input').val()
//
//        });
//
//
//        $.ajax({
//            url: contextRoot + "/static/",
//            type: 'POST',
//            data: staticPageData,
//            dataType: 'json',
//            beforeSend: function (xhr) {
//                xhr.setRequestHeader("Accept", "application/json");
//                xhr.setRequestHeader("Content-Type", "application/json");
//
//            },
//            success: function (data, status) {
//
//                console.log(data);
//
//
//                var tableRow = buildCategoryRow(data);
////              console.log(tableRow);
//
//                $('#static-page-table').append($(tableRow));
//
//
//                $('#name-input').val('');
//
//
//            },
//            error: function (data, status) {
//
//                var errors = data.responseJSON.errors;
//
//                console.log(errors);
//
//                $.each(errors, function (index, error) {
//
//                    $('#add-contact-validation-errors').append(error.fieldName + ": " + error.message + "<br/>");
//
//                });
//            }
//        });
//    });


    function buildCategoryRow(data) {
        return "<tr id='static-page-row-" + data.id + "'>  \n\
                <td><a href=" + data.id + ">" + data.title + "</a></td>  \n\
                <td> <a data-static-page-id='" + data.id + "' data-toggle='modal' data-target='#editCategoryModal'>Edit</a>  </td>   \n\
                <td> <a data-static-page-id='" + data.id + "' class='delete-link'>Delete</a>  </td>   \n\
                </tr>  ";
    }

//    $('#showCategoryModal').on('show.bs.modal' , function(e){
//       
//        var link = $(e.relatedTarget);
//        
//        var categoryId = link.data('category-id');
//        
//        console.log(categoryId);
//        
//        $.ajax({
//           
//            url:contextRoot + "/category/" + categoryId,
//            type: 'GET' ,
//            dataType: 'json',
//            beforeSend: function(xhr){
//              
//              xhr.setRequestHeader("Accept", "application/json");
//                
//            },
//            success: function(data , status){
//              
//              $('#category-name').text(data.category);
//             
//            },
//            error: function(data , status){
//                alert('error');
//            }
//            
//        });
//        
//    });

    $('#editCategoryModal').on('show.bs.modal', function (e) {

        var link = $(e.relatedTarget);

        var staticPageId = link.data('static-page-id');

        console.log(staticPageId);

        $.ajax({
            url: contextRoot + "/static/" + staticPageId,
            type: 'GET',
            dataType: 'json',
            beforeSend: function (xhr) {

                xhr.setRequestHeader("Accept", "application/json");

            },
            success: function (data, status) {

                $('#edit-id').val(data.id);
                $('#edit-static-page-name').val(data.name);


            },
            error: function (data, status) {

            }

        });
    });

    $('#edit-static-page-button').on('click', function (e) {

        var staticPageData = JSON.stringify({
            id: $('#edit-id').val(),
            name: $('#edit-static-page-name').val()

        });


        $.ajax({
            url: contextRoot + "/static/",
            type: 'PUT',
            data: staticPageData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
//                       alert('finished'); 
            },
            success: function (data, status) {
                console.log("yes");
                $('#editCategoryModal').modal('hide');


                var tableRow = buildCategoryRow(data);

                $('#static-page-row-' + data.id).replaceWith($(tableRow));


            },
            error: function (data, status) {
                alert('PLEASE ENTER ALL THE FIELDS');
            }

        });
    });

    $(document).on('click', '.delete-link', function (e) {

        e.preventDefault();
        alert('got here!');
        var staticPageId = $(e.target).data('static-page-id');

        $.ajax({
            type: 'DELETE',
            url: contextRoot + '/static/' + staticPageId,
            success: function (data, status) {
                $('#static-page-row-' + staticPageId).remove();
                alert('success!');
            },
            error: function (data, status) {
                alert:('error');
            }

        });

    });


});
