/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*My attempt at using ajax to paginate. DOES NOT WORK, keeping it in case we want to continue down this path*/
$(document).ready(function () {

    $('.page').on('click', function (e) {
        
        $('#post-div').empty();

        var page = this.text;

        $.ajax({
            url: contextRoot + "/home",
            type: "GET",
            data: page,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-type", "application/json");
            },
            success: function (data, status) {

                console.log(data);

                var post = buildPost(data);
                $('#post-div').append($(post));

            },
            error: function (data, status) {
                console.log(data);
                alert('error');
            }

        });

    });

    function buildPost(data) {
        document.write("<div class=\"row\">");
        document.write("<div class=\"col-sm-4\"><a href=\"#\" class=\"\"><img src=\"http:\/\/placehold.it\/1280X720\" class=\"img-responsive\"><\/a>");
        document.write("<\/div>");
        document.write("<div class=\"col-sm-8\">");
        document.write("<h3 class=\"title\"><a href=\"blog\/${" + data.id + "}\">${" + data.title + "}<\/a><\/h3>");
        document.write("<h4 class=\"text-muted\"><span class=\"glyphicon glyphicon-lock\"><\/span>${" + data.category.name + "}<\/h4>");
        document.write("<h5>${" + data.content + "}<\/h5>");
        document.write("");
        document.write("<p class=\"text-muted\">Created by <a href=\"#\">${" + data.author.name + "}<\/a><\/p>");
        document.write("<h5 class=\"text-muted\">Posted on : ${" + data.postedOn + "}<\/h5>");
        document.write("<\/div>");
        document.write("<\/div>");
    }

    function parseURLParams(url) {
        var queryStart = url.indexOf("?") + 1,
                queryEnd = url.indexOf("#") + 1 || url.length + 1,
                query = url.slice(queryStart, queryEnd - 1),
                pairs = query.replace(/\+/g, " ").split("&"),
                parms = {}, i, n, v, nv;

        if (query === url || query === "") {
            return;
        }

        for (i = 0; i < pairs.length; i++) {
            nv = pairs[i].split("=");
            n = decodeURIComponent(nv[0]);
            v = decodeURIComponent(nv[1]);

            if (!parms.hasOwnProperty(n)) {
                parms[n] = [];
            }

            parms[n].push(nv.length === 2 ? v : null);
        }
        return parms;
    }
});

