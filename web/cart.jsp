<%@page import="java.util.Map"%>
<%@page import="Entity.OrderDetail"%>
<%@page import="java.util.HashMap"%>
<%@page import="Entity.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Favicon -->
        <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon" />
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
            />

        <!-- Custom StyleSheet -->
        <link rel="stylesheet" href="css/styles.css" />
        <title>Cd/Dvd Shop</title>
    </head>

    <body>

        <!-- Navigation -->
        <jsp:include page="navigation.jsp"></jsp:include>
        <%
            HttpSession ses = request.getSession();
            if (ses.getAttribute("order") == null) {
                request.getRequestDispatcher("home").forward(request, response);
            }
            Order order = (Order) ses.getAttribute("order");
            HashMap<Integer, OrderDetail> hm = order.getItems();
        %> 

        <!-- Cart Items -->

        <div class="container cart">
            <table>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
                <div class="cart-items">
                    <%  float total = 0;
                        for (Map.Entry<Integer, OrderDetail> en : hm.entrySet()) {
                            Integer key = en.getKey();
                            OrderDetail val = en.getValue();
                            total = total + val.getPrice() * val.getQuantity();%>
                    <div class="cart-row">
                        <tr>
                        <div class="cart-item cart-column">
                            <td>
                                <div class="cart-info">
                                    <img src="images/<%=val.getProduct().getImgUrl()%>" alt="" class="cart-item-image" />
                                    <div>
                                        <p class="cart-item-title"><%=val.getProduct().getName()%></p>
                                        <span class="cart-price cart-column"><%=val.getPrice()%></span>
                                        <br />
                                        <a href="removeCart?productId=<%=val.getProduct().getId()%>">remove</a>
                                    </div>
                                </div>
                            </td>
                        </div>
                        <div class="cart-quantity cart-column">
                            <td><input type="number" value="<%=val.getQuantity()%>" min="1" max="<%=val.getProduct().getQuantity()%>" class="cart-quantity-input" /></td>
                            <td><%=val.getPrice() * val.getQuantity()%></td>
                        </div>
                        </tr>
                    </div>
                    <% }%>
                </div>

            </table>

            <div class="total-price">
                <table>
                    <tr>
                        <td>Total</td>
                        <td class="cart-total-price"><%=total%></td>
                    </tr>
                </table>
                <a href="addOrder" class="checkout btn">Proceed To Checkout</a>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- End Footer -->

        <!-- Custom Scripts -->
        <script src="./js/products.js"></script>
        <script src="./js/slider.js"></script>
        <script src="./js/index.js"></script>
    </body>
</html>
