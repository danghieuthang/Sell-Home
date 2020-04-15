<%-- 
    Document   : admin
    Created on : Dec 5, 2019, 8:44:54 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/admin.css" rel="stylesheet">
    </head>

    <body>
        <c:if test="${sessionScope.USER==null || sessionScope.USER.roleID!='admin'}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <c:if test="${requestScope.LISTUSER == null}">

        </c:if>
        <div class="d-flex" id="wrapper">
            <div class="bg-light border-right border-bottom" id="sidebar-wrapper">
                <div class="sidebar-heading text-center">
                    ${sessionScope.USER.userName}
                </div> 
                <div class="list-group list-group-flush">
                    <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a>
                    <c:url var="managerUser" value="MainController">
                        <c:param name="action" value="ManagerUser"></c:param>
                    </c:url>
                    <c:url var="managerHouse" value="MainController">
                        <c:param name="action" value="ManagerHouse"></c:param>
                    </c:url>
                    <a href="${managerUser}" class="list-group-item list-group-item-action bg-light">Manager Users</a>
                    <a href="${managerHouse}" class="list-group-item list-group-item-action bg-light">Manager House</a>
                </div>
            </div>
            <div id="page-content-wrapper">
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <c:url var="indexLink" value="MainController">
                                    <c:param name="action" value="Home"></c:param>
                                </c:url>
                                <a class="nav-link" href="${indexLink}">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <c:url var="logoutLink" value="MainController">
                                    <c:param name="action" value="Logout"></c:param>
                                </c:url>
                                <a class="nav-link" href="${logoutLink}">Logout</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <c:if test="${requestScope.CURRPAGE=='user'}">
                    <%@include file="manageruser.jsp" %>
                </c:if>
                <c:if test="${requestScope.CURRPAGE=='house'}">
                    <%@include file="managerhouse.jsp" %>
                </c:if>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- Bootstrap core JavaScript -->
        <script src="js/jquery.min.js"></script>
        <!-- Menu Toggle Script -->
    </body>

</html>
