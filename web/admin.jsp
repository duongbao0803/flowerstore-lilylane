<%-- 
    Document   : admin
    Created on : May 31, 2023, 5:02:29 PM
    Author     : duong  
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
      rel="stylesheet">
<!-- boostrap -->
<link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/font/css/all.css">
<link rel="stylesheet" href="./assets/css/styleadmin.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="MainController?HOME"></c:redirect>
        </c:if>
        <div class="container-fluid header_main">
            <div class="container-fluid navbar-content">
                <nav class="navbar navbar-expand-lg">
                    <div class="logo col-md-2">
                        <a class="navbar-brand" href="MainController?action=HOME"><img
                                src="assets/img/logo/lily-lane-logo-web.png" alt width="100px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="service col-md-7 collapse navbar-collapse" id="navbarSupportedContent">
                        <a class="nav-link active" href="#">Admin Page</a>
                    </div>
                    <div class="right-nav col-md-2">
                        <div class="account">
                            <div class="logo-admin">
                                <img src="./assets/img/admin/avt-admin.png" alt="" width="60px">
                            </div>
                            <div class="admin-text">
                                <p>ADMIN</p>
                                <p>${sessionScope.LOGIN_USER.fullName}</p>
                            </div>
                        </div>
                    </div>
                    <div class="bell col-md-1">
                        <a href="#"><i class="fa-solid fa-bell"></i></a>
                    </div>
                </nav>
            </div>
        </div>

        <div class="body-main">
            <div class="row" style="margin: 0px;">
                <div class="left-bar col-md-2">
                    <div class="service">
                        <ul class="list-service">
                            <a href="#">
                                <li><i class="fa-solid fa-chart-line"></i> Dashboard</li>
                            </a>
                            <a href="#">
                                <li><i class="fa-regular fa-user"></i> Manager User </li>
                            </a>
                            <a href="#">
                                <li><i class="fa-solid fa-bars-progress"></i> Manager Product</li>
                            </a>
                            <c:url var="logoutLink" value="MainController">
                                <c:param name="action" value="Logout"></c:param>
                            </c:url>
                            <a href="${logoutLink}">          
                                <li><i class="fa-solid fa-right-from-bracket"></i> Logout</li>
                            </a>
                        </ul>
                    </div>
                </div>

                <div class="right-bar col-md-10" style="  background-color: #f2f6fa;">
                    <div class="info">
                        <p>Manager User</p>
                        <p><span>${requestScope.ERROR}</span></p>
                    </div>
                    <div class="control-add-user">
                        <div class="add-user">
                            <input type="submit" value="+ Add User">
                        </div>

                    </div>
                    <div class=" user-list">
                        <p>User List</p>
                        <div>
                            <form action="MainController">
                                <input type="text" name="search" value="${param.search}">
                                <input type="submit" name="action" value="Search">
                            </form>
                        </div>
                    </div>

                    <div class="list-info">
                        <c:if test="${requestScope.LIST_USER != null}">
                            <c:if test="${not empty requestScope.LIST_USER}">
                                <table class="table">
                                    <tr>
                                        <td>No</td>
                                        <td>User ID</td>
                                        <td>Full Name</td>
                                        <td>Email</td>
                                        <td>Role ID</td>
                                        <td>Password</td>
                                        <td style="text-align: center;">Action</td>
                                    </tr>
                                    <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                        <form action="MainController" method="POST">
                                            <tr style="background-color: white; border: none;">
                                                <td>${counter.count}</td>
                                                <td><input type="text" name="userID" value="${user.userID}" readonly=""/></td>
                                                <td><input type="text" name="fullName" value="${user.fullName}" required=""/></td>
                                                <td></td>
                                                <td><input type="text" name="roleID" value="${user.roleID}" required=""/></td>
                                                <td>${user.password}</td>
                                                <td class="action">
                                                    <div class="update">
                                                        <input type="submit" name="action" value="Update"/>
                                                        <input type="hidden" name="search" value="${param.search}"/>
                                                    </div>
                                                    <div class="delete">                                                                                                    
                                                        <c:url var="deleteLink" value="MainController">
                                                            <c:param name="action" value="Delete"></c:param>
                                                            <c:param name="userID" value="${user.userID}"></c:param>
                                                            <c:param name="search" value="${param.search}"></c:param>
                                                        </c:url>
                                                        <input type="submit" name="action" value="Delete"/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>

                                </table>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <script src="./assets/js/bootstrap/jquery.min.js"></script>
        <script src="./assets/js/bootstrap/popper.min.js"></script>
        <script src="./assets/js/bootstrap/bootstrap.min.js"></script>

    </body>
</html>




