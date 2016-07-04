/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
        
    $(document).on('click' , '.delete-link-user' , function(e){
       
       e.preventDefault();
       
       var userId = $(e.target).data('user-id');
       
       $.ajax({
          type:'DELETE',
          url: contextRoot + '/adminPanel/user/' + userId,
          success: function(data , status){
                $('#user-row-' + userId).remove();
          },
          error: function(data , status){
              alert:('error');
          }
            
       });
        
    });
    
});