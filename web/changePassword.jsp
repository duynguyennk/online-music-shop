<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.ConnectDB"%>
<%@page import="Entity.User"%>
<%@page import="java.util.HashMap"%>
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

<%
    String id = request.getParameter("id");
    ConnectDB cdb = new ConnectDB();
    HttpSession ses = request.getSession();
    if (ses.getAttribute("allUser") == null) {
        cdb.getAllUser();
        ses.setAttribute("allUser", cdb.getHmUser());
    } else {
        cdb.setHmUser((HashMap<String, User>) ses.getAttribute("allUser"));
    }
    String userId = "";
    String pass = "";
    String name = "";
    boolean gender = true;
    String dob = "";
    String address = "";
    String email = "";
    String phoneNumber = "";
    int userRole = 1;
    if (id != "") {
        if (cdb.getHmUser().containsKey(id)) {
            User user = cdb.getHmUser().get(id);
            userId = user.getUserId();
            pass = user.getPass();
            name = user.getName();
            gender = user.isGender();
            dob = user.getDob();
            address = user.getAddress();
            email = user.getEmail();
            phoneNumber = user.getPhoneNumber();
            userRole = user.getUserRole();
        }
    }
%>

<section class="section login-page">
    <div class="login container">
        <jsp:include page="listSetting.jsp"></jsp:include>
            <div class="right">
                <p style="color: red">${messageAddUser}</p>
            <form action="addUser?type=3" method="post">
                <table>
                    <tr  style="display: none;">
                        <td>Username:</td><td><input type="text" name="user" value="<%=userId%>" style="width: 200px;background-color: gainsboro;" required readonly></td>
                    </tr>
                    <tr  style="display: none;">
                        <td>Password:</td><td><input type="password" name="pass" value="<%=pass%>" style="width: 200px;" required
                                                     pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                     title="Must contain at least one number and one uppercase and lowercase letter,
                                                     and at least 8 or more characters"></td>
                    </tr>
                    <tr>
                        <td>Old Password:</td><td><input type="password" name="oldPass" value="" style="width: 200px;" required
                                                         pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                         title="Must contain at least one number and one uppercase and lowercase letter,
                                                         and at least 8 or more characters"></td>
                    </tr>
                    <tr>
                        <td>New Password:</td><td><input type="password" name="newPass" value="" style="width: 200px;" required
                                                         pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                         title="Must contain at least one number and one uppercase and lowercase letter,
                                                         and at least 8 or more characters"></td>
                    </tr>
                    <tr >
                        <td>Re-Password:</td><td><input type="password" name="rePass" value="" style="width: 200px;" required </td>
                    </tr>

                    <tr style="display: none;">
                        <td>Full Name:</td><td><input type="text" name="name" value="<%=name%>" style="width: 200px;" required></td>
                    </tr>
                    <tr style="display: none;">
                        <td>Gender:</td>
                        <td>
                            <input type="radio" name="gender" value="male" <%=gender ? "checked" : ""%>> Male
                            <input type="radio" name="gender" value="female" <%=gender ? "" : "checked"%>> Female
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td>Date of birth:</td><td><input type="date" name="dob" value="<%=dob%>" style="width: 200px;" required></td>
                    </tr>
                    <tr style="display: none;">
                        <td>Address:</td><td><input type="text" name="address" value="<%=address%>" style="width: 200px;" required></td>
                    </tr>
                    <tr style="display: none;">
                        <td>Email:</td><td><input type="email" name="email" value="<%=email%>" style="width: 200px;" required></td>
                    </tr>
                    <tr style="display: none;">
                        <td>Phone Number:</td><td><input type="text" name="phoneNumber" value="<%=phoneNumber%>" style="width: 200px;" required></td>
                    </tr>

                    <tr  style="display: none;">
                        <td>User Roll:</td>
                        <td>
                            <select name="userRoll">
                                <option value="0" <%=userRole == 0 ? "selected" : ""%> >Admin</option>
                                <option value="1" <%=userRole == 1 ? "selected" : ""%>>User</option>
                                <option value="2" <%=userRole == 2 ? "selected" : ""%>>Seller</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2"><input style="width: 100px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" type="submit" value="Submit" style="width: 100px;"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>
