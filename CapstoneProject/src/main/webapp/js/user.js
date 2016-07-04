$(document).ready(function () {

    alert(' user.js loaded!!');

    $('#editUserModal').on('show.bs.modal', function (e) {

        var link = $(e.relatedTarget);

        var userId = link.data('user-id');

        console.log(userId);

        $.ajax({
            url: contextRoot + "/adminPanel/edit",
            type: 'GET',
            dataType: 'json',
            beforeSend: function (xhr) {

                xhr.setRequestHeader("Accept", "application/json");

            },
            success: function (data, status) {

                $('#edit-id').val(data.id);
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

    $('#edit-user-button').on('click', function (e) {



        var userData = JSON.stringify({
            id: $('#edit-id').val(),
            name: $('#edit-user-name').val(),
            state: $('#edit-user-password').val(),
            type: $('#edit-user-email').val(),
            area: $('#edit-user-role').val()
        });


        $.ajax({
            url: contextRoot + "/adminPanel/",
            type: 'PUT',
            data: userData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");

            },
            success: function (data, status) {

                $('#editUserModal').modal('hide');

//            var tableRow = buildUserRow(data);
//            
//            $('#user-row-' + data.id).replaceWith($(tableRow));

            },
            error: function (data, status) {
                alert('PLEASE ENTER ALL THE FIELDS');
            }

        });
    });
});

//});