/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
    alert('js file loaded!');
    
    $(document).on('click' , '.delete-link-user' , function(e){
       
       e.preventDefault();
       alert('got here!');
       
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