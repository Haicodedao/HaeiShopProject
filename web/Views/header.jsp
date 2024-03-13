<%-- 
    Document   : header
    Created on : Jan 8, 2024, 9:53:56 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="main">
            <header id="header">
                <div class="grid">
                    <!-- Begin: Navbar -->
                    <div class="navbar">
                        <ul class="navbar__list">
                            <li class="navbar__item navbar__item--bold navbar__item--separate"><a href="">Kênh người bán</a></li>
                            <c:if test="${sessionScope.acc == null}">
                            <li class="navbar__item navbar__item--bold navbar__item--separate"><a href="msignup">Trở thành người bán Shoppe</a></li>
                            </c:if>
                            <li class="navbar__item">
                                <span class="navbar__item--no-pointer">Kết nối</span>
                                <a href="https://www.facebook.com/profile.php?id=100087125541215" class="navbar__item-link-icon">
                                    <i class="navbar__icon fab fa-facebook"></i>
                                </a>
                                <a href="https://www.tiktok.com/@leninreal99" class="navbar__item-link-icon">
                                    <i class="navbar__icon fab fa-tiktok"></i>
                                </a>
                            </li>
                        </ul>

                        <ul class="navbar__list">
                            <li class="navbar__item navbar__item-has-notify">
                                <a href="" class="navbar__item-link">
                                    <i class="navbar__icon far fa-bell"></i>
                                    Thông báo
                                </a>

                                <!-- Header Notify -->
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Thông Báo Mới Nhận</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">
                                                <img src="https://cf.shopee.vn/file/be5db69ffdcfad7d1680e8d9702efbd6_tn"
                                                     alt="" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">🎁 Tặng HaeiCrypto 01 Mã
                                                        Freeship!</span>
                                                    <span class="header__notify-desc">👉 Cho đơn từ 0đ - Mã có sẵn trong ví!
                                                        🤑 Siêu giảm giá, sale linh đình ️🛒 Dùng ngay thôi!</span>
                                                    <img src="https://cf.shopee.vn/file/db9bdbafe0213c8524822a5f6956cc04"
                                                         alt="" class="header__notify-img-more">
                                                </div>
                                            </a>
                                        </li>
                                    </ul>

                                    <footer class="header__notify-footer">
                                        <a href="" class="header__notify-footer-btn">Xem tất cả</a>
                                    </footer>
                                </div>
                            </li>
                            <li class="navbar__item"><a href="" class="navbar__item-link">
                                    <i class="navbar__icon far fa-question-circle"></i>
                                    Trợ giúp
                                </a>
                            </li>
                            <c:if test="${sessionScope.acc.role.roid == 1}">
                            <li class="navbar__item"><a href="admin" class="navbar__item-link">
                                    <i class="navbar__icon far fa-user"></i>
                                    Quản lý dữ liệu
                                </a>
                            </li>
                            </c:if>
                            <c:set var="account" value="${sessionScope.acc}"/>
                            <c:choose>
                                <c:when test="${account == null}">
                                    <li class="navbar__item navbar__item--bold navbar__item--separate"><a href="signup">Đăng ký</a></li>
                                    <li class="navbar__item  navbar__item--bold"><a href="login">Đăng nhập</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    
                                    <!-- Login -->
                                    <li class="navbar__item navbar__user">
                                        <img src="https://cf.shopee.vn/file/c71d16f96bd1e67a0bd29d9356621123_tn" alt="avt" class="navbar__user-avt">
                                        <c:if test="${sessionScope.acc.role.roid != 1}">
                                        <span class="navbar__user-name">${account.user}</span>
                                        </c:if>
                                        <c:if test="${sessionScope.acc.role.roid == 1}">
                                        <span class="navbar__user-name">Xin chào Admin: ${account.user}</span>
                                        </c:if>
                                        <ul class="navbar__user-menu">
                                            <li class="navbar__user-item"><a href="profile?aid=${account.id}">Tài khoản của tôi</a></li>
                                            <li class="navbar__user-item"><a href="">Đơn mua</a></li>
                                            <li class="navbar__user-item navbar__user-item-separate"><a href="logout">Đăng xuất</a></li>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <!-- End: Navbar -->

                    <!--BẮT ĐẦU ; SEARCH -->
                    <div class="header-with-search">
                        <div class="header__title">
                            <a href="home" class="header__title-link">
                                Haei Shop
                            </a>
                        </div>

                        <div class="header__search">
                            <form action="adsearchproduct" method="get"  class="header__search header__search-input-wrap">
                                <div class="header__search-input-wrap">
                                    <input name="valueSearch" value="${requestScope.valueSearch}" type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm">
                                    <!-- Search lịch sử -->
                                    <div class="header__search-history">
                                        <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                                        <ul class="header__search-history-list">
                                            <li class="header__search-history-item">
                                                <a href="">Iphone</a>
                                            </li>
                                            <li class="header__search-history-item">
                                                <a href="">Bàn phím Edra</a>
                                            </li>
                                            <li class="header__search-history-item">
                                                <a href="">Ghế edra</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="header__search-select">
                                    <span class="header__search-select-label"> Trong Shop </span>
                                    <i class="select-icon fas fa-angle-down"></i>

                                    <ul class="header__search-option">
                                        <li class="header__search-option-item header__search-option-item--active">
                                            <span>Trong Shop</span>
                                            <i class="fas fa-check"></i>
                                        </li>
                                        <li class="header__search-option-item">
                                            <span>Ngoài shop</span>
                                            <i class="fas fa-check"></i>
                                        </li>
                                    </ul>
                                </div>
                                <button type="submit"  class="header__search-btn">
                                    <i class="header__search-btn-icon fas fa-search"></i>
                                </button>
                            </form>
                        </div>

                        <!-- Cart layout -->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fas fa-shopping-cart"></i>
                                <span class="header__cart-notice">${sessionScope.size}</span>
                                <!-- No cart: header__cart-list--no-cart -->
                                <div class="header__cart-list">
                                    <img src="./asset/img/nocard.png" alt="No card" class="header__cart-no-cart-img">
                                    <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                    <ul class="header__cart-group">
                                        <!-- Cart items -->
                                        <li class="header__cart-item">
                                            <img src="https://cf.shopee.vn/file/f9864891a8ba04e463d2dd446e745c49" alt="Bàn Phím Cơ EDRA EK387" class="header__cart-img">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <a href="">
                                                        <h5 class="header__cart-item-name">Bàn Phím Cơ EDRA EK387 Bàn Phím Cơ EDRA EK387Bàn Phím Cơ EDRA EK387Bàn Phím Cơ EDRA EK387Bàn Phím Cơ EDRA EK387</h5>
                                                        <div class="header__cart-price-wrap">
                                                            <span class="header__cart-item-price">640.000đ</span>
                                                            <span class="header__cart-item-delect">x</span>
                                                            <span class="header__cart-item-qnt">2</span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="header__cart-item-body"> 
                                                    <span class="header__cart-item-desc">Phân loại hàng: Red Switch</span>
                                                    <span class="header__cart-item-remove"><a href="">Xóa</a></span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <a href="cartitem" class="header__cart-view btn btn--primary">Xem giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Kết thúc:  search -->
                </div>

            </header>
        </div>
    </body>
</html>
