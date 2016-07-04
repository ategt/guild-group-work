/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
   
    
    $('#create-submit').on('click', function(e) {
        
        e.preventDefault();
        
        $('#add-contact-validation-errors').empty();
        var categoryData = JSON.stringify( {
          
            name:$('#name-input').val()
         
        });
        
        
        $.ajax({
           
           
           url:contextRoot + "/category/",
           type: 'POST',
           data: categoryData,
           dataType: 'json',
           beforeSend:function(xhr){
               xhr.setRequestHeader("Accept", "application/json");
               xhr.setRequestHeader("Content-Type", "application/json");
                       
           },
           
           success: function(data, status){
              
              console.log(data);
              
              
              var tableRow = buildCategoryRow(data);
//              console.log(tableRow);
              
              $('#category-table').append($(tableRow));
              
              
            $('#name-input').val('');
   
              
           },
           error: function(data, status){
               
               var errors = data.responseJSON.errors;
               
               console.log(errors);
               
               $.each(errors , function(index , error){
                  
                  $('#add-contact-validation-errors').append(error.fieldName + ": " + error.message + "<br/>");
                   
               });
               
           }
                   
        });
        
       
        
        
    });   
    
    
    function buildCategoryRow(data){
        var strVar="";
        return "<tr id='category-row-" + data.id + "'>  \n\
                <td><a data-category-id='" + data.id +"' data-toggle='modal' data-target='#showCategoryModal'>" + data.name + "</a></td>  \n\
                <td> <a data-category-id='" + data.id +"' class='delete-link'>Delete</a>  </td>   \n\
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
    
    $('#editCategoryModal').on('show.bs.modal' , function(e){
       
        var link = $(e.relatedTarget);
        
        var categoryId = link.data('category-id');
        
        console.log(categoryId);
        
         $.ajax({
           
            url:contextRoot + "/category/" + categoryId,
            type: 'GET' ,
            dataType: 'json',
            beforeSend: function(xhr){
              
              xhr.setRequestHeader("Accept", "application/json");
                
            },
            success: function(data , status){
              
              $('#edit-id').val(data.id);
              $('#edit-category-name').val(data.name);
           
                
            },
            error:function(data , status){
               
            }
        
    });
    });
    
    $('#edit-category-button').on('click', function(e){
        
          var categoryData = JSON.stringify( {
          
          
            id:$('#edit-id').val(),
            name:$('#edit-category-name').val()

        });
        
        
        $.ajax({
           
           
           url:contextRoot + "/category/",
            
           type: 'PUT',
           data: categoryData,
           dataType: 'json',
            
           beforeSend:function(xhr){
               xhr.setRequestHeader("Accept", "application/json");
               xhr.setRequestHeader("Content-Type", "application/json");
//                       alert('finished'); 
           },
           success: function(data, status){
               console.log("yes");
            $('#editCategoryModal').modal('hide');
           
            
            var tableRow = buildCategoryRow(data);
            
            $('#category-row-' + data.id).replaceWith($(tableRow));
            
            
    },
    error:function(data , status){
          alert('PLEASE ENTER ALL THE FIELDS');
    }
    
        });
});

    $(document).on('click' , '.delete-link' , function(e){
       
       e.preventDefault();
       
       var categoryId = $(e.target).data('category-id');
       
       $.ajax({
          type:'DELETE',
          url: contextRoot + '/category/' + categoryId,
          success: function(data , status){
                $('#category-row-' + categoryId).remove();
          },
          error: function(data , status){
              alert:('error');
          }
            
       });
        
    });


});
