/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
      
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

                $('#edit-user-id').val(data.id);
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
          
          
            id:$('#edit-user-id').val(),
            name:$('#edit-user-name').val(),
            password:$('#edit-user-password').val(),
            email:$('#edit-user-email').val(),
            role:$('#edit-user-role').val()

        });
        
        
        $.ajax({
           
           
           url:contextRoot + "/adminPanel/editUser",
            
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
           
            
            var tableRow = buildUserRow(data);
            
            $('#user-row-' + data.id).replaceWith($(tableRow));
            
            
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
    
    
    function buildOrderRow(data){
        var strVar="";
        return "<tr id='order-row-" + data.id + "'>  \n\
                <td><a data-order-id='" + data.id +"' data-toggle='modal' data-target='#showOrderModal'>" + data.name + "</a></td>  \n\
                <td> " + data.password + "</td>  \n\
                <td> " + data.email + "</td>    \n\
                <td> " + data.role + "</td>    \n\
                <td> <a data-order-id='" + data.id +"' data-toggle='modal' data-target='#editOrderModal'>Edit</a>  </td>   \n\
                <td> <a data-order-id='" + data.id +"' class='delete-link'>Delete</a>  </td>   \n\
                </tr>  ";
    }
    });


//});