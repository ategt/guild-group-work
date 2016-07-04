$(document).on('click', '.delete-link-user', function (e) {

    $(document).ready(function () {

        $(document).on('click', '.delete-link-user', function (e) {

            e.preventDefault();

            var userId = $(e.target).data('user-id');

            $.ajax({
                type: 'DELETE',
                url: contextRoot + '/adminPanel/user/' + userId,
                success: function (data, status) {
                    $('#user-row-' + userId).remove();
                },
                error: function (data, status) {
                    alert:('error');
                }

            });


        });

    });

});
