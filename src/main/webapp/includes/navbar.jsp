<%--
  Created by IntelliJ IDEA.
  User: moringaschool
  Date: 10/3/19
  Time: 12:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Body</title>
    <!-- Font Awesome -->
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



    <!-- Bootstrap CSS -->

    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">--%>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>




    <!--fontawesome-->

    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>


</head>

<body>

<!-- navbar -->

<nav class="navbar navbar-expand-md navbar-light fixed-top">

    <%--<a class="navbar-brand"><img src="https://systechafrica.com/wp-content/uploads/2017/12/logo-1.png"  class="img-responsive"></a>--%>

    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#nav">

        <span class="navbar-toggler-icon"></span>

    </button>

    <div class="collapse navbar-collapse justify-content-between" id="nav">

        <ul class="navbar-nav">

            <li class="nav-item" >

                <a class="nav-link" href="index.jsp">HOME</a>

            </li>



        </ul>


        <!-- Search bar -->

        <ul class="navbar-nav ml-3">

            <li class="nav-item">

                <a class="nav-link " href="allPosts">POSTS</a>

            </li>

            <li class="nav-item">

                <a class="nav-link " href="logout"><i class="fa.fa-power-off" style="color: red">LOGOUT</i></a>

            </li>


        </ul>

    </div>

</nav>

</body>
</html>
