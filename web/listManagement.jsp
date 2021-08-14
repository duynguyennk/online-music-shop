<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left">
    <ul class="login-list">
        <c:if test="${sessionScope.user.userRole == 0}">
            <li><a href="adduser.jsp?type=0">Add user</a></li>
            <li><a href="manageUser">Manage users</a></li>
        </c:if>
            <li><a href="addproduct.jsp?typeP=0">Add product</a></li>
        <li><a href="manageProduct.jsp">Manage products</a></li>
        <li><a href="manageStock.jsp">Manage stock</a></li>
    </ul>
</div>