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

        <!-- Custom StyleSheet -->
        <link rel="stylesheet" href="css/styles.css" />
        <title>Cd/Dvd Shop</title>
    </head>

    <body>

        <jsp:include page="navigation.jsp"></jsp:include>

            <!-- Product Details -->
            <section class="section product-detail">
                <div class="details container">
                    <div class="left">
                        <div class="main">
                            <img src="./images/${productDetail.imgUrl}" alt="" />
                    </div>
                </div>
                <div class="right">
                    <span>${categoryName}</span>
                    <h1>${productDetail.name}</h1>
                    <p>Artist: ${productDetail.artist}</p>
                    <p>Year: ${productDetail.year}</p>
                    <div class="price">${productDetail.price} VND</div>
                    <c:if test="${productDetail.quantity > 0}">
                        <p style="padding-bottom: 20px;">${productDetail.quantity} left in stock.</p> 
                        <c:if test="${sessionScope.user.userRole == 1}">
                            <form class="form">
                                <input type="number" name="quantity" value="1" placeholder="1" min="1" max="${productDetail.quantity}" />
                                <a href="addToCart?productId=${productDetail.id}" class="addCart">Add To Cart</a>
                            </form>
                        </c:if>

                    </c:if>
                    <c:if test="${productDetail.quantity == 0}">
                        <form class="form">
                            <a href="" class="addCart">Out of stock</a>
                        </form>
                    </c:if>
                    <c:if test="${sessionScope.user.userRole == 0 ||sessionScope.user.userRole == 2}">
                        <form class="form">
                            <a href="addproduct.jsp?id=${productDetail.id}&typeP=1" class="addCart">Edit product</a>
                        </form>
                    </c:if>
                    <h3>Product Detail</h3>
                    <p>
                        ${productDetail.detail}
                    </p>
                </div>
            </div>
        </section>

        <!-- Related Products -->

        <section class="section related-products">
            <div class="title">
                <h2>More from ${productDetail.artist}</h2>
                <span>Select from the premium product brands and save plenty money</span>
            </div>
            <div class="product-layout container">
                <c:forEach items="${productByArtist}" var="entry">
                    <div class="product">
                        <div class="img-container">
                            <img src="./images/${entry.value.imgUrl}" alt="" />
                            <div class="addCart">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                        </div>
                        <div class="bottom">
                            <a href="detail?productId=${entry.value.id}&artist=${entry.value.artist}">${entry.value.name}</a>
                            <div class="price">
                                <span>${entry.value.price} VND</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Custom Scripts -->
        <script src="./js/products.js"></script>
        <script src="./js/slider.js"></script>
        <script src="./js/index.js"></script>
    </body>

</html>