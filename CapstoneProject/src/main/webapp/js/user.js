/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   
    
       
        
        
       
    
    
    function buildUserRow(data){
        var strVar="";
        return "<tr id='user-row-" + data.id + "'>  \n\
                <td><a data-user-id='" + data.id +"' data-toggle='modal' data-target='#showUserModal'>" + data.name + "</a></td>  \n\
                <td> <a data-user-id='" + data.id +"' data-toggle='modal' data-target='#editUserModal'>Edit</a>  </td>   \n\
                <td> <a data-user-id='" + data.id +"' class='delete-link'>Delete</a>  </td>   \n\
                </tr>  ";
    }
    

    
    $('#editUserModal').on('show.bs.modal' , function(e){
       
        var link = $(e.relatedTarget);
        
        var userId = link.data('user-id');
        
        console.log(userId);
        
         $.ajax({
           
            url:contextRoot + "/adminPanel/",
            type: 'GET' ,
            dataType: 'json',
            beforeSend: function(xhr){
              
              xhr.setRequestHeader("Accept", "application/json");
                
            },
            success: function(data , status){
              
              $('#edit-id').val(data.id);
              $('#edit-user-name').text(data.name);
              $('#edit-user-role').val(data.role);
              $('#edit-user-email').val(data.email);
              $('#edit-user-enabled').val(data.enabled);
           
                
            },
            error:function(data , status){
               
            }
        
    });
    });
    
    $('#edit-user-button').on('click', function(e){
        
          var userData = JSON.stringify( {
          
          
              id:$('#edit-id').val(),
              name:$('#edit-user-name').text(),
              name:$('#edit-user-password').text(),
              email:$('#edit-user-email').val(),
              role:$('#edit-user-role').val(),
              
              
        });
        
        
        $.ajax({
           
           
           url:contextRoot + "/adminPanel/",
            
           type: 'PUT',
           data: userData,
           dataType: 'json',
            
           beforeSend:function(xhr){
               xhr.setRequestHeader("Accept", "application/json");
               xhr.setRequestHeader("Content-Type", "application/json");
//                       alert('finished'); 
           },
           success: function(data, status){
               console.log("yes");
            $('#editUserModal').modal('hide');
           
            
//            var tableRow = buildUserRow(data);
            
//            $('#user-row-' + data.id).replaceWith($(tableRow));
            
            
    },
    error:function(data , status){
          alert('PLEASE ENTER ALL THE FIELDS');
    }
    
        });
});

    $(document).on('click' , '.delete-link' , function(e){
       
       e.preventDefault();
       
       var userId = $(e.target).data('user-id');
       
       $.ajax({
          type:'DELETE',
          url: contextRoot + '/user/' + userId,
          success: function(data , status){
                $('#user-row-' + userId).remove();
          },
          error: function(data , status){
              alert:('error');
          }
            
       });
        
    });
});

//});