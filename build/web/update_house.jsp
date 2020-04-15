<%-- 
    Document   : update_house
    Created on : Dec 12, 2019, 9:53:47 AM
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
        <title>Update House</title>
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
        <c:if test="${requestScope.LIST_CITIES==null || requestScope.LIST_CATAGORIES==null}">
            <% request.getRequestDispatcher("CreateDataToUpdateHouse").forward(request, response);%>
        </c:if>
        <div class="container" style="margin-top: 100px" >
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="MainController" method="post">
                            <h3 class="text-center text-info">UPDATE HOUSE</h3>
                            <div class="form-group">
                                <label for="houseID" class="text-info">House ID:</label><br>
                                <input type="text" name="houseID"  class="form-control" required="" value="${requestScope.HOUSE.houseID}" readonly="">
                                <div class="bg-danger">
                                    ${requestScope.HOUSEID_ERROR}
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="title" class="text-info">Title: </label><br>
                                <input type="text" name="title"  class="form-control" required="" value="${requestScope.HOUSE.title}">
                                <div class="bg-danger">
                                    ${requestScope.HOUSETITLE_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="title" class="text-info">Content: </label><br>
                                <textarea class="form-control" required="" rows="5" maxlength="2000" name="content">
                                    ${requestScope.HOUSE.content}
                                </textarea>

                                <div class="bg-danger">
                                    ${requestScope.HOUSECONTENT_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="price" class="text-info">Price: </label><br>
                                <input type="number" name="price"  class="form-control" required="" value="${requestScope.HOUSE.price}">
                                <div class="bg-danger">
                                    ${requestScope.PRICE_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="area" class="text-info">Area:</label><br>
                                <input type="number" name="area"  class="form-control" required="" value="${requestScope.HOUSE.area}">
                                <div class="bg-danger">
                                    ${requestScope.AREA_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bedroom" class="text-info">Bedroom:</label><br>
                                <input type="number" name="bedroom"  class="form-control" required="" value="${requestScope.HOUSE.bedroom}">
                                <div class="bg-danger">
                                    ${requestScope.BEDROOM_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bathroom" class="text-info">Bathroom:</label><br>
                                <input type="number" name="bathroom"  class="form-control" required="" value="${requestScope.HOUSE.bathroom}">
                                <div class="bg-danger">
                                    ${requestScope.BATHROOM_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="text-info">City ID:</label><br>

                                <c:if test="${requestScope.LIST_CITIES!=null}">
                                    <select name="citiesID">
                                        <c:forEach var="list" varStatus="count" items="${requestScope.LIST_CITIES}">
                                            <c:if test="${list.id==requestScope.HOUSE.citiesID}">
                                                <option value="${list.id}" selected="selected">${list.name}</option>
                                            </c:if>
                                            <c:if test="${list.id!=requestScope.HOUSE.citiesID}">
                                                <option value="${list.id}">${list.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </c:if>
                                <div class="bg-danger">
                                    ${requestScope.CITIESID_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="text-info">Catagories:</label><br>

                                <c:if test="${requestScope.LIST_CATAGORIES!=null}">
                                    <select name="catagories">
                                        <c:forEach var="listCata" varStatus="count" items="${requestScope.LIST_CATAGORIES}">
                                            <c:if test="${listCata.name==requestScope.HOUSE.catagories}">
                                                <option value="${listCata.name}" selected="selected">${listCata.name}</option>
                                            </c:if>
                                            <c:if test="${listCata.name!=requestScope.HOUSE.catagories}">
                                                <option value="${listCata.name}">${listCata.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </c:if>
                                <div class="bg-danger">
                                    ${requestScope.CATAGORIES_ERROR}
                                </div>
                            </div>   
                            <div class="form-group">
                                <label for="state" class="text-info">State:</label><br>
                                <select name="state">
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </select>
                                
                                <div class="bg-danger">
                                    ${requestScope.STATE_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="picture" class="text-info">Picture:</label><br>
                                <input type="file" name="picture"  class="form-control" required="" value="${requestScope.HOUSE.picture}">

                                <div class="bg-danger">
                                    ${requestScope.PICTURE_ERROR}
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="action" class="btn btn-info btn-md" value="Update this house">
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

