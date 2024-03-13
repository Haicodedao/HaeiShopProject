

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
        <style>
            .product-item__brand,
            .product-item__origin-name {
                display: inline-block;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 1000px;
            }
            .active{
                color: orangered;
            }
        </style>
    </head>

    <body>
        <%@include file="header.jsp"%>
        <!-- Mở đầu:  mặt hàng -->
        <div id="app__container">
            <div class="grid">
                <div class="grid__row app__content">
                    <div class="grid__column-2">
                        <nav class="category">
                            <h3 class="category__heading">
                                <i class="category__heading-icon fas fa-list"></i>
                                Danh Mục
                            </h3>

                            <ul class="category-list">
                                <li class="category-item category-item--active">
                                    <a href="home" class="category-item__link">Các Mẫu Sản Phẩm</a>
                                </li>

                                <c:forEach items="${sessionScope.listCa}" var="listCa">
                                    <c:set var="cid" value="${listCa.id}"/>
                                    <li class="category-item">
                                        <a href="productbycate?cid=${cid}" 
                                           class="category-item__link ${listCa.id eq requestScope.cid ? 'active' : ''}">
                                            ${listCa.name}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>

                    <div class="grid__column-10">
                        <div class="home-filter">
                            <span class="home-filter__label">Sắp xếp theo</span>
                            <button class="home-filter__btn btn">Phổ biến</button>
                            <button class="home-filter__btn btn btn--primary">Mới nhất</button>
                            <button class="home-filter__btn btn">Bán chạy</button>
                            <div class="select-input">
                                <span class="select-input__label">Giá</span>
                                <i class="fas fa-angle-down"></i>

                                <!-- List option -->
                                <ul class="select-input__list">
                                    <c:set var="desc" value="desc"/>
                                    <c:set var="asc" value=""/>
                                    <li class="select-input__item">
                                        <a href="pricedesc?order=${asc}" class="select-input__link">Giá: Thấp đến Cao</a>
                                    </li><li class="select-input__item">
                                        <a href="pricedesc?order=${desc}" class="select-input__link">Giá: Cao đến Thấp</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="home-filter__page">
                                <span class="home-filter__page-num">
                                    <span class="home-filter__page-current">1</span>/${sessionScope.paging}
                                </span>

                                <div class="home-filter__page-control">
                                    <a href="" class="home-filter__page-btn home-filter__page-btn--disable">
                                        <i class="home-filter__page-icon fas fa-angle-left"></i>
                                    </a>
                                    <a href="" class="home-filter__page-btn">
                                        <i class="home-filter__page-icon fas fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Product -->
                        <div class="home-product">
                            <div class="grid__row">
                                <!--  List Item -->
                                <c:forEach items="${requestScope.listPro}" var="listP">
                                    <c:set var="pid" value="listP.id"/>
                                    <div style="margin: 5px 0;background-color: lavender" class="grid__column-2-4">
                                        <a class="product-item" href="detailproduct?pid=${listP.id}">
                                            <div class="product-item__img" style="background-image: url(${listP.img})"></div>
                                            <div class="product-item__info">
                                                <div style="margin: 10px 0;" class="product-item__origin">
                                                    <span class="product-item__origin-name">${listP.title}</span>
                                                </div>
                                                <div class="product-item__price">
                                                    <div class="product-item__price-old">đ ${(listP.price * 3)}00</div>
                                                    <div class="product-item__price-current">đ ${listP.price}00</div>
                                                </div>
                                                <div class="product-item__action">
                                                    <span class="product-item__like product-item__like--liked">
                                                        <i class="product-item__like-icon-empty far fa-heart"></i>
                                                        <i class="product-item__like-icon-fill fas fa-heart"></i>
                                                    </span>
                                                    <div class="product-item__rate">
                                                        <i class="product-item__star--gold fas fa-star"></i>
                                                        <i class="product-item__star--gold fas fa-star"></i>
                                                        <i class="product-item__star--gold fas fa-star"></i>
                                                        <i class="product-item__star--gold fas fa-star"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>
                                                    <span class="product-item__sold-out">Số lượng: ${listP.quantity}</span>
                                                </div>

                                            </div>
                                            <div class="product-item__favourite">
                                                <i class="fas fa-check"></i>
                                                <span>Yêu thích</span>
                                            </div>
                                            <div class="product-item__sale-off">
                                                <span class="product-item__sale-off-percent">30%</span>
                                                <span class="product-item__sale-off-label">GIẢM</span>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <ul class="pagination home-product--pagination">
                            <li class="pagination-item">
                                <a href="" class="pagination-item__link">
                                    <i class="pagination-item__icon fas fa-chevron-left"></i>
                                </a>
                            </li>

                            <!--<li class="pagination-item pagination-item--active">
                                <a href="" class="pagination-item__link">1</a>
                             </li>-->
                            <c:forEach begin="1" end="${sessionScope.paging}" var="i">
                                <li class="pagination-item ">
                                    <a href="paging?num=${i}" class="pagination-item__link">${i}</a>
                                </li>
                            </c:forEach>

                            <li class="pagination-item">
                                <a href="" class="pagination-item__link ">
                                    <i class="pagination-item__icon fas fa-chevron-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--Start : FOOTER-->
        <%@include file="footer.jsp" %>  
    </body>

</html>
