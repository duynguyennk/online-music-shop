<%@page import="java.util.HashMap"%>
<%@page import="Entity.Product"%>
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

            <!-- PRODUCTS -->

            <section class="section products">
                <div class="products-layout container">
                    <div class="col-1-of-4">
                        <div>
                            <div class="block-title">
                                <h3>Category</h3>
                            </div>

                            <ul class="block-content">
                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>CD</span>
                                        <small>(10)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>Vinyl</span>
                                        <small>(7)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span> Cassette</span>
                                        <small>(3)</small>
                                    </label>
                                </li>
                            </ul>
                        </div>

                        <div>
                            <div class="block-title">
                                <h3>Year</h3>
                            </div>

                            <ul class="block-content">
                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2020</span>
                                        <small>(10)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2019</span>
                                        <small>(7)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2018</span>
                                        <small>(3)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2017</span>
                                        <small>(3)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2016</span>
                                        <small>(3)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2015</span>
                                        <small>(3)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2014</span>
                                        <small>(3)</small>
                                    </label>
                                </li>

                                <li>
                                    <input type="checkbox" name="" id="">
                                    <label for="">
                                        <span>2013</span>
                                        <small>(3)</small>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-3-of-4">
                        <form action="sort" method="post">
                            <div class="item">
                                <label for="sort-by">Sort By</label>
                                <select name="sort" id="sort-by">
                                    <option value="name" selected="selected">Name</option>
                                    <option value="price">Price</option>
                                </select>
                            </div>
                            <div class="item">
                                <label for="order-by">Order</label>
                                <select name="by" id="sort-by">
                                    <option value="ASC" selected="selected">ASC</option>
                                    <option value="DESC">DESC</option>
                                </select>
                            </div>
                            <!--<a href="">Apply</a>-->
                            <input style="padding: 10px; background-color: #ff4545; border-radius: 10px;border: 0px; color: white" type="submit" value="Apply">
                        </form>


                        <div class="product-layout">
                        <c:forEach items="${allProduct}" var="entry">
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

                    <!-- PAGINATION -->
                    <ul class="pagination">
                        <span>1</span>
                        <span>2</span>
                        <span class="icon">??</span>
                        <span class="last">Last »</span>
                    </ul>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Custom Scripts -->
        <script src="./js/products.js"></script>
        <script src="./js/slider.js"></script>
        <script src="./js/index.js"></script>
    </body>

</html>