<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Favicon -->
        <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
        <!-- Glidejs -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.css">

        <!-- Custom StyleSheet -->
        <link rel="stylesheet" href="css/styles.css" />
        <title>Cd/Dvd Shop</title>
    </head>

    <body>

        <jsp:include page="navigation.jsp"></jsp:include>

            <div class="hero">
                <div class="left">
                    <!--<span>Exclusive Sales</span>-->
                    <h1>Music lives here.</h1>
                    <small>Discover and listen. In perfect harmony.<br>
                        Buy your favorite artist's latest album, CD, vinyl... <br>
                        all in one place</small>
                    <a href="product">View All Product </a>
                </div>
                <div class="right">
                    <img src="./images/img1.jpg" alt="" />
                </div>
            </div>

            <!-- Products -->
            <section class="section products">
                <div class="title">
                    <h2>New Products</h2>
                    <span>Discover new music from our lastest products</span>
                </div>

                <div class="product-layout">
                <c:forEach items="${latestProduct}" var="entry">
                    <div class="product">
                        <div class="img-container">
                            <img src="./images/${entry.value.imgUrl}" alt="" />
                            <c:if test="${sessionScope.user.userRole == 1 && entry.value.quantity > 0}">
                                <div class="addCart">
                                    <a href="addToCart?productId=${entry.value.id}">
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <div class="bottom">
                            <a href="detail?productId=${entry.value.id}&artist=${entry.value.artist}">${entry.value.name}</a>
                            <div class="price">
                                <span>${entry.value.price} VND</span>
                                <c:if test="${entry.value.quantity == 0}">
                                    <span>(Out of stock)</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="title">
                <h2>New CD/DVD</h2>
                <span>Discover new music from our lastest products</span>
            </div>

            <div class="product-layout">
                <c:forEach items="${latestProductCD}" var="entry">
                    <div class="product">
                        <div class="img-container">
                            <img src="./images/${entry.value.imgUrl}" alt="" />
                            <c:if test="${sessionScope.user.userRole == 1 && entry.value.quantity > 0}">
                                <div class="addCart">
                                    <a href="addToCart?productId=${entry.value.id}">
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <div class="bottom">
                            <a href="detail?productId=${entry.value.id}&artist=${entry.value.artist}">${entry.value.name}</a>
                            <div class="price">
                                <span>${entry.value.price} VND</span>
                                <c:if test="${entry.value.quantity == 0}">
                                    <span>(Out of stock)</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="title">
                <h2>New Vinyl</h2>
                <span>Discover new music from our lastest products</span>
            </div>

            <div class="product-layout">
                <c:forEach items="${latestProductVinyl}" var="entry">
                    <div class="product">
                        <div class="img-container">
                            <img src="./images/${entry.value.imgUrl}" alt="" />
                            <c:if test="${sessionScope.user.userRole == 1 && entry.value.quantity > 0}">
                                <div class="addCart">
                                    <a href="addToCart?productId=${entry.value.id}">
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <div class="bottom">
                            <a href="detail?productId=${entry.value.id}&artist=${entry.value.artist}">${entry.value.name}</a>
                            <div class="price">
                                <span>${entry.value.price} VND</span>
                                <c:if test="${entry.value.quantity == 0}">
                                    <span>(Out of stock)</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="title">
                <h2>New Cassette</h2>
                <span>Discover new music from our lastest products</span>
            </div>

            <div class="product-layout">
                <c:forEach items="${latestProductCas}" var="entry">
                    <div class="product">
                        <div class="img-container">
                            <img src="./images/${entry.value.imgUrl}" alt="" />
                            <c:if test="${sessionScope.user.userRole == 1 && entry.value.quantity > 0}">
                                <div class="addCart">
                                    <a href="addToCart?productId=${entry.value.id}">
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <div class="bottom">
                            <a href="detail?productId=${entry.value.id}&artist=${entry.value.artist}">${entry.value.name}</a>
                            <div class="price">
                                <span>${entry.value.price} VND</span>
                                <c:if test="${entry.value.quantity == 0}">
                                    <span>(Out of stock)</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>


        <jsp:include page="footer.jsp"></jsp:include>


        <!-- Glidejs -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

        <!-- Custom Scripts -->
        <script src="./js/products.js"></script>
        <script src="./js/slider.js"></script>
        <script src="./js/index.js"></script>
    </body>

</html>

