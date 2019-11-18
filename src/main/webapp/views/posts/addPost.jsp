<%--
  Created by IntelliJ IDEA.
  User: moringaschool
  Date: 10/26/19
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
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
</head>
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

<body>
<br><br><br>

<form action="addPost" method="post">
    <div id="login">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center">Add New Post Page
                            </h3>
                            <p><span style="color:red"><%=(request.getAttribute("dMsg") == null) ? "" : request.getAttribute("dMsg")%></span></p>
                            <div class="form-group">
                                <label for="postTitle">Post Title</label><br>
                                <input type="text" required name="postTitle" id="postTitle" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="content">Content</label><br>
                                <input type="text" required name="content" id="content" class="form-control">
                            </div>
                            <div class="form-group">
                                <select required name="category" id="" class="btn">
                                    <option>Choose Category</option>
                                    <option>SPORTS</option>
                                    <option>EDUCATION</option>
                                    <option>TECHNOLOGY</option>
                                    <option>HEALTH</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-success btn-md" value="Add Post">
                                <input type="reset" name="reset" class="btn btn-danger btn-md" value="Cancel">
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</form>

<style>
    body {
        /*margin: 0;*/
        /*padding: 0;*/
        /*height: 70vh;*/
    }

    #login .container #login-row #login-column #login-box {
        margin-top: 40px;
        max-width: 600px;
        height: 320px;
    }

    #login .container #login-row #login-column #login-box #login-form {
        padding: 20px;
    }

    #login .container #login-row #login-column #login-box #login-form #register-link {
        margin-top: -75px;
    }
</style>
</body>
</html>
