<%--
  Created by IntelliJ IDEA.
  User: moringaschool
  Date: 1/4/20
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Error</title>
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
<br><br><br>
<br><br><br>
<div class="jumbotron" style="text-align: center; margin-left: 20%; margin-right: 20%">
    <h2>Blog Not Update</h2>
    <!-- Card -->
    <div class="card promoting-card">

        <!-- Card content -->
        <div class="card-body d-flex flex-row">

            <!-- Avatar -->
            <img src="https://colorlib.com/wp/wp-content/uploads/sites/2/404-error-page-templates.jpg" class="rounded-circle mr-3" height="50px" width="50px" alt="avatar">

            <!-- Content -->
            <div>

                <!-- Title -->
                <h4 class="card-title font-weight-bold mb-2">Error page, unable to load the request</h4>
                <!-- Subtitle -->
                <p class="card-text"><i class="far fa-clock pr-2"></i></p>

            </div>

        </div>

        <!-- Card image -->
        <div class="view overlay">
            <img class="card-img-top rounded-0" src="https://colorlib.com/wp/wp-content/uploads/sites/2/404-error-page-templates.jpg" alt="Card image cap">
            <a href="#!">
                <div class="mask rgba-white-slight"></div>
            </a>
        </div>

        <!-- Card content -->
        <div class="card-body">

            <div class="collapse-content">

                <!-- Text -->
                <p class="card-text collapse" id="collapseContent">Updating the post was unsuccessful.</p>
                <!-- Button -->
                <a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed"data-toggle="collapse" href="#collapseContent" aria-expanded="false" aria-controls="collapseContent">Read More</a>
                <a href="books" class="btn btn-info p-1 my-1 mr-0 mml-1 float-right">Back</a>
                <%--<i class="fas fa-share-alt text-muted float-right p-1 my-1" data-toggle="tooltip" data-placement="top" title="Share this post"></i>--%>
                <%--<i class="fas fa-heart text-muted float-right p-1 my-1 mr-3" data-toggle="tooltip" data-placement="top" title="I like it"></i>--%>

            </div>

        </div>

    </div>
    <!-- Card -->

</div>
</body>
</html>
