/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
//    function buildCategoryRow(data){
//        var strVar="";
//        return "<tr id='category-row-" + data.id + "'>  \n\
//                <td><a data-category-id='" + data.id +"' data-toggle='modal' data-target='#showUserModal'>" + data.name + "</a></td>  \n\
//                <td> <a data-category-id='" + data.id +"' data-toggle='modal' data-target='#editUserModal' class='btn btn-info edit-category-button'>\n\
//                <i class='halflings-icon white edit'></i> </a>  </td>   \n\
//                <td> <a data-category-id='" + data.id +"' class='btn btn-danger delete-link-category'>\n\
//                <i class='halflings-icon white trash'></i></a>  </td>   \n\
//                </tr>  ";
      
      $('#editUserModal').on('show.bs.modal' , function(e){
       

        var link = $(e.relatedTarget);

        var userId = link.data('user-id');

        console.log(userId);

        $.ajax({
            url: contextRoot + "/adminPanel/edit/" + userId,
            type: 'GET',
            dataType: 'json',
            beforeSend: function (xhr) {

                xhr.setRequestHeader("Accept", "application/json");

            },
            success: function (data, status) {

                $('#edit-id').val(data.id);
                $('#edit-user-name').val(data.name);
                $('#edit-user-password').val(data.pasword);
                $('#edit-user-email').val(data.email);
                $('#edit-user-role').val(data.role);

            },
            error: function (data, status) {
                alert('error');
            }

        });
    });

     $('#edit-user-button').on('click', function(e){
        
          var userData = JSON.stringify( {
          
          
            id:$('#edit-id').val(),
            name:$('#edit-user-name').val(),
            password:$('#edit-user-password').val(),
            email:$('#edit-user-email').val(),
            role:$('#edit-user-role').val()

        });
        
        
        $.ajax({
           
           
           url:contextRoot + "/adminPanel/edit",
            
           type: 'PUT',
           data: userData,
           dataType: 'json',
            
           beforeSend:function(xhr){
               xhr.setRequestHeader("Accept", "application/json");
               xhr.setRequestHeader("Content-Type", "application/json");
//                       alert('finished'); 
           },
           success: function(data, status){
               
            $('#editUserModal').modal('hide');
           
            
//            var tableRow = buildUserRow(data);
            
//            $('#user-row-' + data.id).replaceWith($(tableRow));
            
            
    },
    error:function(data , status){
          alert('PLEASE ENTER ALL THE FIELDS');
    }
    
        });
});

    $(document).on('click' , '.delete-user-link' , function(e){
       
       e.preventDefault();
       
       var userId = $(e.target).data('user-id');
       
       $.ajax({
          type:'DELETE',
          url: contextRoot + '/user/' + userId,
          success: function(data , status){
                $('#user-row-' + userId).remove();
                console.log("success");
          },
          error: function(data , status){
              alert:('error');
          }
            
       });
        
    });
    });


//});