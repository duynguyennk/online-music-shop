<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Question"%>
<%@page import="DAO.ConnectDB"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <ul class="nav-list">
            <li><a href="home">Back to Home</a></li>
        </ul>
    </div>
</nav>

<%
    ConnectDB cdb = new ConnectDB();
    HashMap<Integer, Question> hmQues = cdb.getAllQues();
%>
<section class="section login-page">
    <div class="login container">
        <div class="left">
            <ul class="login-list">
                <li><a href="login.jsp">Login</a></li>
                <li><a href="signup.jsp">Sign up</a></li>
            </ul>
        </div>
        <div class="right">
            <p style="color: red">${messageSignUp}</p>
            <form action="signup" method="post">
                <table>
                    <tr>
                        <td>Username:</td><td><input type="text" name="user" value="" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Password:</td><td><input type="password" name="pass" value="" style="width: 200px;" required
                                                     pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                     title="Must contain at least one number and one uppercase and lowercase letter,
                                                     and at least 8 or more characters"></td>
                    </tr>
                    <tr>
                        <td>Re-Password:</td><td><input type="password" name="repass" value="" style="width: 200px;" required </td>
                    </tr>
                    <tr>
                        <td>Full Name:</td><td><input type="text" name="name" value="" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <input type="radio" name="gender" value="male" checked> Male
                            <input type="radio" name="gender" value="female"> Female
                        </td>
                    </tr>
                    <tr>
                        <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            String currDate = sdf.format(new Date());%>
                        <td>Date of birth:</td><td><input max="<%=currDate%>" type="date" name="dob" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Address:</td><td><input type="text" name="address" value="" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Email:</td><td><input type="email" name="email" value="" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Phone Number:</td><td><input type="text" name="phoneNumber" value="" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Security Question:</td>
                        <td>
                            <select name="questionId">
                                <% for (Map.Entry<Integer, Question> en : hmQues.entrySet()) {
                                        Integer key = en.getKey();
                                        Question val = en.getValue(); %>
                                        <option value="<%=key%>"><%=val.getQuestionDetail()%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><input style="width: 200px;" type="text" name="answer" value="" required=""></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input style="width: 100px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" type="submit" value="Sign Up" style="width: 100px;"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>

