<html>
<% //In case, if Admin session is not set, redirect to Login page
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store, must-revalidate" );
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    if((request.getSession(false).getAttribute("userName")== null) )
    {
%>
<jsp:forward page="/views/user/Login.jsp"></jsp:forward>
<%} %>

<%--
  Created by IntelliJ IDEA.
  User: moringaschool
  Date: 11/18/19
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Home</title>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"></script>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>

</head>
<body>
<!--Main Navigation-->
<header>

    <!--Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar">

        <div class="container">

            <!-- Navbar brand -->
            <a class="navbar-brand" href="#">Home</a>

            <!-- Collapse button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Collapsible content -->
            <div class="collapse navbar-collapse" id="basicExampleNav">

                <!-- Links -->
                <ul class="navbar-nav mr-auto smooth-scroll">
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                </ul>
                <!-- Links -->

                <!-- Social Icon  -->
                <ul class="navbar-nav nav-flex-icons">
                    <li class="nav-item">
                        <a class="nav-link"><i class="fab fa-facebook"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fab fa-twitter"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"><i class="fab fa-instagram"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- Collapsible content -->

        </div>

    </nav>
    <!--/.Navbar-->

    <!--Mask-->
    <div id="intro" class="view">

        <div class="mask rgba-black-strong">

            <div class="container-fluid d-flex align-items-center justify-content-center h-100">

                <div class="row d-flex justify-content-center text-center">

                    <div class="col-md-10">

                        <!-- Heading -->
                        <h2 class="display-4 font-weight-bold white-text pt-5 mb-2">BLOG</h2>

                        <!-- Divider -->
                        <hr class="hr-light">

                        <!-- Description -->
                        <h4 class="white-text my-4">I have done it for you you feel the work.</h4>
                        <a href="allPosts"><button type="button" class="btn btn-outline-white">View Blogs<i class="fa fa-book ml-2"></i></button></a>

                    </div>

                </div>

            </div>

        </div>

    </div>
    <!--/.Mask-->

</header>


        <hr class="my-5">

        <!--Section: Contact-->
        <section id="contact">

            <!-- Heading -->
            <h2 class="mb-5 font-weight-bold text-center">Contact Me</h2>


                <div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <h4 class="modal-title w-100 font-weight-bold">Write to us</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <form action="contact" method="post">
                            <div class="modal-body mx-3">
                                <div class="md-form mb-5">
                                    <i class="fas fa-user prefix grey-text"></i>
                                    <input type="text" id="form34" class="form-control validate" required name="name">
                                    <label data-error="wrong" data-success="right" for="form34">Your name</label>
                                </div>

                                <div class="md-form mb-5">
                                    <i class="fas fa-envelope prefix grey-text"></i>
                                    <input type="email" id="form29" class="form-control validate" required name="email">
                                    <label data-error="wrong" data-success="right" for="form29">Your email</label>
                                </div>

                                <div class="md-form mb-5">
                                    <i class="fas fa-tag prefix grey-text"></i>
                                    <input type="text" id="form32" class="form-control validate" required name="subject">
                                    <label data-error="wrong" data-success="right" for="form32">Subject</label>
                                </div>

                                <div class="md-form">
                                    <i class="fas fa-pencil prefix grey-text"></i>
                                    <textarea type="text" id="form8" class="md-textarea form-control" rows="4" required name="msg"></textarea>
                                    <label data-error="wrong" data-success="right" for="form8">Your message</label>
                                </div>

                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <button class="btn btn-unique">Send <i class="fas fa-paper-plane-o ml-1"></i></button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalContactForm">Send Message</a>
                </div>

<footer class="page-footer font-small unique-color-dark">

    <!-- Social buttons -->
    <div class="primary-color">
        <div class="container">
            <!--Grid row-->
            <div class="row py-4 d-flex align-items-center">

                <!--Grid column-->
                <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                    <h6 class="mb-0 white-text">Get connected with me on social networks!</h6>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 col-lg-7 text-center text-md-right">
                    <!--Facebook-->
                    <a class="fb-ic ml-0">
                        <i class="fab fa-facebook white-text mr-4"> </i>
                    </a>
                    <!--Twitter-->
                    <a class="tw-ic">
                        <i class="fab fa-twitter white-text mr-4"> </i>
                    </a>
                    <!--Google +-->
                    <a class="gplus-ic">
                        <i class="fab fa-google-plus white-text mr-4"> </i>
                    </a>
                    <!--Linkedin-->
                    <a class="li-ic">
                        <i class="fab fa-linkedin white-text mr-4"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic">
                        <i class="fab fa-instagram white-text mr-lg-4"> </i>
                    </a>
                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->
        </div>
    </div>
    <!-- Social buttons -->

    <!--Footer Links-->
    <div class="container mt-5 mb-4 text-center text-md-left">
        <div class="row mt-3">

            <!--First column-->
            <div class="col-md-3 col-lg-4 col-xl-3 mb-4">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Company name</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>Here you can use rows and columns here to organize your footer content. Lorem ipsum dolor sit
                    amet, consectetur adipisicing elit.</p>
            </div>
            <!--/.First column-->

            <!--Second column-->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Proud To be </strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a href="#!">Systech Ltd</a>
                </p>
                <p>
                    <a href="#!">Francis Sakwa</a>
                </p>
                <p>
                    <a href="#!">BrandFlow</a>
                </p>
                <p>
                    <a href="#!">Bootstrap Angular</a>
                </p>
            </div>
            <!--/.Second column-->

            <!--Third column-->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Useful links</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <a href="#!">Your Account</a>
                </p>
                <p>
                    <a href="#!">Become an Affiliate</a>
                </p>
                <p>
                    <a href="#!">Shipping Rates</a>
                </p>
                <p>
                    <a href="#!">Help</a>
                </p>
            </div>
            <!--/.Third column-->

            <!--Fourth column-->
            <div class="col-md-4 col-lg-3 col-xl-3">
                <h6 class="text-uppercase font-weight-bold">
                    <strong>Contact</strong>
                </h6>
                <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                <p>
                    <i class="fas fa-home"></i></i> New York, NY 10012, US</p>
                <p>
                    <i class="fa fa-envelope mr-3"></i> info@example.com</p>
                <p>
                    <i class="fa fa-phone mr-3"></i> + 01 234 567 88</p>
                <p>
                    <i class="fa fa-print mr-3"></i> + 01 234 567 89</p>
            </div>
            <!--/.Fourth column-->

        </div>
    </div>
    <!--/.Footer Links-->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2019 Copyright:
        <a href="https:///">Francis Sakwa</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
<style>
    html,
    body,
    header,
    #intro {
        height: 100%;
    }

    html {
        scroll-behavior: smooth;
    }
    #intro {
        background: url("https://images.pexels.com/photos/1764429/pexels-photo-1764429.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }

    .top-nav-collapse {
        background-color: #24355C;
    }
    @media (max-width: 768px) {
        .navbar:not(.top-nav-collapse) {
            background-color: #24355C;
        }
    }
    @media (min-width: 800px) and (max-width: 850px) {
        .navbar:not(.top-nav-collapse) {
            background-color: #24355C;
        }
    }
</style>

<script>
    // Regular map
    function regular_map() {
        var var_location = new google.maps.LatLng(40.725118, -73.997699);

        var var_mapoptions = {
            center: var_location,
            zoom: 14
        };

        var var_map = new google.maps.Map(document.getElementById("map-container"),
            var_mapoptions);

        var var_marker = new google.maps.Marker({
            position: var_location,
            map: var_map,
            title: "New York"
        });
    }

    // Initialize maps
    google.maps.event.addDomListener(window, 'load', regular_map);

    // Carousel options

    $('.carousel').carousel({
        interval: 3000,
    })
</script>

</body>
</html>
