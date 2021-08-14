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
                <h1>Welcome to stock page</h1>
                <h2 style="color: red">${message}</h2>
            <form action="manageStock" method="post">
                <table>
                    <tr>
                        <td>Product ID:</td>
                        <td><input type="number" name="productId" min="0" value="0"></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="number" name="quantity" min="0" value="0"></td>
                    </tr>
                    <tr>
                        <td><input style="width: 100px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" type="submit" name="submit"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>
