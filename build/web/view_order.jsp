<%-- 
    Document   : view_order
    Created on : Dec 13, 2019, 10:28:54 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <!-- Title  -->
        <title>View Order</title>
        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">
        <!-- Style CSS -->
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <!-- Preloader -->
        <div id="preloader">
            <div class="south-load"></div>
        </div>
        <%@include  file="header.jsp" %>
        <!-- ##### Breadcumb Area Start ##### -->
        <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="breadcumb-content">
                            <h3 class="breadcumb-title">View Order</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Breadcumb Area End ##### -->

        <!-- ##### Blog Area Start ##### -->
        <section class="south-blog-area section-padding-100">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-10 col-md-offset-1">
                        <c:if test="${sessionScope.LISTHOUSEORDER==null || empty sessionScope.LISTHOUSEORDER}">
                            <h3 class="text-danger text-center">${requestScope.MESSAGEBUY}</h3>
                           
                            <c:url var="homeLink" value="MainController">
                                <c:param name="action" value="Home"></c:param>
                            </c:url>
                            <a href="${homeLink}" class="">Continue Buy House</a>
                           
                        </c:if>
                        <c:if test="${sessionScope.LISTHOUSEORDER!=null && not empty sessionScope.LISTHOUSEORDER}">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>House</th>
                                        <th>Vat</th>
                                        <th> </th>
                                        <th class="text-center">Price</th>

                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="list_house" items="${sessionScope.LISTHOUSEORDER}">
                                        <tr>
                                            <td class="col-sm-8 col-md-6">
                                                <div class="media">
                                                    <c:url var="singleLink" value="MainController">
                                                        <c:param name="action" value="View Signle House"></c:param>
                                                        <c:param name="houseID" value="${list_house.houseID}"></c:param>

                                                    </c:url>
                                                    <a class="thumbnail pull-left" href="${singleLink}"> 
                                                        <img class="media-object" src="${list_house.picture}" style="width: 72px; height: 52px;" alt="${list_house.picture}"> 
                                                    </a>
                                                    <div class="media-body">

                                                        <h4 class="media-heading">
                                                            <a href="${singleLink}">${list_house.title}</a>
                                                        </h4>

                                                        <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                                    </div>
                                                </div></td>
                                            <td class="col-sm-1 col-md-1" style="text-align: center">
                                                <input type="email" class="form-control" id="exampleInputEmail1" value="3">
                                            </td>
                                            <td class="col-sm-1 col-md-1 text-center"></td>
                                            <td class="col-sm-1 col-md-1 text-center"><strong>$${list_house.price}</strong></td>
                                            <td class="col-sm-1 col-md-1">
                                                <c:url var="linkDeleteHouse" value="MainController">
                                                    <c:param name="action" value="Delete House In Order"></c:param>
                                                    <c:param name="houseID" value="${list_house.houseID}"></c:param>
                                                </c:url>
                                                <button type="submit" class="btn btn-danger" >
                                                    <a href="${linkDeleteHouse}"><span class="glyphicon glyphicon-remove"></span> Remove</a>
                                                </button></td>
                                        </tr>

                                    </c:forEach>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td><h3>Total</h3></td>

                                        <td class="text-right"><h3><strong>$${sessionScope.TOTALPRICE}</strong></h3></td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>

                                            <button type="button" class="btn btn-default" >
                                                <c:url var="homeLink" value="MainController">
                                                    <c:param name="action" value="Home"></c:param>
                                                </c:url>
                                                <a href="${homeLink}">
                                                    <span class="glyphicon glyphicon-shopping-cart"></span> Continue Buy House
                                                </a>
                                            </button></td>
                                        <td>
                                            <c:url var="linkCheckOut" value="MainController">
                                                <c:param name="action" value="Check Out"></c:param>
                                            </c:url>
                                            <form action="MainController" method="POST">
                                                <input type="submit" class="btn btn-success" name="action" value="Checkout"/>

                                            </form>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                            <h3 class="text-danger text-center">${requestScope.MESSAGEBUY}</h3>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Blog Area End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <footer class="footer-area section-padding-100-0 bg-img gradient-background-overlay" style="background-image: url(img/bg-img/cta.jpg);">
            <!-- Main Footer Area -->
            <div class="main-footer-area">
                <div class="container">
                    <div class="row">

                        <!-- Single Footer Widget -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="footer-widget-area mb-100">
                                <!-- Widget Title -->
                                <div class="widget-title">
                                    <h6>About Us</h6>
                                </div>

                                <img src="img/bg-img/footer.jpg" alt="">
                                <div class="footer-logo my-4">
                                    <img src="img/core-img/logo.png" alt="">
                                </div>
                                <p>Integer nec bibendum lacus. Suspen disse dictum enim sit amet libero males uada feugiat. Praesent malesuada.</p>
                            </div>
                        </div>

                        <!-- Single Footer Widget -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="footer-widget-area mb-100">
                                <!-- Widget Title -->
                                <div class="widget-title">
                                    <h6>Hours</h6>
                                </div>
                                <!-- Office Hours -->
                                <div class="weekly-office-hours">
                                    <ul>
                                        <li class="d-flex align-items-center justify-content-between"><span>Monday - Friday</span> <span>09 AM - 19 PM</span></li>
                                        <li class="d-flex align-items-center justify-content-between"><span>Saturday</span> <span>09 AM - 14 PM</span></li>
                                        <li class="d-flex align-items-center justify-content-between"><span>Sunday</span> <span>Closed</span></li>
                                    </ul>
                                </div>
                                <!-- Address -->
                                <div class="address">
                                    <h6><img src="img/icons/phone-call.png" alt=""> +45 677 8993000 223</h6>
                                    <h6><img src="img/icons/envelope.png" alt=""> office@template.com</h6>
                                    <h6><img src="img/icons/location.png" alt=""> Main Str. no 45-46, b3, 56832, Los Angeles, CA</h6>
                                </div>
                            </div>
                        </div>

                        <!-- Single Footer Widget -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="footer-widget-area mb-100">
                                <!-- Widget Title -->
                                <div class="widget-title">
                                    <h6>Useful Links</h6>
                                </div>
                                <!-- Nav -->
                                <ul class="useful-links-nav d-flex align-items-center">
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">Services</a></li>
                                    <li><a href="#">Properties</a></li>
                                    <li><a href="#">Listings</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Properties</a></li>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">Elements</a></li>
                                    <li><a href="#">FAQ</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Single Footer Widget -->
                        <div class="col-12 col-sm-6 col-xl-3">
                            <div class="footer-widget-area mb-100">
                                <!-- Widget Title -->
                                <div class="widget-title">
                                    <h6>Featured Properties</h6>
                                </div>
                                <!-- Featured Properties Slides -->
                                <div class="featured-properties-slides owl-carousel">
                                    <!-- Single Slide -->
                                    <div class="single-featured-properties-slide">
                                        <a href="#"><img src="img/bg-img/fea-product.jpg" alt=""></a>
                                    </div>
                                    <!-- Single Slide -->
                                    <div class="single-featured-properties-slide">
                                        <a href="#"><img src="img/bg-img/fea-product.jpg" alt=""></a>
                                    </div>
                                    <!-- Single Slide -->
                                    <div class="single-featured-properties-slide">
                                        <a href="#"><img src="img/bg-img/fea-product.jpg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Copywrite Text -->
            <div class="copywrite-text d-flex align-items-center justify-content-center">
                <p> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </div>
        </footer>
        <!-- ##### Footer Area End ##### -->

        <!-- jQuery (Necessary for All JavaScript Plugins) -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <script src="js/classy-nav.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

    </body>

</html>