<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="nav">
    <div class="wrapper container">
        <div class="logo"><a href="home">MUSIC SHOP</a></div>
        <ul class="nav-list">
            <div class="top">
                <label for="" class="btn close-btn"><i class="fas fa-times"></i></label>
            </div>
            <li><a href="home">Home</a></li>
            <li><a href="product">Products</a></li>
            <li>
                <a href="" class="desktop-item">Category <span><i class="fas fa-chevron-down"></i></span></a>
                <label for="showdrop1" class="mobile-item">Category <span><i class="fas fa-chevron-down"></i></span></label>
                <ul class="drop-menu1">
                    <c:forEach items="${allCategory}" var="entry">
                        <li><a href="category?cateId=${entry.value.cateId}">${entry.value.cateName}</a></li>
                        </c:forEach>
                </ul>
            </li>
            <!--            0 la admin, 2 la nguoi ban-->
            <c:if test="${sessionScope.user.userRole == 2 || sessionScope.user.userRole == 0}">
                <li><a href="management.jsp">Manage</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                <li><a href="logout">Logout</a></li> 
                </c:if>
                <c:if test="${sessionScope.user==null}">
                <li><a href="login">Login</a></li> 
                </c:if>
                <c:if test="${sessionScope.user.userRole == 1}">
                <li>
                    <a href="" class="desktop-item">More <span><i class="fas fa-chevron-down"></i></span></a>
                    <label for="showdrop2" class="mobile-item">More <span><i class="fas fa-chevron-down"></i></span></label>
                    <ul class="drop-menu2">
                        <li><a href="settingUser.jsp">Setting</a></li>
                        <li><a href="viewOrder">View Order</a></li>
                    </ul>
                </li>
            </c:if>

            <!-- icons -->
            <li class="icons">
                <span>
                    <a href="cart.jsp">
                        <img src="./images/shoppingBag.svg" alt="" />
                        <!--                        <small class="count d-flex">0</small>-->
                    </a>
                </span>
            </li>

            <li>
                <form action="search"> 
                    <input type="text" name="text" value="" placeholder="Search here">
                </form>
            </li>
            <c:if test="${sessionScope.user != null}">
                <li style="margin-left: 5px;">Hello ${sessionScope.user.name}</li>
                </c:if>
        </ul>
        <label for="" class="btn open-btn"><i class="fas fa-bars"></i></label>
    </div>
</nav>
