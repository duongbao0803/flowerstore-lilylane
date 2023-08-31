<%-- 
    Document   : checkout
    Created on : 06-Jul-2023, 22:46:01
    Author     : duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap" rel="stylesheet">

        <!-- default -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/stylehome.css">
        <!-- custom -->
        <link rel="stylesheet" href="./assets/css/stylecheckout.css">

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
                                <a class="nav-link active" href="#">Home</span></a>
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


        <div class="container-fluid">
            <div class="row banner">
                <div class="banner-text">
                    <h4>LiLy Lane Store</h4>
                    <h1>MY CART</h1>
                </div>
            </div>
        </div>


        <c:if test="${sessionScope.LOGIN_USER != null}">
            <div class="background-container">
                <div class="container">
                    <div class="row">
                        <div class="title-page col-md-12">
                            <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                                <i class="fa-solid fa-angle-right"></i> Your shopping
                                cart
                                <i class="fa-solid fa-angle-right"></i> Checkout
                            </h4>
                        </div>
                    </div>
                    <form action="MainController" method="GET">
                        <div>
                            <div class="checkout">
                                <div>
                                    <p>Billing Details</p>
                                    <table class="table-cart">
                                        <tr>
                                            <td>Full Name:</td>
                                            <td>${sessionScope.LOGIN_USER.fullName}</td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td class="in4"><input type="text" value="TP. Vung Tau" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td class="in4"><input type="text" value="" readonly>
                                            </td>
                                        </tr>

                                    </table>
                                    <div class="back-to-cart">
                                        <a href="MainController?action=CART"><i class="fa-solid fa-arrow-left-long"></i> Back to Cart</a>
                                    </div>
                                </div>

                                <div>
                                    <table class="table-checkout">
                                        <thead>
                                        <td colspan="2" class="title">
                                            Cart total
                                        </td>
                                        </thead>
                                        <tbody>
                                            <tr class="caculator">
                                                <td>Subtotal:</td>
                                                <td>${requestScope.TOTAL}</td>
                                            </tr>
                                            <tr class="caculator">
                                                <td>Shipping:</td>
                                                <td>3</td>
                                            </tr>
                                            <tr style="border-top: 2px solid #CCCCCC;"></tr>
                                            <tr class="caculator">
                                                <td>Total:</td>
                                                <td>${requestScope.TOTAL + 3}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <div style="margin-top: 250px;">
                        <div class="checkout">
                            <div>
                                <p>Your Order</p>
                                <c:if test="${sessionScope.CHECKOUT != null}">
                                    <c:if test="${not empty sessionScope.CHECKOUT}">
                                        <table class="table table-cart">
                                            <thead>
                                                <tr class="title">
                                                    <th>Flower</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody class="left-tbody">
                                                <c:forEach var="listFlower" items="${sessionScope.CHECKOUT.cart.values()}">
                                                    <tr>
                                                        <td>
                                                            <div class="product">
                                                                <img src="assets/img/best-seller/${listFlower.image}" alt
                                                                     width="70px" height="70px">
                                                                <p>${listFlower.name}</p>
                                                            </div>

                                                        </td>
                                                        <td class="quantity">
                                                            ${listFlower.quantity}
                                                        </td>
                                                        <td>${listFlower.price}</td>
                                                        <td>${listFlower.price * listFlower.quantity}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                </c:if>
                            </div>

                            <div>
                                <table class="table-checkout">
                                    <thead>
                                    <td colspan="2" class="title">
                                        Payment Method
                                    </td>
                                    </thead>
                                    <tbody>
                                        <tr class="payment">
                                            <td>
                                                <div class="vnpay-method">
                                                    <label class="vnpay">
                                                        <input type="radio" readonly name="payment-method" value="">
                                                        <span class="radio-fake"></span>
                                                        <span class="lable">
                                                            <div style="cursor: pointer; height: 64px;">
                                                                <div class="payment-method_detail">
                                                                    <img src="./assets/img/checkout/vnpay.png" alt=""
                                                                         width="40px">
                                                                    <div style="margin-right: 12px;">
                                                                        <div class="payment-method_title">
                                                                            <span>Payment with VNPAY</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="payment">
                                            <td>
                                                <div class="vnpay-method">
                                                    <label class="vnpay">
                                                        <input type="radio" readonly name="payment-method" value="COD">
                                                        <span class="radio-fake"></span>
                                                        <span class="lable">
                                                            <div style="cursor: pointer; height: 64px;">
                                                                <div class="payment-method_detail">
                                                                    <img src="./assets/img/checkout/cash-delivery.png"
                                                                         alt="" width="40px">
                                                                    <div style="margin-right: 12px;">
                                                                        <div class="payment-method_title">
                                                                            <span>Payment on delivery (COD)</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="check-terms">
                                                <div class="terms">
                                                    <input type="checkbox">
                                                    <p>I have read and accept the terms and conditions</p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="check-out" readonly>
                                                <input type="hidden" name="totalPayment" value="${requestScope.TOTAL + 3}"/>
                                                <input type="submit" name="action" value="Payment">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </form>
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
    </body>
</html>
