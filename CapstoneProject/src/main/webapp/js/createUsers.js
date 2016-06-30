/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global contextRoot */

$(document).ready(function () {


    $('#create-account').on('click', function (e) {

        e.preventDefault();

        $('#add-contact-validation-errors').empty();
        var categoryData = JSON.stringify({
            name: $('#create-username').val(),
            password: $('#create-password').val(),
            email: $('#create-email').val()

        });


        $.ajax({
            url: contextRoot + "/createUser/",
            type: 'POST',
            data: categoryData,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");

            },
            success: function (data, status) {

                console.log(data);
//
//
//                var tableRow = buildCategoryRow(data);
////              console.log(tableRow);
//
//                $('#category-table').append($(tableRow));


                $('#create-username').text(""),
                        $('#create-password').text(""),
                        $('#create-email').text("");


            },
            error: function (data, status) {

                var errors = data.responseJSON.errors;

                console.log(errors);

                $.each(errors, function (index, error) {

                    $('#add-contact-validation-errors').append(error.fieldName + ": " + error.message + "<br/>");

                });

            }

        });

    });

});