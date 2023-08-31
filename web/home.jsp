<%-- 
    Document   : home.jsp
    Created on : 01-Jul-2023, 10:40:13
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
        <!-- <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400&display=swap"
              rel="stylesheet">
        <!-- boostrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.min/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/font/css/all.css">
        <link rel="stylesheet" href="./assets/css/stylehome.css">
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



        <!--body-->
        <div class="body">
            <div class="banner">
                <div class="banner-img">
                    <div class="banner-img-text">
                        <p>Flower & Gift</p>
                        <h1>Perfect Bunch </h1>
                        <h1>For Every Occasion</h1>
                        <a href="#move"><span>Shop Now</span></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid intro-product">
            <div class="hot-product">

                <div class="product">
                    <div class="product-text">
                        <p>NEW ARRIVALS</p>
                        <p>For Birthdays.</p>
                        <p>Starting from <span>$19.00</span></p>
                        <input type="submit" value="SHOP NOW >" name="#move">
                    </div>
                    <div class="product-img-left child"></div>
                </div>

                <div class="product">
                    <div class="product-text">
                        <p>ON SALES</p>
                        <p>For Birthdays.</p>
                        <p>Starting from <span>$19.00</span></p>
                        <input type="submit" value="SHOP NOW >">
                    </div>
                    <div class="product-img-center child"></div>
                </div>

                <div class="product">
                    <div class="product-text">
                        <p>NEW ARRIVALS</p>
                        <p>For Birthdays.</p>
                        <p>Starting from <span>$19.00</span></p>
                        <input type="submit" value="SHOP NOW >">
                    </div>
                    <div class="product-img-right child"></div>
                </div>
            </div>
        </div>

        <div class="process">
            <div class="process-list">
                <div class="process-object">
                    <i class="fa-regular fa-paper-plane fa-3x" style="color: #ff6b6b;"></i>
                    <p>Delievred Express</p>
                    <p>We ship express in our exclusive packing to provide your gifts with a 100% secure protected journey.
                    </p>
                </div>
                <div class="process-object">
                    <i class="fa-sharp fa-solid fa-medal fa-3x" style="color: #ff6b6b;"></i>
                    <p>Checked for Quality</p>
                    <p>We usr a 7-step process to unsure the quality of every single flower.</p>
                </div>
                <div class="process-object">
                    <i class="fa-solid fa-gift fa-3x" style="color: #ff6b6b;"></i>
                    <p>Weekly Exculive Gifts</p>
                    <p>Visit The Loke and shop our selection of weekly special gifts for all today!</p>
                </div>
                <div class="process-object">
                    <i class="fa-regular fa-message fa-3x" style="color: #ff6b6b;"></i>
                    <p>Delievred Express</p>
                    <p>We ship express in our exclusive packing to provide your gifts with a 100% secure protected journey.
                    </p>
                </div>
            </div>
        </div>


        <div class="container-fluid best-seller" id="move">
            <div class="best-seller-title">
                <h1>BEST SELLER</h1>
                <p>We're more than just a pretty vase. Learn more about our flowers, our values, and our commitment to the
                    planet.</p>
            </div>
            <div>
                <div class="best-seller-product">
                    <c:if test="${requestScope.LIST_FLOWER != null}">
                        <c:if test="${not empty requestScope.LIST_FLOWER}">
                            <c:forEach var="flower" items="${requestScope.LIST_FLOWER}"> 
                                <div class="best-seller-product-list">
                                    <div class="hot-sale">HOT</div>
                                    <form action="">
                                        <div class="best-add-to-cart">
                                            <div class="cart-service">
                                                <button><i class="fa-solid fa-search"></i></button>
                                                <input type="submit" name='action' value="ADD TO CART">
                                                <input type="hidden" name="productID" value="${flower.productID}"/>                                            
                                                <button><i class="fa-solid fa-shuffle"></i></button>
                                            </div>
                                        </div>
                                        <div class="best-text">
                                            <p>${flower.name}</p>
                                            <p>${flower.price}$</p>
                                        </div>
                                    </form>
                                    <div class="child" style="background-image: url('assets/img/best-seller/${flower.image}');"></div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </c:if>

                </div>
            </div>
        </div>
        <!--end body-->




        <!--footer-->
        <div class="subscribe">
            <div class="subcribe-img">
                <div class="subcribe-img-object">
                    <div class="subcribe-img-text">
                        <h1>Subscribe</h1>
                        <h1>for New Updates!</h1>
                        <p>When looking for a new bouquet idea for Valentine or Mother's Day, ask us for a tip!
                        </p>
                    </div>
                    <div class="subcribe-search">
                        <input type="text" placeholder="Enter your email">
                        <button><i class="fa-solid fa-paper-plane"></i></button>
                    </div>
                </div>
            </div>
        </div>
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
    </body>
</html>
