<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

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
        <div class="right">
            <h1>Welcome to order page</h1>
            <table id="mydata">
                <tr>
                    <th>Order Date</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Artist</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <c:forEach items="${listOrder}" var="entry">
                    <tr>
                        <td>${entry.value.date}</td>
                        <td>${entry.value.name}</td>
                        <td><img src="images/${entry.value.imgUrl}"></td>
                        <td>${entry.value.artist}</td>
                        <td>${entry.value.quantity}</td>
                        <td>${entry.value.price}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>