<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />


    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="css/styles.css" />
    <title>Cd/Dvd Shop</title>
</head>
<!-- Navigation -->
<nav class="nav">
    <div class="wrapper container">
        <div class="logo"><a href="home">MUSIC SHOP</a></div>
        <ul>
            <li><a href="home">Back to Home</a></li>
        </ul>
    </div>
</nav>

<section class="section login-page">
    <div class="login container">
        <jsp:include page="listManagement.jsp"></jsp:include>
        <div class="right">
            <table id="mydata">
                <tr>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Date of birth</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>User Role</th>
                </tr>
            <c:forEach items="${sessionScope.allUser}" var="entry">
                <tr>
                    <td>${entry.value.userId}</td>
                    <td>${entry.value.pass}</td>
                    <td>${entry.value.name}</td>
                    <td>${entry.value.gender}</td>
                    <td>${entry.value.dob}</td>
                    <td>${entry.value.address}</td>
                    <td>${entry.value.email}</td>
                    <td>${entry.value.phoneNumber}</td>
                    <td>${entry.value.userRole}</td>
                    <td><a href="adduser.jsp?id=${entry.key}&type=1">Edit</a></td>
                    <td><a href="deleteUser?id=${entry.key}">Delete</a></td>
                </tr>
            </c:forEach>
            </table>
            <a href="putUser" style="background: var(--primary);padding: 0.8rem 4rem;color: var(--white);border-radius: 3rem;">Synchronize into database</a>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>
<script
<script>
    $('#mydata').dataTable();
</script>
