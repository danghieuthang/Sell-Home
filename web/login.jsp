
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
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
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="userID" class="text-info">User ID:</label><br>
                                <input type="text" name="userID" id="username" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <input type="password" name="password" id="password" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <input type="submit" name="action" class="btn btn-info btn-md" value="Login">

                            </div>
                            <div class="bg-danger">
                                ${requestScope.MESSAGE}
                            </div>
                        </form>
                        <div id="register-link" class="text-right">
                            <c:url var="createLink"  value="MainController">
                                <c:param name="action" value="Register"></c:param>
                            </c:url>
                            <a href="${createLink}" class="text-info">Register here</a>
                        </div>
                        <div id="register-link" class="text-right">
                            <c:url var="forgotPasswordLink"  value="MainController">
                                <c:param name="action" value="Forgot Password"></c:param>
                            </c:url>
                            <a href="${forgotPasswordLink}" class="text-info">Forgot password</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>