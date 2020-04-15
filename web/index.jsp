<%-- 
    Document   : index.jsp
    Created on : Dec 12, 2019, 10:57:05 AM
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
        <title>Home</title>
        <link rel="icon" href="img/core-img/favicon.ico">
        <link rel="stylesheet" href="style.css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"
        type="text/javascript"></script>
        <script src= 
                "https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
        </script> 
    </head>

    <body>

        <div id="preloader">
            <div class="south-load">

            </div>
        </div>
        <c:if test="${requestScope.LIST_CITIES==null || requestScope.LISTHOUSE==null || requestScope.LIST_CATAGORIES==null}">
            <c:url var="getDataLink" value="MainController">
                <c:param name="action" value="Get Data"></c:param> 
            </c:url>
            <c:redirect url="${getDataLink}"></c:redirect>W
        </c:if>
        <%@include file="header.jsp" %>
        <!-- ##### Hero Area Start ##### -->
        <section class="hero-area">
            <div class="hero-slides owl-carousel">
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/hero1.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="hero-slides-content">
                                    <h2 data-animation="fadeInUp" data-delay="100ms">Find your home</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/hero2.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="hero-slides-content">
                                    <h2 data-animation="fadeInUp" data-delay="100ms">Find your dream house</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/hero3.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="hero-slides-content">
                                    <h2 data-animation="fadeInUp" data-delay="100ms">Find your perfect house</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Hero Area End ##### -->

        <!-- ##### Advance Search Area Start ##### -->
        <div class="south-search-area">
            <div class="container">

                <div class="row">
                    <div class="col-12">
                        <div class="advanced-search-form">
                            <!-- Search Title -->
                            <div class="search-title">
                                <p>Search for your home</p>
                            </div>
                            <!-- Search Form -->
                            <form action="MainController" method="post" id="advanceSearch">
                                <div class="row">

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <input type="input" class="form-control" name="Keyword" placeholder="Keyword" value="${requestScope.Keyword}">
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" id="cities" name="citiesID">
                                                <option value="">All Cities</option>
                                                <c:forEach var="listCities" varStatus="count" items="${requestScope.LIST_CITIES}">
                                                    <c:if test="${listCities.id==requestScope.citiesID}">
                                                        <option value="${listCities.id}" selected="selected">${listCities.name}</option>
                                                    </c:if>
                                                    <c:if test="${listCities.id!=requestScope.citiesID}">
                                                        <option value="${listCities.id}">${listCities.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <select class="form-control" id="catagories" name="catagoriesName">
                                                <option value="">All Catagories</option>
                                                <c:forEach var="listCatagories" varStatus="count" items="${requestScope.LIST_CATAGORIES}">
                                                    <c:if test="${listCatagories.name==requestScope.catagoriesName}">
                                                        <option value="${listCatagories.name}" selected="selected">${listCatagories.name}</option>
                                                    </c:if>
                                                    <c:if test="${listCatagories.name!=requestScope.catagoriesName}">
                                                        <option value="${listCatagories.name}">${listCatagories.name}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>



                                    <div class="col-12 col-md-4 col-xl-2">
                                        <div class="form-group">
                                            <select class="form-control" id="bedrooms" name="bedroom">
                                                <option value="">Bedrooms</option>
                                                <c:if test="${requestScope.beds=='1'}">
                                                    <option value="1" selected="">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.beds=='2'}">
                                                    <option value="1" >1</option>
                                                    <option value="2" selected="">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.beds=='3'}">
                                                    <option value="1" >1</option>
                                                    <option value="2">2</option>
                                                    <option value="3" selected="">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.beds=='4'}">
                                                    <option value="1" >1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4" selected="">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.beds=='5+'}">
                                                    <option value="1" >1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+" selected="">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.beds==null || empty requestScope.beds}">
                                                    <option value="1" >1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-xl-2">
                                        <div class="form-group">
                                            <select class="form-control" id="bathrooms" name="bathroom">
                                                <option value="">Bathrooms</option>
                                                <c:if test="${requestScope.baths=='1'}">
                                                    <option value="1" selected="">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.baths=='2'}">
                                                    <option value="1">1</option>
                                                    <option value="2" selected="">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.baths=='3'}">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3" selected="">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.baths=='4'}">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4" selected="">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.baths=='5'}">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+" selected="">5+</option>
                                                </c:if>
                                                <c:if test="${requestScope.baths==null || empty requestScope.baths}">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5+">5+</option>
                                                </c:if>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-8 col-lg-12 col-xl-5 d-flex">
                                        <!-- Space Range -->
                                        <div class="slider-range">
                                            <div data-min="100" data-max="1000" data-unit=" m&sup2;" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="100" data-value-max="1000">
                                                <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                                <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                                <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                            </div>
                                            <div class="range">100 m&sup2; - 1000 m&sup2;</div>

                                        </div>

                                        <!-- price Range -->
                                        <div class="slider-range">
                                            <div data-min="1" data-max="1000" data-unit=" mil &#36" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="1" data-value-max="1000">
                                                <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                                <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                                <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                            </div>
                                            <div class="range" id="priceFromTO">1 &#36; - 1000 &#36;</div>
                                        </div> 
                                    </div> 
                                    <input type="hidden" name="priceSearch" value=${requestScope.priceSearch}"" id="priceSearch"/>
                                    <script type="text/javascript">
                                        $('#priceFromTO').bind('DOMSubtreeModified', function (event) {
                                            var name = $('#priceFromTO').text();
                                            $('#priceSearch').val(name);
                                        });

                                    </script>
                                    <div class="col-12 d-flex justify-content-between align-items-end">
                                        <!-- Submit -->
                                        <div class="form-group mb-0">
                                            <button type="submit" class="btn south-btn" value="Search" name="action">Search</button>
                                        </div>
                                    </div>
                                </div>
                                ${MESSAGESEARCH}
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Advance Search Area End ##### -->

        <!-- ##### Featured Properties Area Start ##### -->
        <section class="featured-properties-area section-padding-100-50">
            <div class="container">

                <div class="row">
                    <div class="col-12">
                        <div class="listings-top-meta d-flex justify-content-between mb-100">
                            <div class="view-area d-flex align-items-center">
                                <span>View as:</span>
                                <div class="grid_view ml-15"><a href="#" class="active"><i class="fa fa-th" aria-hidden="true"></i></a></div>
                                <div class="list_view ml-15"><a href="#"><i class="fa fa-th-list" aria-hidden="true"></i></a></div>
                            </div>
                            <div class="order-by-area d-flex align-items-center">
                                <form action="MainController">
                                    <input type="hidden" name="Keyword" value="${requestScope.Keyword}"/>
                                    <input type="hidden" name="citiesID" value="${requestScope.citiesID}"/>
                                    <input type="hidden" name="catagoriesName" value="${requestScope.catagoriesName}"/>
                                    <input type="hidden" name="bedroom" value="${requestScope.beds}"/>
                                    <input type="hidden" name="bathroom" value="${requestScope.baths}"/>
                                    <div class="form-group mr-3">
                                        <button type="submit" class="btn south-btn" value="Get Data" name="action">Order By</button>
                                    </div>
                                    <select name="orderby" id="sel">
                                        <option selected value="default">Default</option>
                                        <c:if test="${sessionScope.ORDERBY=='newest'}">
                                            <option value="newest" selected="">Newest</option>
                                        </c:if>
                                        <c:if test="${sessionScope.ORDERBY!='newest'}">
                                            <option value="newest" >Newest</option>
                                        </c:if>
                                        <c:if test="${sessionScope.ORDERBY=='price'}">
                                            <option value="price" selected="">Price</option>
                                        </c:if>
                                        <c:if test="${sessionScope.ORDERBY!='price'}">
                                            <option value="price">Price</option>
                                        </c:if>
                                    </select>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">

                </script>
                <div class="row">
                    <c:if test="${requestScope.LISTHOUSE==null || empty requestScope.LISTHOUSE}">
                        <h3 class="text-danger text-center col-12   ">Not found</h3>
                    </c:if>
                    <c:forEach var="listHouse" items="${requestScope.LISTHOUSE}">
                        <!-- Single Featured Property -->
                        <c:url var="singleLink" value="MainController">
                            <c:param name="action" value="View Signle House"></c:param>
                            <c:param name="houseID" value="${listHouse.houseID}"></c:param>
                        </c:url>

                        <div id="${listHouse.houseID}" class="col-12 col-md-6 col-xl-4 house" onclick="var a = '${singleLink}';
                                window.location.href = a;" >
                            <div class="single-featured-property mb-50 wow fadeInUp" data-wow-delay="100ms">
                                <!-- Property Thumbnail -->
                                <div class="property-thumb">
                                    <img src="${listHouse.picture}" alt="">
                                    <div class="tag">
                                        <span>For Sale</span>
                                    </div>
                                    <div class="list-price">
                                        <p>&#36; ${listHouse.price}</p>
                                    </div>
                                </div>
                                <!-- Property Content -->
                                <div class="property-content">
                                    <h5>${listHouse.title}</h5>
                                    <p class="location">
                                        <img src="img/icons/location.png" alt="">
                                        <c:forEach var="listCities" varStatus="count" items="${requestScope.LIST_CITIES}">
                                            <c:if test="${listHouse.citiesID==listCities.id}">
                                                ${listCities.name}
                                            </c:if>
                                        </c:forEach>
                                    <p class="justify-content-end">${listHouse.timePost}</p>
                                    </p>

                                    <p style="width: 100%; height: 100px;overflow: hidden;
                                       text-overflow: ellipsis;">${listHouse.content}</p>
                                    <div class="property-meta-data d-flex align-items-end justify-content-between">
                                        <div class="new-tag">
                                            <img src="img/icons/new.png" alt="">
                                        </div>
                                        <div class="bathroom">
                                            <img src="img/icons/bathtub.png" alt="">
                                            <span>${listHouse.bathroom}</span>
                                        </div>
                                        <div class="garage">
                                            <img src="img/icons/garage.png" alt="">
                                            <span>${listHouse.bedroom}</span>
                                        </div>
                                        <div class="space">
                                            <img src="img/icons/space.png" alt="">
                                            <span>${listHouse.area} m&sup2; </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>


                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="south-pagination d-flex justify-content-end">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link active" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Featured Properties Area End ##### -->

        <!-- ##### Call To Action Area Start ##### -->
        <section class="call-to-action-area bg-fixed bg-overlay-black" style="background-image: url(img/bg-img/cta.jpg)">
            <div class="container h-100">
                <div class="row align-items-center h-100">
                    <div class="col-12">
                        <div class="cta-content text-center">
                            <h2 class="wow fadeInUp" data-wow-delay="300ms">Are you looking for a place to rent?</h2>
                            <h6 class="wow fadeInUp" data-wow-delay="400ms">Suspendisse dictum enim sit amet libero malesuada feugiat.</h6>
                            <a href="#" class="btn south-btn mt-50 wow fadeInUp" data-wow-delay="500ms">Search</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Call To Action Area End ##### -->




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

                                    <li><a href="#">Services</a></li>
                                    <li><a href="#">Properties</a></li>
                                    <li><a href="#">Listings</a></li>
                                    <li><a href="#">Testimonials</a></li>
                                    <li><a href="#">Properties</a></li>
                                    <li><a href="#">Blog</a></li>

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

    </body>

</html>