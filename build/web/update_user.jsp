<%-- 
    Document   : update_user
    Created on : Dec 8, 2019, 11:39:36 PM
    Author     : dhtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update User</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body{
                background-color: window;
            }
        </style>
    </head>

    <body>
        <c:url var="homeLink" value="MainController">
            <c:param name="action" value="Home"></c:param>
        </c:url>
        <c:if test="${sessionScope.USER==null || sessionScope.USER.roleID!='admin'}">
            <c:redirect url="${homeLink}"></c:redirect>
        </c:if>
        <div class="container" style="margin-top: 100px" >
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="MainController" method="post">
                            <h3 class="text-center text-info">UPDATE USER</h3>
                            <div class="form-group">
                                <label for="userID" class="text-info">User ID:</label><br>
                                <input type="text" name="userID"  class="form-control" readonly="" value="${param.userID}">
                                <div class="bg-danger">
                                    ${requestScope.USERID_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="userName" class="text-info">User Name:</label><br>
                                <input type="text" name="userName"  class="form-control" required="" value="${param.userName}">
                                <div class="bg-danger">
                                    ${requestScope.USERNAME_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="text-info">Email:</label><br>
                                <input type="email" name="email"  class="form-control" required="" value="${param.email}">
                                <div class="bg-danger">
                                    ${requestScope.EMAIL_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="text-info">Phone:</label><br>
                                <input type="number" name="phone"  class="form-control" required="" value="${param.phone}">
                                <div class="bg-danger">
                                    ${requestScope.PHONE_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="text-info">Address:</label><br>
                                <input type="text" name="address"  class="form-control" required=""value="${param.address}">
                                <div class="bg-danger">
                                    ${requestScope.ADDRESS_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="userName" class="text-info">Role</label><br>
                                <select name="role">
                                    <option value="admin">Admin</option>
                                    <option value="user">User</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password"  class="form-control" required="">
                                <div class="bg-danger">
                                    ${requestScope.PASSWORD_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="action" class="btn btn-info btn-md" value="Update this user">

                            </div>
                            <div class="bg-danger">
                                ${requestScope.MESSAGE}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
