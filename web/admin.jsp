<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

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
    <title>Codevo - Ecommerce Website</title>
</head>
<!-- Navigation -->
<nav class="nav">
    <div class="wrapper container">
        <div class="logo"><a href="home">MUSIC SHOP</a></div>
        <ul class="nav-list">
            <li><a href="home">Back to Home</a></li>
        </ul>
    </div>
</nav>


<section class="section login-page">
    <div class="login container">
        <div class="left">
            <ul class="login-list">
                <li><a href="login.jsp">Login</a></li>
                <li><a href="signup.jsp">Sign up</a></li>
            </ul>
        </div>
        <div class="right">
            <p>Ben phai</p>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>

