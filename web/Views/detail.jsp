

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Haei Shopee</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./asset/css/base.css">
        <link rel="stylesheet" href="./asset/css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="./asset/font/fontawesome-free-5.15.4-web/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./asset/css/cart.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <style>
            .img-display{
                margin: 20px 30px 0 0;
            }
            .img-showcase img{
                width: 80%;
                height: 80%;
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
            }
        </style>
    </head>

    <body>
        <%@ include file="header.jsp" %>

        <!-- Product Detail Section -->
        <div id="app__container">
            <!--<div class="grid">-->
            <!--<div class="grid__row app__content">-->
            <div class = "card-wrapper">
                <c:set var="pro" value="${requestScope.pro}"/>
                <div class = "card">
                    <!-- card left -->
                    <div class="img-display">
                        <div class="img-showcase">
                            <img src="${pro.img}" alt="ảnh sản phẩm" "/>
                        </div>
                    </div>
                    <!-- card right -->
                    <div class = "product-content">
                        <h2 class = "product-title">${pro.title}</h2>
                        <a href = "home" class = "product-link">Visit HaeiShop</a>
                        <div class = "product-rating">
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star"></i>
                            <i class = "fas fa-star-half-alt"></i>
                            <span>4.5(21)</span>
                        </div>

                        <div class = "product-price">
                            <p class = "last-price">Old Price: <span>${pro.price * 3}00</span></p>
                            <p class = "new-price">New Price: <span>${pro.price}00 (30% giảm)</span></p>
                        </div>

                        <div class = "product-detail">
                            <h2>Mô tả sản phẩm </h2>
                            <p>${pro.description}</p>
                        </div>
                        <form action="buyproduct" method="post">
                            <div class = "purchase-info">
                                Số lượng <input type = "number" min = "0" value = "1" name="num"><span style="color: #757575">${pro.quantity} sản phẩm có sẵn</span><br> 
                                <input type="hidden" name="pid" value="${pro.id}">
                                <button type="submit" class="btn">
                                    Thêm vào giỏ hàng <i class="fas fa-shopping-cart"></i>
                                </button>
                                <button style="color: white" type = "button" class = "btn">Mua ngay</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--</div>-->
            <!--</div>-->
        </div>

        <%@ include file="footer.jsp" %>
        <script type="text/javascript">
            function addToCart(productId) {
                var num = document.querySelector('input[name="num"]').value;
                var url = "buyproduct?pid=" + productId + "&num=" + num;
                window.location.href = url;
            }
        </script>
    </body>

</html>
