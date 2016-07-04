$(document).on('click', '.delete-link-user', function (e) {

    e.preventDefault();

    var userId = $(e.target).data('user-id');

    $.ajax({
        type: 'DELETE',
        url: contextRoot + "/user/" + userId,
        success: function (data, status) {
            $('#user-row-' + userId).remove();
        },
        error: function (data, status) {

        }
    });

});
