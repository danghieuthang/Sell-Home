<%-- 
    Document   : header
    Created on : Dec 13, 2019, 7:28:58 PM
    Author     : dhtha
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header-area">
    <!-- Top Header Area -->
    <div class="top-header-area">
        <div class="h-100 d-md-flex justify-content-between align-items-center">
            <div class="email-address">
                <a href="mailto:contact@southtemplate.com">contact@southtemplate.com</a>
            </div>
            <div class="phone-number d-flex">
                <div class="icon">
                    <img src="img/icons/avatar.png" alt="">
                </div>
                <div class="number">
                    <c:if test="${sessionScope.USER!=null}">
                        <c:url var="useProfileLink" value="MainController">
                            <c:param name="action" value="User Profile"></c:param>
                        </c:url>
                        <a href="${useProfileLink}">${sessionScope.USER.userName}</a>
                    </c:if>
                    <c:if test="${sessionScope.USER==null}">
                        <c:url var="loginLink" value="MainController">
                            <c:param name="action" value="Login Page"></c:param>
                        </c:url>
                        <a href="${loginLink}">${sessionScope.USER.userName}</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Header Area -->
    <div class="main-header-area" id="stickyHeader">
        <div class="classy-nav-container breakpoint-off">
            <!-- Classy Menu -->
            <nav class="classy-navbar justify-content-between" id="southNav">
                <c:url var="homeLink" value="MainController">
                    <c:param name="action" value="Home"></c:param>
                </c:url>
                <c:url var="contactLink" value="MainController">
                    <c:param name="action" value="Contact"></c:param>
                </c:url>
                <c:url var="aboutUsLink" value="MainController">
                    <c:param name="action" value="About Us"></c:param>
                </c:url>
                <!-- Logo -->
                <a class="nav-brand" href="${homeLink}"><img src="img/core-img/logo.png" alt="" ></a>

                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>

                <!-- Menu -->
                <div class="classy-menu">

                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>

                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="${homeLink}">Home</a></li>
                            <li><a href="${aboutUsLink}">About Us</a></li>
                            <li><a href="${contactLink}">Contact</a></li>
                                <c:url var="historyLink" value="MainController">
                                    <c:param name="action" value="History" ></c:param>
                                </c:url>
                                <c:url var="viewLinkOrder" value="MainController">
                                    <c:param name="action" value="View Order"></c:param>
                                </c:url>
                            <li><a href="${viewLinkOrder}">Order</a></li>
                            <li><a href="${historyLink}">History</a></li>
                                <c:if test="${sessionScope.USER.roleID=='admin'}">
                                <li>
                                    <a href="admin.jsp">Manager</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.USER!=null}">
                                <li>
                                    <c:url var="logoutLink" value="MainController">
                                        <c:param name="action" value="Logout"></c:param>
                                    </c:url>
                                    <a href="${logoutLink}">Logout</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.USER==null}">
                                <li>
                                    <c:url var="loginLink" value="MainController">
                                        <c:param name="action" value="Login Page"></c:param>
                                    </c:url>
                                    <a href="${loginLink}">Login</a>
                                </li>
                            </c:if>

                        </ul>

                    </div>
                    <!-- Nav End -->
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->