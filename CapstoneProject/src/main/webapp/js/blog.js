/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $('#create-submit').on('click', function (e) {

        e.preventDefault();

        var blogData = JSON.stringify({
            title: $('#title-input').val(),
            author: $('#author-input').val(),
            category: $('#category-input').val(),
            content: $('#content-input').val(),
            
        });

        $.ajax({
            url: contextRoot + "/blog/",
            type: "POST",
            data: blogData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-type", "application/json");
            },
            success: function (data, status) {

                console.log(data);

                alert('success');
            },
            error: function (data, status) {
                alert('error');
            }

        });

    });
    
    
//    $('#showContactModal').on('show.bs.modal', function(e) {
//        
//        var link =$(e.relatedTarget);
//        
//        var contactId = link.data('contact-id');
//        
//        $.ajax({
//            
//            url: contextRoot + "/contact/" + contactId,
//            type: 'GET',
//            dataType: 'json',
//            beforeSend: function(xhr){
//                xhr.setRequestHeader("Accept", "application/json");
//            },
//            success: function(data, status){
//                $('#contact-first-name').text(data.firstName);
//                $('#contact-last-name').text(data.lastName);
//                $('#contact-company').text(data.company);
//                $('#contact-email').text(data.email);
//                $('#contact-phone').text(data.phone);
//            },
//            error: function(data, status){
//                
//            }
//            
//        });
//        
//        
//        
//    });
//    
//    $('#editContactModal').on('show.bs.modal', function(e) {
//        
//        var link =$(e.relatedTarget);
//        
//        var contactId = link.data('contact-id');
//        
//        $.ajax({
//            
//            url: contextRoot + "/contact/" + contactId,
//            type: 'GET',
//            dataType: 'json',
//            beforeSend: function(xhr){
//                xhr.setRequestHeader("Accept", "application/json");
//            },
//            success: function(data, status){
//                $('#edit-contact-first-name').val(data.firstName);
//                $('#edit-contact-last-name').val(data.lastName);
//                $('#edit-contact-company').val(data.company);
//                $('#edit-contact-email').val(data.email);
//                $('#edit-contact-phone').val(data.phone);
//                $('#edit-id').val(data.id);
//            },
//            error: function(data, status){
//                
//            }
//            
//        });
//        
//        
//        
//    });
//
//
//    $('#edit-contact-button').on('click', function(e){
//        
//        var contactData = JSON.stringify({
//            firstName: $('#edit-contact-first-name').val(),
//            lastName: $('#edit-contact-last-name').val(),
//            company: $('#edit-contact-company').val(),
//            email: $('#edit-contact-email').val(),
//            phone: $('#edit-contact-phone').val(),
//            id: $('#edit-id').val()
////            lastContacted: $('#lastContacted-input').val()
//
//        });
//
//        $.ajax({
//            url: contextRoot + "/contact/",
//            type: "PUT",
//            data: contactData,
//            dataType: 'json',
//            beforeSend: function (xhr) {
//                xhr.setRequestHeader("Accept", "application/json");
//                xhr.setRequestHeader("Content-type", "application/json");
//            },
//            success: function (data, status) {
//                
//                $('#editContactModal').modal('hide');
//                
//                var tableRow = buildContactRow(data);
//                
//                $('#contact-row-'+ data.id).replaceWith($(tableRow));
//            },
//            error: function (data, status) {
//                alert("error");
//                console.log(data);
//            }
//
//        });
//
//    });
//
//
//    function buildContactRow(data) {
//
//        return "<tr id='contact-row-" + data.id + "'>  \n\
//                <td><a data-contact-id='" + data.id +"' data-toggle='modal' data-target='#showContactModal'>" + data.firstName + "</a></td>  \n\
//                <td> " + data.lastName + "</td>    \n\
//                <td> <a data-contact-id='" + data.id +"' data-toggle='modal' data-target='#editContactModal'>Edit</a>  </td>   \n\
//                <td> <a data-contact-id='" + data.id +"' class='delete-link'>Delete</a>  </td>   \n\
//                </tr>  ";
//
//    }

});


//$(document).on('click', '.delete-link', function(e){
//    
//    e.preventDefault();
//    
//    var contactId = $(e.target).data('contact-id');
//    
//    $.ajax({
//        
//        type: 'DELETE',
//        url: contextRoot + "/contact/" + contactId,
//        success: function(data,status){
//            $('#contact-row-'+ contactId).remove();
//        },
//        error: function(data,status){
//            
//        }
//    });
//    
//});