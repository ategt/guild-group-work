<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Basic Static Page</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/starter-template.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutUs.css">

    </head>
    <body>

        <%@ include file="header.jsp" %>



        <div class="wrapper row2">
            <div id="container" class="clear">

                <div id="about-us" class="clear">

                    <section id="about-intro" class="clear">
                        <h2>About Us</h2>
                        <center>
                            <img padding-right="40px" height="30%" width="90%" src="http://thebusinesscriterion.com/wp-content/uploads/warehouse1.jpg" alt="">
                        </center>
                        <p style="margin-left: 5em; margin-right: 5em">"I HAVE ALWAYS HAD SUCH A PASSION FOR BIG OPEN WAREHOUSES AND WOMENS CLOTHING. 
                            SO I PUT MY HEAD TO GOOD USE AND TRIED TO FIGURE OUT HOW I COULD WORK WITH BOTH 
                            OF THE THINGS THAT I AM MOST PASSIONATE ABOUT AND CAME UP WITH 
                            <i>PATS WAREHOUSE FOR WOMENS CLOTHING</i>."
                            ~ Pat Toner</p>

                    </section>

                    <section id="team">
                        <h2>Our Team</h2>
                        <ul class="clear">
                            <li class="one_third first">
                                <figure><img  height="350" width="300" src="https://scontent-dfw1-1.xx.fbcdn.net/v/t1.0-9/12472838_10100949446508600_133852599205000801_n.jpg?oh=ab6287e05512b917b0aba4e021d06425&oe=57F99B65" alt="">
                                    <figcaption>
                                        <p class="team_name">Adam P.</p>
                                        <p class="team_title">Software Developer</p>
                                        <p class="team_description">Some information about Adam.</p>
                                    </figcaption>
                                </figure>
                            </li>
                            <li class="one_third">
                                <figure><img  height="350" width="300" src="https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAgxAAAAJGI1OTE1ZTZhLWRmOGYtNDE2NC04YjJlLTZhODBjMTQ5NDQwOQ.jpg" alt="">
                                    <figcaption>
                                        <p class="team_name">Adam T.</p>
                                        <p class="team_title">Software Developer</p>
                                        <p class="team_description">Some information about Adam.</p>
                                    </figcaption>
                                </figure>
                            </li>
                            <li class="one_third">
                                <figure><img  height="350" width="300" src="https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAhJAAAAJDdkZDY0MmQ1LWU2OWQtNDlkNy05YzI0LWUxY2MxZTAyMzQxMA.jpg" alt="">
                                    <figcaption>
                                        <p class="team_name">Chris Stalder</p>
                                        <p class="team_title">Software Developer</p>
                                        <p class="team_description">Some information about Chris.</p>
                                    </figcaption>
                                </figure>
                            </li>
                            <li class="one_third first">
                                <figure><img  height="350" width="300" src="https://scontent-dfw1-1.xx.fbcdn.net/v/t1.0-9/1504643_10204712693792444_2468581135842955791_n.jpg?oh=a0adebe60f7eafd75c3c127621375b2c&oe=57F7CFC3" alt="">
                                    <figcaption>
                                        <p class="team_name">Chris Stevens</p>
                                        <p class="team_title">Seoftware Developer</p>
                                        <p class="team_description">Some information about Chris.</p>
                                    </figcaption>
                                </figure>
                            </li>
                            <li class="one_third">
                                <figure><img  height="350" width="300" src="https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/3/000/112/308/1aa1c14.jpg" alt="">
                                    <figcaption>
                                        <p class="team_name">Pat T.</p>
                                        <p class="team_title">Owner</p>
                                        <p class="team_description">Some information about Pat.</p>
                                    </figcaption>
                                </figure>
                            </li>
                        </ul>
                    </section>
                </div>
            </div>
        </div>





        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


    </body>

    <iframe align="right" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3007.865433261245!2d-81.52914304875968!3d41.0719340233519!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8830d63d2a6f15c5%3A0xfdfbb2c1164b5213!2sThe+Software+Guild!5e0!3m2!1sen!2sus!4v1466988468525" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</html>

