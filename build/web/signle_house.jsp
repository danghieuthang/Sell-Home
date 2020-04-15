<%-- 
    Document   : signle_house
    Created on : Dec 13, 2019, 5:41:33 PM
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
        <title>${requestScope.HOUSE.title}</title>
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
        <!-- ##### Header Area Start ##### -->
        <%@include file="header.jsp" %>
        <c:if test="${requestScope.HOUSE==null}">
            <c:url var="homeLink" value="MainController">
                <c:param name="action" value="Home"></c:param>
            </c:url>
            <c:redirect url="${homeLink}"></c:redirect>
        </c:if>
        <!-- ##### Breadcumb Area Start ##### -->
        <section class="breadcumb-area bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <div class="breadcumb-content">
                            <h3 class="breadcumb-title">${requestScope.HOUSE.title}</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Breadcumb Area End ##### -->


        <!-- ##### Listings Content Area Start ##### -->
        <section class="listings-content-wrapper section-padding-100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Single Listings Slides -->
                        <div class="single-listings-sliders owl-carousel">
                            <!-- Single Slide -->
                            <img src="${requestScope.HOUSE.picture}" alt="">
                            <!-- Single Slide -->

                            <img src="${requestScope.HOUSE.picture}" alt=""> 
                        </div>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-12 col-lg-8">
                        <div class="listings-content">
                            <!-- Price -->
                            <div class="list-price">
                                <p>$${requestScope.HOUSE.price}</p>
                            </div>
                            <h5>${requestScope.HOUSE.title}</h5>
                            <p class="location"><img src="img/icons/location.png" alt="">${requestScope.citiesName}</p>
                            <p>${requestScope.HOUSE.content}</p>
                            <!-- Meta -->
                            <div class="property-meta-data d-flex align-items-end">
                                <div class="new-tag">
                                    <img src="img/icons/new.png" alt="">
                                </div>
                                <div class="bathroom">
                                    <img src="img/icons/bathtub.png" alt="">
                                    <span>${requestScope.HOUSE.bathroom}</span>
                                </div>
                                <div class="garage">
                                    <img src="img/icons/garage.png" alt="">
                                    <span>${requestScope.HOUSE.bedroom}</span>
                                </div>
                                <div class="space">
                                    <img src="img/icons/space.png" alt="">
                                    <span>${requestScope.HOUSE.area} m&sup2;</span>
                                </div>
                            </div>
                            <!-- Core Features -->
                            <ul class="listings-core-features d-flex align-items-center">
                                <li><i class="fa fa-check" aria-hidden="true"></i> Gated Community</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Automatic Sprinklers</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Fireplace</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Window Shutters</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Ocean Views</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Heated Floors</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Heated Floors</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Private Patio</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Window Shutters</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Fireplace</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Beach Access</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Rooftop Terrace</li>
                            </ul>
                            <!-- Listings Btn Groups -->
                            ${requestScope.view}
                            <c:if test="${requestScope.CANBUY==null}">
                                <div class="listings-btn-groups">
                                    <c:url var="buyLink" value="MainController">
                                        <c:param name="action" value="Buy House"></c:param>
                                        <c:param name="houseID" value="${requestScope.HOUSE.houseID}"></c:param>
                                    </c:url>
                                    <a href="${buyLink}" class="btn south-btn">Buy</a>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.CANBUY!=null}">
                                <h3 class="text-center text-danger">You already bought</h3>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="contact-realtor-wrapper">
                            <div class="realtor-info">
                                <img src="img/bg-img/listing.jpg" alt="">
                                <div class="realtor---info">
                                    <h2>Jeremy Scott</h2>
                                    <p>Realtor</p>
                                    <h6><img src="img/icons/phone-call.png" alt=""> +45 677 8993000 223</h6>
                                    <h6><img src="img/icons/envelope.png" alt=""> office@template.com</h6>
                                </div>
                                <div class="realtor--contact-form">
                                    <form action="#" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="realtor-name" placeholder="Your Name">
                                        </div>
                                        <div class="form-group">
                                            <input type="number" class="form-control" id="realtor-number" placeholder="Your Number">
                                        </div>
                                        <div class="form-group">
                                            <input type="enumber" class="form-control" id="realtor-email" placeholder="Your Mail">
                                        </div>
                                        <div class="form-group">
                                            <textarea name="message" class="form-control" id="realtor-message" cols="30" rows="10" placeholder="Your Message"></textarea>
                                        </div>
                                        <button type="submit" class="btn south-btn">Send Message</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Listing Maps -->
                <div class="row">
                    <div class="col-12">
                        <div class="listings-maps mt-100">
                            <div id="googleMap"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Listings Content Area End ##### -->

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
                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
        <!-- Google Maps -->
        <script src="js/map-active.js"></script>

    </body>

</html>