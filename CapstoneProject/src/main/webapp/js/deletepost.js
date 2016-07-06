/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).on('click', '.delete-link-post', function (e) {

    e.preventDefault();

    var postId = $(e.target).data('post-id');

    $.ajax({
        type: 'DELETE',
        url: contextRoot + "/blog/" + postId,
        success: function (data, status) {
            $('#post-row-' + postId).remove();
        },
        error: function (data, status) {

        }
    });

});

