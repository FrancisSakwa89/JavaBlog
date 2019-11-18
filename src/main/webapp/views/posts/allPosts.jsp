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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

<table class="table table-bordered" style="margin-left: 15%;width:70%">
    <thead>
    <tr>
        <th scope="col">Title</th>
        <th scope="col">Content</th>
        <th scope="col">Category</th>
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
            <td>${post.user.userName}</td>
            <td><a href="details?id=${post.id}" ><button class="btn btn-info">View</button></a></td>
            <td><a href="addPost"><button class="btn btn-info">Add</button></a></td>

        </tr>

    </c:forEach>
    </tbody>
</table>

</body>
</html>
