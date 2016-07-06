/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).on('click', '#delete-post', function (e) {

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
$(document).on('click', '#delete-user', function (e) {

    e.preventDefault();

    var userId = $(e.target).data('user-id');

    $.ajax({
        type: 'DELETE',
        url: contextRoot + "/createUser/" + userId,
        success: function (data, status) {
            $('#user-row-' + userId).remove();
        },
        error: function (data, status) {

        }
    });

});
$(document).on('click', '#delete-category', function (e) {

    e.preventDefault();

    var categoryId = $(e.target).data('category-id');

    $.ajax({
        type: 'DELETE',
        url: contextRoot + "/category/" + categoryId,
        success: function (data, status) {
            $('#category-row-' + categoryId).remove();
        },
        error: function (data, status) {

        }
    });

});

$(document).on('click', '.delete-static', function (e) {

    e.preventDefault();

    var staticId = $(e.target).data('static-page-id');

    $.ajax({
        type: 'DELETE',
        url: contextRoot + "/static/" + staticId,
        success: function (data, status) {
            $('#static-page-row-' + staticId).remove();
        },
        error: function (data, status) {

        }
    });

});

