<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>

        <style>

            #dragandrophandler
            {
                border:2px dotted black;
                width:400px;
                height:400px;
                /*color:#92AAB0;*/
                /*text-align:left;vertical-align:middle;*/
                padding:10px 10px 10px 10px;
                margin-bottom:10px;
                /*font-size:200%;*/
            }

            .image-drop
            {
                border:2px dotted black;
                width:400px;
                height:400px;
                /*color:#92AAB0;*/
                /*text-align:left;vertical-align:middle;*/
                padding:10px 10px 10px 10px;
                margin-bottom:10px;
                /*font-size:200%;*/
            }

        </style>

    </head>

    <body> 

        <h2>Spring MVC - Uploading a file.. </h2>
        <form:form method="POST" commandName="file" enctype="multipart/form-data">

            Upload your file please: 
            <input type="file" name="file" />
            <input type="submit" value="upload" />
            <form:errors path="file" cssStyle="color: #ff0000;" />

        </form:form>

        <div id="dragandrophandler">
        </div>
        <br><br>
        <div id="status1"></div>

        <div data-image-holder="1" class="image-drop image-drop-1" >

            <div data-image-holder="1" class="image-holder-1" ></div>

            <br><br>
            <div data-image-holder="1" class="image-status image-status-1" ></div>
        </div>

        <div data-image-holder="2" class="image-drop image-drop-2" >

            <div data-image-holder="2" class="image-holder-2" ></div>

            <br><br>
            <div data-image-holder="2" class="image-status image-status-2" ></div>
        </div>

        <div data-image-holder="3" class="image-drop image-drop-3" >

            <div data-image-holder="3" class="image-holder-3" ></div>

            <br><br>
            <div data-image-holder="3" class="image-status image-status-3" ></div>
        </div>

        <div data-image-holder="4" class="image-drop image-drop-4" >

            <div data-image-holder="4" class="image-holder-4" ></div>

            <br><br>
            <div data-image-holder="4" class="image-status image-status-4" ></div>
        </div>


        <script>
            var contextRoot = "${pageContext.request.contextPath}";
        </script>

        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/enhanceddropfile.js"></script>

    </body>
</html>