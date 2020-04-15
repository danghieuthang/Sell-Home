<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <form action="MainController" method="GET" class="" style="margin:30px;">
        State <select name="stateSearch">
            <option value="">All</option>
            <c:if test="${requestScope.stateSearch=='1'}">
                <option value="1" selected="">True</option>
                <option value="0">False</option>
            </c:if>
            <c:if test="${requestScope.stateSearch=='0'}">
                <option value="1">True</option>
                <option value="0" selected="">False</option>
            </c:if>
            <c:if test="${requestScope.stateSearch==null ||empty requestScope.stateSearch }">
                <option value="1">True</option>
                <option value="0">False</option>
            </c:if>
        </select>
        <input type="text" name="titleSearch" placeholder="Enter title search" value="${requestScope.titleSearch}                                "/>
        <input type="submit" name="action" value="Search House" class="bg-primary"/>
        <input type="submit" name="action" value="Create House" class="bg-primary"/>
    </form>
    <div class="text-center text-info">${requestScope.MESSAGE}</div>
    <c:if test="${requestScope.LISTHOUSE!=null || empty requestScope.LISTHOUSE}">
        <c:if test="${empty requestScope.LISTHOUSE}">
            <div class="text-info text-danger text-center" style="margin:50px">
                <h1>Not found</h1>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.LISTHOUSE}">
            <div class="justify-content-center">
                <table class="table table-bordered table-responsive-lg tablesorted" id="myTable">
                    <thead class="thead-light">
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Price</th>
                            <th>Area</th>
                            <th>City</th>
                            <th>Catagories</th>
                            <th>Time Create</th>
                            <th>State</th>
                            <th>Picture</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" varStatus="counter" items="${requestScope.LISTHOUSE}">
                            <tr>
                                <th>${counter.count}</th>
                                <td>
                                    ${list.houseID}
                                </td>
                                <td>
                                    ${list.price} &#36;                                           
                                </td>
                                <td>
                                    ${list.area} m&sup2;                                         
                                </td>
                                <td>
                                    <c:forEach var="listcities" items="${requestScope.LIST_CITIES}">
                                        <c:if  test="${listcities.id==list.citiesID}">
                                            ${listcities.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    ${list.catagories}
                                </td>
                                <td>
                                    ${list.timePost}
                                </td>
                                <td>
                                    ${list.state}
                                </td>

                                <td><img src="${list.picture}" width="100px" height="50px"/></td>
                                <td>
                                    <c:url var="deleteHouse"  value="MainController" >
                                        <c:param name="houseID" value="${list.houseID}"></c:param>
                                        <c:param name="search" value="${SEARCH_VALUE}"></c:param>
                                        <c:param name="action" value="Delete House"></c:param>
                                    </c:url>
                                    <a href="${deleteHouse}" class="text-danger">Delete</a>
                                </td>
                                <td>
                                    <c:url var="updateHouse" value="MainController">
                                        <c:param name="action" value="Update House"></c:param>
                                        <c:param name="houseID" value="${list.houseID}"></c:param>
                                    </c:url>
                                    <a href="${updateHouse}">Update</a>
                                </td>
                            </tr>           
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </c:if>

    <ul class="pagination pagination-sm justify-content-center">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul> 
    <%--
    <div id="pager" class="pager" align="center">
        <form>
            <input type="button" value="<<" class="first"/>
            <input type="button" value="<" class="prev">
            <input type="text" class="pagedisplay"/>
            <input type="button" value=">" class="next"/>
            <input type="button" value=">>" class="last">
            <select class="pagesize">
                <option value="2">2</option>
                <option value="5" selected="selected">5</option>
                <option value="10">10</option>
                <option value="20">20</option>
            </select>
        </form>
    </div>
    <script type="text/javascript">
        jQuery()(document).ready(function (){
            $("#myTable")
                    .tablesorter({debug:false, widgets:['zebra'], sortList:[[0,0]]})
                    .tablesorterPager({container: $("#pager")})
                    .tablesortFilter({filterContainer: $("#filter-box"),
                          filterClearContainer: $("#filter-clear-button"),
                          filterColumns:[0],
                          filterCaseSensitive: false});
        } );
           
    </script> --%>
</div> 