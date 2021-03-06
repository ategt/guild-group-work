/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {

    $('#editUserModal').on('show.bs.modal', function (e) {
        var link = $(e.relatedTarget);

        var user = link.data('user-id');
        $('#edit-user-validation-errors').empty();
        $.ajax({
            url: contextRoot + '/createUser/editUser/' + user,
            type: 'GET',
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
            },
            success: function (data, status) {
                $('#edit-user-name').val(data.name);
                $('#edit-user-email').val(data.email);
                $('#edit-user-password').val(data.password);
                $('#edit-user-role').val(data.role);
                $('#edit-user-date-joined').val(data.joinedOn);
                $('#edit-user-enabled').val(data.enabled);
                $('#edit-id').val(data.id);
            },
            error: function (data, status) {

            }

        });

    });

    $('#edit-user-button').on('click', function (e) {
        $('#edit-user-validation-errors').empty();
        var userData = JSON.stringify({
            name: $('#edit-user-name').val(),
            email: $('#edit-user-email').val(),
            password: $('#edit-user-password').val(),
            role: $('#edit-user-role').val(),
            joinedOn: $('#edit-user-date-joined').val(),
            enabled: $('#edit-user-enabled').val(),
            id: $('#edit-id').val()
        });

        $.ajax({
            url: contextRoot + '/createUser/editUser/',
            type: 'PUT',
            data: userData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", 'application/json');
                xhr.setRequestHeader("Content-type", 'application/json');
            },
            success: function (data, status) {
                $('#editUserModal').modal('hide');

                var tableRow = buildUserRow(data);

                $('#user-row-' + data.id).replaceWith($(tableRow));
                console.log(data);
            },
            error: function (data, status) {
                console.log(data);
//                var errors = data.responseJSON.errors;
//
//                $.each(errors, function (index, error) {
//
//                    $('#edit-user-validation-errors').append(error.message + "<br />");
//
//                });
            }
        });

    });

    function buildUserRow(data) {

        return "<tr id='user-row-" + data.id + "'>  \n\
                <td>" + data.id + "</td> \n\
                <td>" + data.name + "</td> \n\
                <td>" + data.role + "</td> \n\
                <td> <a data-user-id='" + data.id + "' data-toggle='modal' data-target='#editUserModal'>Edit</a>  </td>   \n\
                <td> <a data-user-id='" + data.id + "' class='delete-link' id='delete-user'>Delete</a>  </td>   \n\
                </tr>  ";

    }

});