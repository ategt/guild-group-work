/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

//    $('#editOrderModal').on('show.bs.modal', function (e) {
//
//        var link = $(e.relatedTarget);
//
//        var orderId = link.data('order-id');
//
//        $.ajax({
//            url: contextRoot + "/order/" + orderId,
//            type: 'GET',
//            dataType: 'json',
//            beforeSend: function (xhr) {
//                xhr.setRequestHeader("Accept", "application/json");
//            },
//            success: function (data, status) {
//                $('#edit-order-date').val(data.date);
//                console.log(data.date);
//                $('#edit-order-customer-name').val(data.customer.name);
//                $('#edit-order-customer-name option[value='+ data.customer.id+']');
//                console.log(data.customer.name);
//                $('#edit-order-state').val(data.tax.state);
//                console.log(data.tax.state);
//                $('#edit-order-product').val(data.product.type);
//                console.log(data.product.type);
//                $('#edit-order-area').val(data.area);
//                console.log(data.area);
//                $('#edit-id').val(data.globalId);
//                console.log(data.globalId);
//
//            },
//            error: function (data, status) {
//            }
//        });
//    });
//
//    $('#edit-order-button').on('click', function (e) {
//
//        var orderData = JSON.stringify({
//            date: $('#edit-order-date').val(),
//            customerId: $('#edit-order-customer-name').val(),
//            taxId: $('#edit-order-state').val(),
//            productId: $('#edit-order-product').val(),
//            area: $('#edit-order-area').val(),
//            id: $('#edit-id').val()
//
//        });
//
//        $.ajax({
//            url: contextRoot + "/order/",
//            type: "PUT",
//            data: orderData,
//            dataType: 'json',
//            beforeSend: function (xhr) {
//                xhr.setRequestHeader("Accept", "application/json");
//                xhr.setRequestHeader("Content-type", "application/json");
//            },
//            success: function (data, status) {
//
//                $('#editOrderModal').modal('hide');
//
//                var tableRow = buildOrderRow(data);
//
//                $('#order-row-' + data.globalId).replaceWith($(tableRow));
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
//
//
//    function buildOrderRow(data) {
//
//        return "<tr id='order-row-" + data.globalId + "'>  \n\
//                <td> " + data.date + "</a></td>  \n\
//                <td> <a data-order-id='" + data.globalId + "' data-toggle='modal' data-target='#showOrderModal'>" + data.customer.name + "</td><td> " + data.tax.state + "</td><td> " + data.product.type + "</td><td> " + data.area + "</td>    \n\
//                <td> " + data.totalTax + "</td><td> " + data.total + "</td>    \n\
//                <td> <a data-order-id='" + data.globalId + "' data-toggle='modal' data-target='#editOrderModal'>Edit</a>  </td>   \n\
//                <td> <a data-order-id='" + data.globalId + "' class='delete-link'>Delete</a>  </td>   \n\
//                </tr>  ";
//
//    }

    
});


$(document).on('click', '.delete-link', function (e) {
//
//    e.preventDefault();
//
//    var orderId = $(e.target).data('order-id');
//
//    $.ajax({
//        type: 'DELETE',
//        url: contextRoot + "/order/" + orderId,
//        success: function (data, status) {
//            $('#order-row-' + orderId).remove();
//        },
//        error: function (data, status) {
//
//        }
//    });

});