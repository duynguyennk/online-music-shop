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
        <div class="left">
            <ul class="login-list">
                <li><a href="login.jsp">Login</a></li>
                <li><a href="signup.jsp">Sign up</a></li>
            </ul>
        </div>
        <div class="right">
            <p style="color: red">${messageLogin}</p>
            <form action="login" method="post">
                <table>
                    <tr>
                        <td>Username:</td><td><input type="text" name="user" value="" style="width: 200px;"></td>
                    </tr>
                    <tr>
                        <td>Password:</td><td><input type="password" name="pass" value="" style="width: 200px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input style="width: 100px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" type="submit" value="Login"></td>
                    </tr>
                </table>
                <a href="forgetpass.jsp">Forget password?</a>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>

