<%--
  Created by IntelliJ IDEA.
  User: moringaschool
  Date: 11/17/19
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="/includes/navbar.jsp"%>
<html>
<head>
    <title>Single Post</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"></script>
</head>

<body>
<br><br><br><br><br>

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
<table class="table table-bordered" style="margin-left: 15%;width:70%">
    <h2 style="text-align: center">POST DEATILS</h2>
    <thead>
    <tr>
        <th scope="col">Title</th>
        <th scope="col">Content</th>
        <th scope="col">Category</th>
        <th scope="col">Author</th>

    </tr>
    </thead>
    <tbody>
        <tr>
            <td>${post.title}</td>
            <td>${post.postDetails}</td>
            <td>${post.category}</td>
            <td>${post.user.userName}</td>


        </tr>

    </tbody>
</table>

<table class="table table-bordered" style="margin-left: 15%;width:70%">
    <h2 style="text-align: center">Comments On Post(${count})</h2>
    <thead>
    <tr>
        <th scope="col">Comment</th>
        <th scope="col">By</th>


    </tr>
    </thead>
    <tbody>

<c:forEach items="${comments}" var="com">
        <tr>
                    <td>${com.comment}</td>
                    <td>${com.user.userName}</td>
 </tr>
</c:forEach>
    </tbody>
</table>
<div class="container">

    <form action="details" method="post" style="text-align: center">

        <div class="group">
            <input type="hidden" value="${post.id}" name="post_id">
            <input type="text" required name="com" placeholder="Add Comment">
            <span class="highlight"></span>
            <span class="bar"></span>
            <button class="btn btn-info">Comment</button>

        </div>
    </form>
</div>
<%--<div clcontainer--%>
<%--<form class="form-inline" action="details" method="post" style="text-align: center">--%>
    <%--<div class="form-group mx-sm-3 mb-2">--%>
        <%--<label for="com" class="sr-only">New Comment</label>--%>
        <%--<input type="hidden" value="${post.id}" name="post_id">--%>
        <%--<input type="text" class="form-control" required name="com" id="com" placeholder="Comment">--%>
    <%--</div>--%>
    <%--<button type="submit" class="btn btn-info mb-2">Comment</button>--%>
<%--</form>--%>

</body>
</html>
