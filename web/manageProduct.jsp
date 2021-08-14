<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Product"%>
<%@page import="java.util.Map"%>
<%@page import="DAO.ConnectDB"%>
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
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Discount</th>
                        <th>Detail</th>
                        <th>Artist</th>
                        <th>Year</th>
                        <th>Quantity</th>
                        <th>Category</th>
                    </tr>

                <%
                    ConnectDB cdb = new ConnectDB();
                    HttpSession ses = request.getSession();
                    if (ses.getAttribute("allProduct") == null || ses.getAttribute("backUpIdProduct") == null) {
                        cdb.getAllProduct();
                        ses.setAttribute("allProduct", cdb.getHmProduct());
                        ses.setAttribute("backUpIdProduct", cdb.getBackUpIdProduct());
                    } else {
                        cdb.setHmProduct((HashMap<String, Product>) ses.getAttribute("allProduct"));
                        cdb.setBackUpIdProduct((HashSet<String>) ses.getAttribute("backUpIdProduct"));
                    }
                    cdb.getAllCategory();
                    for (Map.Entry<String, Product> en : cdb.getHmProduct().entrySet()) {
                        String key = en.getKey();
                        Product val = en.getValue();
                        String cateName = cdb.getHmCategory().get(val.getCateId()).getCateName();%>
                <tr><%=val.outProductTable(cateName)%>
                    <td><a href="addproduct.jsp?id=<%=key%>&typeP=1">Edit</a></td>
                    <td><a href="deleteProduct?id=<%=key%>">Delete</a></td>
                </tr>
                <%}%>


            </table>
            <a href="putProduct" style="background: var(--primary);padding: 0.8rem 4rem;color: var(--white);border-radius: 3rem;">Synchronize into database</a>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>
