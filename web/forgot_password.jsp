<%-- 
    Document   : forgot_password
    Created on : Dec 17, 2019, 1:08:03 PM
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
                            <h3 class="text-center text-info">Forgot password</h3>
                            <div class="form-group">
                                <label for="email" class="text-info">Your email:</label><br>
                                <input type="email" name="email" id="email" class="form-control" required="">
                            </div>
                            <input type="submit" name="action" value="Get Password"/>
                            <div class="bg-success">
                                ${requestScope.MESSAGE}
                            </div>
                        </form>
                        <div id="register-link" class="text-right">
                            <c:url var="homeLink"  value="MainController">
                                <c:param name="action" value="Home"></c:param>
                            </c:url>
                            <a href="${homeLink}" class="text-info">Go Home</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>