<%-- 
    Document   : cart.jsp
    Created on : 04-Jul-2023, 16:46:27
    Author     : duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">
        <!-- <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> -->
        <!-- boostrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/stylehome.css">
        <link rel="stylesheet" href="./assets/css/stylecheckout.css">
        <link rel="stylesheet" href="./assets/css/stylecart.css">


        <!--<<link rel="stylesheet" href="assets/css/toastMessage.css"/>-->


        <!-- <link rel="stylesheet" href="./assets/css/stylecheckout.css"> -->
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


    <div class="container-fluid">
        <div class="row banner">
            <div class="banner-text">
                <h4>LiLy Lane Store</h4>
                <h1>MY CART</h1>
            </div>
        </div>
    </div>


    <c:if test="${sessionScope.CART == null}">
        <div class="container">
            <div class="row">
                <div class="title-page col-md-12">
                    <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                        <i class="fa-solid fa-angle-right"></i> Your shopping
                        cart
                    </h4>
                </div>
                <div class="empty-cart col-md-12">
                    <img src="./assets/img/cart/empty-cart.png" alt="Giỏ hàng trống">
                    <h3>Your cart is empty :( </h3>
                    <a href="MainController?action=ShoppingNow">Shopping now</a>
                </div>
            </div>
        </div> 
    </c:if>

    <c:if test="${sessionScope.CART != null}">
        <c:if test="${empty sessionScope.CART.cart}">
            <div class="container">
                <div class="row">
                    <div class="title-page col-md-12">
                        <h4><a href="./home.html"><i class="fa-solid fa-home"></i></a>
                            <i class="fa-solid fa-angle-right"></i> Your shopping
                            cart
                        </h4>
                    </div>
                    <div class="empty-cart col-md-12">
                        <img src="./assets/img/cart/empty-cart.png" alt="Giỏ hàng trống">
                        <h3>Your cart is empty :( </h3>
                        <a href="MainController?action=ShoppingNow">Shopping now</a>
                    </div>
                </div>
            </div> 
        </c:if>
        <c:if test="${not empty sessionScope.CART.cart}">
            <div class="background-container">
                <div class="container">
                    <div class="row">
                        <div class="title-page col-md-12">
                            <h4><a href="MainController"><i class="fa-solid fa-home"></i></a>
                                <i class="fa-solid fa-angle-right"></i> Your shopping cart
                            </h4>
                        </div>
                    </div>


                    <div class="checkout">
                        <table class="table table-cart">
                            <thead>
                                <tr class="title">
                                    <th>Flower</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="left-tbody">
                                <c:forEach var="listFlower" items="${sessionScope.CART.cart.values()}">
                                    <c:set var="quantity" value="${listFlower.quantity}" />
                                    <c:set var="price" value="${listFlower.price}" />
                                    <c:set scope="request" var="total" value="${total + (quantity * price)}" />
                                <form action="MainController">
                                    <tr>
                                        <td>
                                            <div class="product">
                                                <img src="assets/img/best-seller/${listFlower.image}" alt width="70px"
                                                     height="70px">
                                                <p>${listFlower.name}</p>
                                            </div>
                                        </td>
                                        <td> <span>${listFlower.price}</span></td>
                                        <td class="quantity">
                                            <input type="number" name="quantity" value="${listFlower.quantity}" min="1" required=""/>
                                        </td>
                                        <td>${listFlower.price * listFlower.quantity}</td>
                                        <td>
                                            <div class="action">
                                                <div class="update">
                                                    <input type="hidden" name="action" value="Edit"/>
                                                    <input type="hidden" name="productID" value="${listFlower.productID}"/>

                                                    <button><i class="fa-solid fa-pen-to-square"></i></button>
                                                </div>
                                </form>
                                <div class="delete">
                                    <form action="MainController">
                                        <input type="hidden" name="action" value="Remove"/> 
                                        <input type="hidden" name="productID" value="${listFlower.productID}"/>                                            
                                        <button><i class="fa-solid fa-trash-can"></i></button>
                                    </form>
                                </div>
                        </div>  
                        </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    </table>

                    <table class="table-checkout">
                        <thead>
                        <td colspan="2" class="title">
                            Cart total
                        </td>
                        </thead>
                        <tbody>
                            <tr class="caculator">
                                <td>Subtotal:</td>
                                <td>${total}</td>
                            </tr>
                            <tr class="caculator">
                                <td>Shipping:</td>
                                <td> 3</td>
                            </tr>
                            <tr style="border-top: 2px solid #CCCCCC;"></tr>
                            <tr class="caculator">
                                <td class="total">Total:</td>
                                <td class="cost">${total + 3}</td>
                            </tr>

                        <form action="MainController" method="POST">
                            <tr>
                                <td colspan="2" class="check-out">
                                    <input type="submit" name="action" value="CHECK OUT"/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="buy-more">
                                    <input type="submit" name="action" value="BUY MORE">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><p  style="background: #ff9898; color: white; width: 100%; padding-left: 20px"> ${requestScope.MESSAGE}</p></td>
                            </tr>
                        </form>
                        </tbody>                     
                    </table>
                </div>
            </div>
        </div>
    </c:if>
</c:if>

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
                    <li><i class="fa-solid fa-map-location-dot"></i> 289 Tran Hung Dao, District 1, Ho
                        Chi
                        Minh City
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



<script src="./assets/js/bootstrap/jquery.min.js"></script>
<script src="./assets/js/bootstrap/popper.min.js"></script>
<script src="./assets/js/bootstrap/bootstrap.min.js"></script>
<script src="./assets/js/jscript/toastMessage.js"></script>



</body>
</html>
