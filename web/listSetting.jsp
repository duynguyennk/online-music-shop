<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left">
    <ul class="login-list">
        <li><a href="editUserInfo.jsp?id=${sessionScope.user.userId}">Edit Info</a></li>
        <li><a href="changePassword.jsp?id=${sessionScope.user.userId}">Change password</a></li>
    </ul>
</div>