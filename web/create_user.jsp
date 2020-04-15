<%-- 
    Document   : create_user
    Created on : Dec 8, 2019, 10:17:04 PM
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

        <title>Create User</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
            body{
                background-color: window;
            }
        </style>
    </head>

    <body>

        <div class="container" style="margin-top: 100px" >
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="MainController" method="post">
                            <h3 class="text-center text-info">CREATE USER</h3>
                            <div class="form-group">
                                <label for="userID" class="text-info">User ID:</label><br>
                                <input type="text" name="userID"  class="form-control" required="" value="${requestScope.USER.userID}">
                                <div class="bg-danger">
                                    ${requestScope.USERID_ERROR}
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="userName" class="text-info">User Name:</label><br>
                                <input type="text" name="userName"  class="form-control" required="" value="${requestScope.USER.userName}">
                                <div class="bg-danger">
                                    ${requestScope.USERNAME_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="text-info">Email:</label><br>
                                <input type="email" name="email"  class="form-control" required="" value="${requestScope.USER.email}">
                                <div class="bg-danger">
                                    ${requestScope.EMAIL_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="text-info">Phone:</label><br>
                                <input type="number" name="phone"  class="form-control" required="" value="${requestScope.USER.phone}">
                                <div class="bg-danger">
                                    ${requestScope.PHONE_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="text-info">Address:</label><br>
                                <input type="text" name="address"  class="form-control" required=""value="${requestScope.USER.address}">
                                <div class="bg-danger">
                                    ${requestScope.ADDRESS_ERROR}
                                </div>
                            </div>
                            <c:if test="${sessionScope.USER.roleID=='admin'}">
                                <div class="form-group">
                                    <label for="userName" class="text-info">Role</label><br>
                                    <select name="role">
                                        <option value="admin">Admin</option>
                                        <option value="user">User</option>
                                    </select>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.USER.roleID!='admin'}">
                                <input name="role" value="user" type="hidden"/>
                            </c:if>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password"  class="form-control" required="">
                                <div class="bg-danger">
                                    ${requestScope.PASSWORD_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="rePassword" class="text-info">RePassword:</label><br>
                                <input type="password" name="rePassword"  class="form-control" required="">
                                <div class="bg-danger">
                                    ${requestScope.REPASSWORD_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                
                                <button type="submit" name="action" value="Create_User" class="btn btn-info btn-md">Create User</button>
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
