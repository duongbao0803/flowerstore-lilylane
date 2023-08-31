<%-- 
    Document   : success
    Created on : Jul 5, 2023, 9:24:08 PM
    Author     : duong
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Success | Lily Lane</title>
        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">

        <!-- default -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/toastMessage.css">
        <link rel="stylesheet" href="./assets/css/stylehome.css">

        <!-- custom -->
        <link rel="stylesheet" href="./assets/css/stylesuccess.css">
    </head>
    <body>
        <div class="container-fluid" id="header">
            <div class="container" id="header-content">
                <p class="mail"><i class="fa-regular fa-paper-plane"></i> lilylanestore.flower@gmail.com</p>
                <p class="phone"><i class="fa-solid fa-phone"></i> +84 98 088 9898</p>
                <p class="signal"></i> Whatever the occasion, we'll find a bouquet</p>


            </div>
        </div>

        <div class="container-fluid header_main">
            <div class="container-fluid navbar-content">
                <nav class="navbar navbar-expand-lg">
                    <div class="logo col-md-3">
                        <a class="navbar-brand" href="#"><img src="assets/img/logo/lily-lane-logo-web.png" alt
                                                              width="100px"></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="service col-md-6 collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class=" nav-item ">
                                <a class="nav-link active" href="MainController?action=HOME">Home</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Flower Gallery</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Service</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">About us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <div class="right-nav nav-item col-md-3">
                        <ul class="col-md-5 cart navbar-nav mr-auto">
                            <li class="nav-item" style="padding: 0;">
                                <a class="nav-link" href="cart.jsp" style="font-size: 20px;"><i
                                        class="fa-solid fa-cart-shopping"></i></a>
                            </li>
                        </ul>
                        <c:if test="${sessionScope.LOGIN_USER == null}">
                            <div class="col-md-7 account">
                                <a href="MainController?action=Login"><i class="fa-solid fa-user"></i> Login</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER != null}">
                            <div class="col-md-7 account">
                                <li style="list-style-type: none;" class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa-solid fa-user"></i> ${sessionScope.LOGIN_USER.fullName}
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                                            <a class="dropdown-item" href="admin.jsp">My account</a>
                                        </c:if>
                                        <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                                            <a class="dropdown-item" href="user.jsp">My account</a>
                                        </c:if>                                         
                                        <a class="dropdown-item" href="MainController?action=Logout">Logout</a>
                                    </div>
                                </li>
                            </div>
                        </c:if>
                    </div>
                </nav>
            </div>
        </div>
        <!-- end: header  -->



        <div class="outline">
            <div class="container payment-body">
                <div class="row payment-container">
                    <div class="col-md-12 pay-header">
                        <h5>PAYMENT INFORMATION</h5>
                    </div>

                    <div class="col-md-12 pay-img">
                        <img src="./assets/img/checkout/success-icon.png" alt="" width="100px">
                        <h4>Payment Success</h4>
                    </div>
                    <div class="col-md-12 payment-in4">
                        <c:if test="${requestScope.ORDER == null}">
                            <h2>Opps.</h2>
                            <p>We'are sorry, but somthing went wrong.</p>
                            <a href="MainController?action=HOME">Go back to home page.</a>    
                        </c:if>
                        <table>
                            <tbody>
                                <tr>
                                    <th>Customer:</th>
                                    <td>${sessionScope.LOGIN_USER.fullName}</td>
                                </tr>
                                <tr>
                                    <th>Amount paid:</th>
                                    <td class="amout">${requestScope.ORDER.total}</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 break">
                        <div class="line"></div>
                        <span>Details</span>
                        <div class="line"></div>
                    </div>
                    <div class="col-md-12 payment-details">
                        <table>
                            <tr>
                                <th>Bill create date:</td>
                                <td>
                                    <fmt:formatDate value="${requestScope.ORDER.date}" pattern="dd/MM/yyyy HH:mm:ss" var="formattedDate" />
                                    ${formattedDate}
                                </td>
                            </tr>
                            <tbody>
                                <tr>
                                    <th>Payment type:</td>
                                    <td>Payment on delivery (COD)</td>
                                </tr>
                            </tbody>
                        </table>
                        <p>We'll email you an order confirmation with details information.</p>
                        <div class="thanks">
                            <p>Thank you for choosing us.</p>
                            <p>See you again!</p>
                        </div>
                        <div class="payment-footer">
                            <p><a href="MainController?action=HOME">Back to home page</a></p>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!--footer-->

        <div class="container-fluid">
            <div>
                <div class="row footer">
                    <div class="col-md-3" style="margin: auto;">
                        <div style="text-align: center;">
                            <img src="./assets/img/logo/353377363_270213872326179_7859750982400627396_n.png" alt=""
                                 style="width: 120%;">
                        </div>
                    </div>

                    <div class="col-md-4">
                        <h2>ABOUT OUR SHOP</h2>
                        <ul>
                            <li><i class="fa-solid fa-map-location-dot"></i> 289 Tran Hung Dao, District 1, Ho Chi Minh City
                            </li>
                            <li><i class="fa-solid fa-paper-plane"></i> lilylanestore.flower@gmail.com</li>
                            <li><i class="fa-solid fa-phone"></i> 0989 899 998</li>
                        </ul>
                        <div class="icon">
                            <a href="#"><i class="fa-brands fa-square-facebook  fa-2x" style="color: #807171;"></i></a>
                            <a href="#"><i class="fa-brands fa-square-youtube  fa-2x" style="color: #807171;"></i></a>
                            <a href="#"><i class="fa-brands fa-square-twitter  fa-2x" style="color: #807171;"></i></a>
                            <a href="#"><i class="fa-brands fa-square-instagram  fa-2x" style="color: #807171;"></i></a>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <h2>CUSTOMER SERVICE</h2>
                        <ul>
                            <li>Shipping Policy</li>
                            <li>Help & Contact Us</li>
                            <li>Terms and Conditions</li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h2>INFORMATION</h2>
                        <ul>
                            <li>About Us</li>
                            <li>Delivery Information</li>
                            <li>Privacy Page</li>
                        </ul>
                    </div>
                </div>
                <div class="row footer_bottom">
                    <span>Copyright @2023 All rights reserved | <span style="font-weight: bold;">Lily
                            Lane</span></span>
                </div>
            </div>
        </div>
        <!--end-->

        <script src="./assets/js/bootstrap/jquery.min.js"></script>
        <script src="./assets/js/bootstrap/popper.min.js"></script>
        <script src="./assets/js/bootstrap/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script
    </body>
</html>
