<div class="container">
    <form action="MainController" method="GET" class="" style="margin:30px;">
        <input type="text" name="search" placeholder="Enter name search" class="" value="${requestScope.SEARCHNAME_VALUE}"/>
        <input type="submit" name="action" value="Search User" class="bg-primary"/>
        <input type="submit" name="action" value="Create User" class="bg-primary"/>
    </form>
    <div class="text-center text-info">${requestScope.MESSAGE}</div>
    <c:if test="${requestScope.LISTUSER!=null}">
        <c:if test="${empty requestScope.LISTUSER}">
            <div class="text-info text-danger text-center" style="margin:50px">
                <h1>Not found</h1>
            </div>
        </c:if>
        <c:if test="${not empty requestScope.LISTUSER}">
            <div class="justify-content-center">
                <table class="table table-bordered table-responsive-lg">
                    <thead class="thead-light">
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" varStatus="counter" items="${requestScope.LISTUSER}">
                        <tr>
                            <th>${counter.count}</th>
                            <td>
                                ${list.userID}
                            </td>
                            <td>
                                ${list.userName}
                            </td>
                            <td>
                                ${list.email}                                               
                            </td>
                            <td>
                                ${list.phone}                                            
                            </td>

                            <td>
                                ${list.address}
                            </td>
                            <td>
                                ${list.roleID}
                            </td>
                            <td>
                        <c:url var="deleteUser"  value="MainController" >
                            <c:param name="userID" value="${list.userID}"></c:param>
                            <c:param name="search" value="${SEARCH_VALUE}"></c:param>
                            <c:param name="action" value="Delete User"></c:param>
                        </c:url>
                        <a href="${deleteUser}" class="text-danger">Delete</a>
                        </td>
                        <td>
                        <c:url var="updateUser" value="MainController">
                            <c:param name="userID" value="${list.userID}"></c:param>
                            <c:param name="userName" value="${list.userName}"></c:param>
                            <c:param name="password" value="${list.password}"></c:param>
                            <c:param name="email" value="${list.email}"></c:param>
                            <c:param name="phone" value="${list.phone}"></c:param>
                            <c:param name="address" value="${list.address}"></c:param>        
                            <c:param name="action" value="Update User"></c:param>
                        </c:url>
                        <a href="${updateUser}">Update</a>
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
</div> 