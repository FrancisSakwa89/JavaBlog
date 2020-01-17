<%--
  Created by IntelliJ IDEA.
  User: moringaschool
  Date: 8/27/19
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/includes/navbar.jsp"%>
<html>
<head>
    <title>ALL POSTS</title>
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
    <!------ Include the above in your HEAD tag ---------->
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
<%--<%--%>
    <%--if (session.getAttribute("username") == null) {--%>
        <%--response.sendRedirect("index.jsp");--%>
    <%--}--%>

<%--%>--%>

<br><br>
<h1 style="text-align: center">ALL POSTS</h1>
<p><span style="color:red"><%=(request.getAttribute("dltMsg") == null) ? "" : request.getAttribute("dltMsg")%></span></p>
<p><span style="color:red"><%=(request.getAttribute("notDltMsg") == null) ? "" : request.getAttribute("notDltMsg")%></span></p>
<div class="container" style="text-align: center">
    <a href="addPost" data-toggle="modal" data-target="#modalContactForm"><button class=" btn btn-success"><i class="fas fa-plus fa-2x" aria-hidden="true"></i>Add</button></a>
</div>
<table class="table table-bordered" style="margin-left: 15%;width:70%">
    <thead>
    <tr>
        <th scope="col">Title</th>
        <th scope="col">Content</th>
        <th scope="col">Category</th>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Author</th>
        <th scope="col">View</th>
        <th scope="col">Add</th>
        <%--<th scope="col">CustomerName</th>--%>
        <%--<th scope="col">Total Amount</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${posts}" var="post">
        <tr>
                <%--        <th scope="row">1</th>--%>
            <%--<td><%=(request.getAttribute("title")) %></td>--%>
            <td>${post.title}</td>
            <td>${post.postDetails}</td>
            <td>${post.category}</td>
            <td>${post.date}</td>
            <td>${post.time}</td>
            <td>${post.user.userName}</td>
            <td><a href="details?id=${post.id}" ><button class="btn btn-info btn-sm">Details</button></a></td>
            <td><a href="update?id=${post.id}" ><button class="btn btn-info btn-sm">Update</button></a></td>
            <td>
                <form action="delete?id=${post.id}" method="post">
                    <input type="hidden" value="${post.id}" name="post_id">

                        <button class=" btn btn-danger btn-sm" id="dl" type="submit" onclick="dlt();">Delete</button>

                    <%--<i class="fas fa-delete fa-2x" aria-hidden="true"></i>--%>

                </form>

            </td>
                    <%--<a href="addPost"><button class="btn btn-danger btn-small"><i class="fas fa-delete fa-2x" aria-hidden="true"></i>Delete</button></a>--%>

        </tr>

    </c:forEach>
    </tbody>
</table>

 <div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
     <form action="addPost" method="post">
     <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">New Post</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-user prefix grey-text"></i>
                        <label data-error="wrong" data-success="right" for="postTitle">Post Title</label><br>
                        <input type="text" required name="postTitle" id="postTitle" class="form-control validate">
                    </div>

                    <div class="md-form mb-5">
                        <i class="fas fa-envelope prefix grey-text"></i>
                        <label data-error="wrong" data-success="right" for="content">Content</label><br>
                        <input type="text" required name="content" id="content" class="form-control validate">
                    </div>

                    <div class="md-form mb-5">
                        <select required name="category" id="" class="btn">
                            <option>Category</option>
                            <option>SPORTS</option>
                            <option>EDUCATION</option>
                            <option>TECHNOLOGY</option>
                            <option>HEALTH</option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <input type="submit" name="submit" class="btn btn-primary btn-md" value="Add Post"><i class="fas fa-paper-plane-o ml-1"></i>
                    <input type="reset" name="reset" class="btn btn-danger btn-md" value="Cancel">
                    <%--<button class="btn btn-unique">Send <i class="fas fa-paper-plane-o ml-1"></i></button>--%>
                </div>
            </div>
        </div>
     </form>
    </div>

<script>
    function dlt(){
        var remove = document.getElementById("dl").valueOf();
        alert("Are you sure you want to delete?")
    }
</script>
<%--<div class="text-center">--%>
    <%--<a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalContactForm">Send Message</a>--%>
<%--</div>--%>

</body>
</html>
