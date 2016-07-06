/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {

    $('#category-create-submit').on('click', function (e) {
        $('#add-category-validation-errors').empty();
        e.preventDefault();

//        alert('works');


        var categoryData = JSON.stringify({
            name: $('#category-input').val()
        });

        $.ajax({
            url: contextRoot + '/category/',
            type: 'POST',
            data: categoryData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-type", "application/json");
            },
            success: function (data, status) {

                console.log(data);

                var tableRow = buildCategoryRow(data);
                $('#category-table').append($(tableRow));

                name: $('#category-input').val('');

            },
            error: function (data, status) {
                var errors = data.responseJSON.errors;

                $.each(errors, function (index, error) {

                    $('#add-category-validation-errors').append(error.message + "<br />");

                });
            }
        });

    });

   
    $('#editCategoryModal').on('show.bs.modal', function (e) {
        var link = $(e.relatedTarget);

        var category = link.data('category-id');
        $('#edit-category-validation-errors').empty();
        $.ajax({
            url: contextRoot + '/category/' + category,
            type: 'GET',
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
            },
            success: function (data, status) {
                $('#edit-category').val(data.name);
                $('#edit-id').val(data.id);
            },
            error: function (data, status) {

            }

        });

    });

    $('#edit-category-button').on('click', function (e) {
        $('#edit-category-validation-errors').empty();
        var categoryData = JSON.stringify({
            name: $('#edit-category').val(),
            id: $('#edit-id').val()
        });

        $.ajax({
            url: contextRoot + '/category/',
            type: 'PUT',
            data: categoryData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", 'application/json');
                xhr.setRequestHeader("Content-type", 'application/json');
            },
            success: function (data, status) {
                $('#editCategoryModal').modal('hide');

                var tableRow = buildCategoryRow(data);

                $('#category-row-' + data.id).replaceWith($(tableRow));
                console.log(data);
            },
            error: function (data, status) {
                var errors = data.responseJSON.errors;

                $.each(errors, function (index, error) {

                    $('#edit-category-validation-errors').append(error.message + "<br />");

                });
            }
        });

    });

    function buildCategoryRow(data) {

        return "<tr id='category-row-" + data.id + "'>  \n\
                <td>" + data.id + "</td> \n\
                <td>" + data.name + "</td> \n\
                <td> <a data-category-id='" + data.id + "' data-toggle='modal' data-target='#editCategoryModal'>Edit</a>  </td>   \n\
                <td> <a data-category-id='" + data.id + "' class='delete-link' id='delete-category'>Delete</a>  </td>   \n\
                </tr>  ";

    }

});