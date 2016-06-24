<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <!--Form validation -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hello Controller Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

    </head>
    <body>
        <div class="container">
            <h1>Capstone</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/blog/">New Blog Post</a></li>
                    <li role="presentation"><a href="${pageContext.request.contextPath}/adminPanel/">Admin Panel</a></li>
                    <c:forEach items="${staticPages}" var="staticPage">
                    <li role="presentation">${staticPage.title}</li>
                    </c:forEach>
                </ul>    
            </div>

            <div class="row-fluid top30 pagetitle">

                <div class="container">

                    <div class="row">

                        <div class="col-md-12"><h1>Pats Warehouse and Stuff</h1></div>


                    </div>

                </div>



            </div>
            <div class="container">





                <div class="row">
                    <div class="col-md-3">


                        <!--<h4 class="">Search</h4>-->

                        <!--                        <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </div>
                                                </div>-->
                        <button type="button" class="btn btn-default btn-sm btn-block hidden-lg hidden-md" data-toggle="collapse" data-target="#demo">Refine your search <span class="caret"></span>

                        </button>

                        <div id="demo" class="collapse in">
                            <hr>
                            <div class="list-group list-group">
                                <h4 class="">Categories</h4>
                                <c:forEach items="${categories}" var="cat">
                                    <a class="list-group-item"><span class = "badge"></span>${cat.name}</a>

                                </c:forEach>

                                <!--                                <a href="#" class="list-group-item"><span class="badge">14</span> Active item <span class="label label-primary">New</span></a>
                                                                <a href="#" class="list-group-item"><span class="badge">3</span> Second item</a>	
                                                                <a href="#" class="list-group-item"><span class="badge">25</span> Third item</a>
                                                                <a href="#" class="list-group-item"><span class="badge">14</span> Active item</a>	
                                                                <a href="#" class="list-group-item"><span class="badge">3</span> Second item</a>-->

                                <div id="categories" class="collapse">

                                    <!--                                    <a href="#" class="list-group-item"><span class="badge">14</span> Active item</a>
                                                                        <a href="#" class="list-group-item"><span class="badge">3</span> Second item</a>
                                                                        <a href="#" class="list-group-item"><span class="badge">25</span> Third item</a> 
                                                                        <a href="#" class="list-group-item"><span class="badge">14</span> Active item</a>
                                                                        <a href="#" class="list-group-item"><span class="badge">3</span> Second item</a>-->
                                </div>


                                <button class="btn btn-default btn-sm btn-block" data-toggle="collapse" data-target="#categories">More <span class="caret"></span></button>

                                <!--                                <hr class="">
                                                                <h4 class="">Viewing Options</h4>
                                                                <a href="#" class="list-group-item"><span class="badge">14</span> Upcoming Sessions</a>
                                
                                                                <a href="#" class="list-group-item"><span class="badge">3</span> OnDemand</a>
                                                                <hr class="">	
                                                                <a href="#" class="list-group-item">Archived Courses</a>
                                                                <a href="#" class="list-group-item">Courses In Development</a>-->
                            </div>
                        </div>



                        <div class="hidden-sm hidden-xs">

                            <hr>

                            <div class="well">

                                <h4>Premium Membership</h4>
                                <p>Gain unlimited access to our entire course library.</p>
                                <button class="btn btn-sm btn-warning">Learn more</button>

                                <hr>
                                <p class="text-center ">Already a member? <a href="#">Sign in.</a></p>
                            </div>


                            <hr>

                            <div class="well">

                                <h4>Course Catalog</h4>
                                <p><a href="#"><img src="http://f.tqn.com/y/freebies/1/L/D/S/alloy-catalog.jpg" class="img-responsive"></a></p>

                                <p>Everything you need to know about our warehouse, including mens and womens clothing, inventory, and specials.</p>

                                <!--<button class="btn btn-sm btn-block btn-warning">Download</button>-->
                            </div>

                            <hr>

                            <h4 class="text-center">President</h4>
                            <h4 class="text-center">CEO</h4>
                            <h4 class="text-center">Chairman</h4>
                            <h4 class="text-center">The Board Of Directors</h4>
                            <h4 class="text-center">Manager</h4>

                            <p><a href="#"><img class="center-block" height='200' width='200' src="http://3t7bol18ef963l8x6yzv7ja1.wpengine.netdna-cdn.com/wp-content/uploads/Patrick_400.jpg"></a></p>
                            <h4 class='text-center'>Patrick Toner</h4>


                        </div>

                    </div>
                    <div class="col-md-9">


                        <div class="well hidden-xs"> 

                            <div class="row">

                                <div class="col-xs-4">


                                    <select class="form-control">
                                        <option>Featured</option>
                                        <option>Recently Added</option>
                                        <option>Next Upcoming Session</option>
                                        <option>A-Z</option>
                                        <option>Z-A</option>
                                    </select>
                                </div>
                                <div class="col-xs-8">
                                    <div class="btn-group pull-right">
                                        <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-th"></span></button>
                                        <button type="button" class="btn btn-default active"><span class="glyphicon glyphicon-th-list"></span></button>
                                        <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-list"></span></button>

                                    </div>
                                </div>

                            </div>





                        </div>

                        <hr>


                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">How to Fight Fraud with Artificial Intelligence and Intelligent Analytics</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-lock"></span> Available Exclusively for Premium Members</p>
                                <p>Could artificial intelligence have been used to prevent the high-profile Target breach? The concept is not so far-fetched. Organizations such as Mastercard and RBS WorldPay have long relied on artificial intelligence to detect fraudulent transaction patterns and prevent card.</p>

                                <p class="text-muted">Presented by <a href="#">Ellen Richey</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">Big Payment Data: Leveraging Transactional Data to Ensure an Enterprise Approach to Risk Management</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-calendar"></span> July 23, 2014 @ 1:30 PM</p>
                                <p>60% of organizations were exposed to actual or attempted fraud loss last year. As fraud and risk increases year over year, the amount of data being collected increases as well.
                                </p><p class="text-muted">Presented by <a href="#">Mike Braatz</a>, <a href="#">Jonathan Eber</a></p>

                            </div>
                        </div>
                        <hr><div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">How to Fight Fraud with Artificial Intelligence and Intelligent Analytics</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-lock"></span> Available Exclusively for Premium Members</p>
                                <p>Could artificial intelligence have been used to prevent the high-profile Target breach? The concept is not so far-fetched. Organizations such as Mastercard and RBS WorldPay have long relied on artificial intelligence to detect fraudulent transaction patterns and prevent card.</p>

                                <p class="text-muted">Presented by <a href="#">Ellen Richey</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">Big Payment Data: Leveraging Transactional Data to Ensure an Enterprise Approach to Risk Management</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-calendar"></span> July 23, 2014 @ 1:30 PM</p>
                                <p>60% of organizations were exposed to actual or attempted fraud loss last year. As fraud and risk increases year over year, the amount of data being collected increases as well.
                                </p><p class="text-muted">Presented by <a href="#">Mike Braatz</a>, <a href="#">Jonathan Eber</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">How to Fight Fraud with Artificial Intelligence and Intelligent Analytics</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-lock"></span> Available Exclusively for Premium Members</p>
                                <p>Could artificial intelligence have been used to prevent the high-profile Target breach? The concept is not so far-fetched. Organizations such as Mastercard and RBS WorldPay have long relied on artificial intelligence to detect fraudulent transaction patterns and prevent card.</p>

                                <p class="text-muted">Presented by <a href="#">Ellen Richey</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">Big Payment Data: Leveraging Transactional Data to Ensure an Enterprise Approach to Risk Management</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-calendar"></span> July 23, 2014 @ 1:30 PM</p>
                                <p>60% of organizations were exposed to actual or attempted fraud loss last year. As fraud and risk increases year over year, the amount of data being collected increases as well.
                                </p><p class="text-muted">Presented by <a href="#">Mike Braatz</a>, <a href="#">Jonathan Eber</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">How to Fight Fraud with Artificial Intelligence and Intelligent Analytics</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-lock"></span> Available Exclusively for Premium Members</p>
                                <p>Could artificial intelligence have been used to prevent the high-profile Target breach? The concept is not so far-fetched. Organizations such as Mastercard and RBS WorldPay have long relied on artificial intelligence to detect fraudulent transaction patterns and prevent card.</p>

                                <p class="text-muted">Presented by <a href="#">Ellen Richey</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">Big Payment Data: Leveraging Transactional Data to Ensure an Enterprise Approach to Risk Management</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-calendar"></span> July 23, 2014 @ 1:30 PM</p>
                                <p>60% of organizations were exposed to actual or attempted fraud loss last year. As fraud and risk increases year over year, the amount of data being collected increases as well.
                                </p><p class="text-muted">Presented by <a href="#">Mike Braatz</a>, <a href="#">Jonathan Eber</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">How to Fight Fraud with Artificial Intelligence and Intelligent Analytics</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-lock"></span> Available Exclusively for Premium Members</p>
                                <p>Could artificial intelligence have been used to prevent the high-profile Target breach? The concept is not so far-fetched. Organizations such as Mastercard and RBS WorldPay have long relied on artificial intelligence to detect fraudulent transaction patterns and prevent card.</p>

                                <p class="text-muted">Presented by <a href="#">Ellen Richey</a></p>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4"><a href="#" class=""><img src="http://placehold.it/1280X720" class="img-responsive"></a>
                            </div>
                            <div class="col-sm-8">
                                <h3 class="title">Big Payment Data: Leveraging Transactional Data to Ensure an Enterprise Approach to Risk Management</h3>
                                <p class="text-muted"><span class="glyphicon glyphicon-calendar"></span> July 23, 2014 @ 1:30 PM</p>
                                <p>60% of organizations were exposed to actual or attempted fraud loss last year. As fraud and risk increases year over year, the amount of data being collected increases as well.
                                </p><p class="text-muted">Presented by <a href="#">Mike Braatz</a>, <a href="#">Jonathan Eber</a></p>

                            </div>
                        </div>
                        <hr>



                        <ul class="pagination pagination-lg pull-right">
                            <li><a href="#">«</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">»</a></li>
                        </ul>


                    </div>
                </div>
            </div>


        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>

