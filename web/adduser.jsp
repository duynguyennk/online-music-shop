<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

<%@page import="Entity.Question"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    HashMap<Integer, Question> hmQues = cdb.getAllQues();
    String type = request.getParameter("type");
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
    int questionId = 0;
    String answer = "";
    int userRole = 0;
    if (id != "" && type != null && type.equals("1")) {
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
            questionId = user.getQuestionId();
            answer = user.getAnswer();
        }
    }
%>

<section class="section login-page">
    <div class="login container">
        <jsp:include page="listManagement.jsp"></jsp:include>
            <div class="right">
                <p style="color: red">${messageAddUser}</p>
            <form action="addUser?type=<%=type%>" method="post">
                <table>
                    <c:if test="<%=!(type.equals("1"))%>">
                        <tr>
                            <td>Username:</td><td><input type="text" name="user" value="<%=userId%>" style="width: 200px;" required></td>
                        </tr>
                    </c:if>
                    <c:if test="<%=type.equals("1")%>">
                        <tr>
                            <td>Username:</td><td><input type="text" name="user" value="<%=userId%>" style="width: 200px;background-color: gainsboro;" required readonly></td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>Password:</td><td><input type="password" name="pass" value="<%=pass%>" style="width: 200px;" required
                                                     pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                     title="Must contain at least one number and one uppercase and lowercase letter,
                                                     and at least 8 or more characters"></td>
                    </tr>
                    <tr>
                        <td>Re-Password:</td><td><input type="password" name="repass" value="<%=pass%>" style="width: 200px;" required </td>
                    </tr>
                    <tr>
                        <td>Full Name:</td><td><input type="text" name="name" value="<%=name%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <input type="radio" name="gender" value="male" <%=gender ? "checked" : ""%>> Male
                            <input type="radio" name="gender" value="female" <%=gender ? "" : "checked"%>> Female
                        </td>
                    </tr>
                    <tr>
                        <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            String currDate = sdf.format(new Date());%>
                        <td>Date of birth:</td><td><input max="<%=currDate%>" type="date" name="dob" value="<%=dob%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Address:</td><td><input type="text" name="address" value="<%=address%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Email:</td><td><input type="email" name="email" value="<%=email%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Phone Number:</td><td><input type="text" name="phoneNumber" value="<%=phoneNumber%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>User Roll:</td>
                        <td>
                            <select id="test" name="userRoll" onchange="showDiv(this)">
                                <option value="0" <%=userRole == 0 ? "selected" : ""%>>Admin</option>
                                <option value="1" <%=userRole == 1 ? "selected" : ""%>>User</option>
                                <option value="2" <%=userRole == 2 ? "selected" : ""%>>Seller</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <c:if test="<%=!(type.equals("1"))%>">    
                    <table>
                        <tbody id="hidden_div" style="display: none;" onchange="showDiv(this)">
                            <tr>
                                <td>Security Question:</td>
                                <td>
                                    <select  name="questionId" >
                                        <% for (Map.Entry<Integer, Question> en : hmQues.entrySet()) {
                                                Integer key = en.getKey();
                                                Question val = en.getValue();%>
                                        <option value="<%=key%>"><%=val.getQuestionDetail()%></option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Answer:</td>
                                <td><input style="width: 200px;" type="text" name="answer" value=""></td>
                            </tr>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="<%=type.equals("1")%>">
                    <table>
                        <tr style="display: none;">
                            <td>Security Question:</td>
                            <td>
                                <select name="questionId">
                                    <% for (Map.Entry<Integer, Question> en : hmQues.entrySet()) {
                                            Integer key = en.getKey();
                                            Question val = en.getValue();%>
                                    <option value="<%=key%>" <%=key == questionId ? "selected" : ""%>><%=val.getQuestionDetail()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td>Answer:</td>
                            <td><input style="width: 200px;" type="text" name="answer" value="<%=answer%>"></td>
                        </tr>
                    </table>
                </c:if>
                <input style="width: 100px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" type="submit" value="Submit" style="width: 100px;"></td>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>
<script type="text/javascript">
    function showDiv(select) {
        if (select.value == 2 || select.value == 1) {
            document.getElementById('hidden_div').style.display = "block";
        } else {
            document.getElementById('hidden_div').style.display = "none";
        }
    }
</script>