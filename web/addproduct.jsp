<%-- 
    Document   : login
    Created on : Feb 22, 2021, 9:08:46 PM
    Author     : drako
--%>

<%@page import="java.util.HashSet"%>
<%@page import="Entity.Category"%>
<%@page import="java.util.Map"%>
<%@page import="Entity.Product"%>
<%@page import="DAO.ConnectDB"%>
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
    String typeP = request.getParameter("typeP");
    HttpSession ses = request.getSession();
    if (ses.getAttribute("allProduct") == null) {
        cdb.getAllProduct();
        ses.setAttribute("allProduct", cdb.getHmProduct());
        ses.setAttribute("backUpIdProduct", cdb.getBackUpIdProduct());
    } else {
        cdb.setHmProduct((HashMap<String, Product>) ses.getAttribute("allProduct"));
        cdb.setBackUpIdProduct((HashSet<String>) ses.getAttribute("backUpIdProduct"));
    }
    if (ses.getAttribute("allCate") == null) {
        cdb.getAllCategory();
        ses.setAttribute("allCate", cdb.getHmCategory());
    } else {
        cdb.setHmCategory((HashMap<String, Category>) ses.getAttribute("allCate"));
    }
    String idProduct = "";
    String name = "";
    float price = 0;
    String imgUrl = "";
    String discount = "";
    String detail = "";
    String artist = "";
    String year = "";
    String cateId = "";
    int quantity = 0;
    if (id != "" && typeP != null && typeP.equals("1")) {
        if (cdb.getHmProduct().containsKey(id)) {
            Product product = cdb.getHmProduct().get(id);
            idProduct = product.getId();
            name = product.getName();
            price = product.getPrice();
            imgUrl = product.getImgUrl();
            discount = product.getDiscount();
            detail = product.getDetail();
            artist = product.getArtist();
            year = product.getYear();
            cateId = product.getCateId();
            quantity = product.getQuantity();
        }
    }
%>

<section class="section login-page">
    <div class="login container">
        <jsp:include page="listManagement.jsp"></jsp:include>
            <div class="right">
                <form action="addProduct?typeP=<%=typeP%>" method="post">
                <table>
                    <tr>
                        <td>Product ID</td><td><input type="text" name="idProduct" value="<%=idProduct%>" style="width: 200px;background-color: gainsboro;" readonly></td>
                    </tr>
                    <tr>
                        <td>Product Name:</td><td><input type="text" name="name" value="<%=name%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Price:</td><td><input type="text" name="price" value="<%=price%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Image Url:</td><td>
                            <!--<input type="text" name="imgUrl" value="" style="width: 200px;" required >-->
                            <input type="file" id="img" value="<%=imgUrl%>" name="imgUrl" accept="image/*"></td>
                    </tr>
                    <tr>
                        <td>Discount</td><td><input type="text" name="discount" value="<%=discount%>" style="width: 200px;" required></td>
                    </tr>              
                    <tr>
                        <td>Artist</td><td><input type="text" name="artist" value="<%=artist%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Year</td><td><input type="text" name="year" value="<%=year%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Detail</td><td><input type="textarea" name="detail" value="<%=detail%>" style="width: 200px;" required></td>
                    </tr>
                    <tr style="display: none;">
                        <td>Quantity</td><td><input min="0" type="number" name="quantity" value="<%=quantity%>" style="width: 200px;" required></td>
                    </tr>
                    <tr>
                        <td>Category:</td>
                        <td>
                            <select name="cateId">
                                <%
                                    for (Map.Entry<String, Category> en : cdb.getHmCategory().entrySet()) {
                                        String key = en.getKey();
                                        Category val = en.getValue();%>
                                <option value="<%=key%>" <%=(key.equals(cateId)) ? "selected" : ""%> ><%=val.getCateName()%></option>
                                <% }%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input style="width: 100px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" class="btn" type="submit" value="Submit" style="width: 100px;"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</section>
