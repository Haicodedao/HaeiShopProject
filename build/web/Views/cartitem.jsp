<%-- 
    Document   : cartitem
    Created on : Mar 12, 2024, 8:09:36 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./asset/css/base.css">
        <link rel="stylesheet" href="./asset/css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="./asset/font/fontawesome-free-5.15.4-web/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <!--<link rel="stylesheet" href="./asset/css/cart.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <style>
            body{
                margin-top:20px;
                background:#eee;
            }
            .ui-w-40 {
                width: 40px !important;
                height: auto;
            }

            .card{
                box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
                margin: 60px;
                padding-left: 80px;
                padding-top: 20px;
            }
            .container{
                width: 80%;
                margin: auto;
                font-size: 15px;
            }
            .media img{
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }
            .ui-product-color {
                display: inline-block;
                overflow: hidden;
                margin: .144em;
                width: .875rem;
                height: .875rem;
                border-radius: 10rem;
                -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
                vertical-align: middle;
            }
            td{
                padding-left: 30px;
            }
            .card-header{
                margin: 20px 0 40px 0;
                font-size: 20px;
                font-weight: bold;
            }
            .text-truncate {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            .buttom-checkout{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                text-align: center;
                padding-bottom: 20px;
            }
            .align-middle a{
                text-decoration: none;
                color: black;
                font-size: 15px;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container px-3 my-5 clearfix">
            <!-- Shopping cart table -->
            <div class="card">
                <div class="card-header">
                    <h2 >Shopping Cart</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <c:set var="cart" value="${requestScope.cart}"/>
                        <c:if test="${not empty cart and not empty cart.items}">
                            <table class="table table-bordered m-0">
                                <thead>
                                    <tr style="margin: 20px">
                                        <!-- Set columns width -->
                                        <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                        <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                        <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                                        <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cart.items}" var="c">
                                        <tr>
                                            <td class="p-4">
                                                <div style="height: 300px; display: inline-block; width: 300px " class="media align-items-center">
                                                    <img width="100%" height="70%" src="${c.product.img}"  alt="">
                                                    <div style="margin-top: 20px" class="media-body">
                                                        <a href="#" style="text-decoration: none; color: black; font-size: 20px;" class="d-block text-dark">${c.product.title}</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right font-weight-semibold align-middle p-4"><fmt:formatNumber value="${c.product.price}" pattern="###,###,###"/>.000VND</td>
                                            <td class="align-middle p-4">
                                                <!-- Đối với nút "-", chúng ta sẽ truyền số -1 -->
                                                <button onclick="updateQuantity(-1, '${c.product.id}')">-</button>
                                                ${c.quantity} 
                                                <!-- Đối với nút "+", chúng ta sẽ truyền số 1 -->
                                                <button onclick="updateQuantity(1, '${c.product.id}')">+</button>
                                            </td>
                                            <td class="text-right font-weight-semibold align-middle p-4"><fmt:formatNumber value="${c.product.price * c.quantity}" pattern="###,###,###"/>.000VND</td>
                                            <td class="text-center align-middle px-0">
                                                <form action="process" method="get">
                                                    <input type="hidden" value="${c.product.id}" name="id"/>
                                                    <input type="submit" value="Xóa"/>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty cart or empty cart.items}">
                            <h1>Không có sản phẩm trong giỏ hàng</h1>
                        </c:if>
                    </div>
                    <!-- / Shopping cart table -->
                    <div class="buttom-checkout">

                        <div class="float-right">
                            <button onclick="location.href = 'home'" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</button>
                            <button type="button" class="btn btn-lg btn-primary mt-2">Checkout</button>
                        </div>
                        <div style="padding-left: 50px; display: flex; justify-content: space-evenly" class="text-right mt-4">
                            <label style="margin-right: 20px" class="text-muted font-weight-normal m-0">Total price:</label>
                            <div class="text-large"><strong><fmt:formatNumber value="${cart.totalMoney}" pattern="###,###,###"/>.000VND</strong></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function updateQuantity(change, productId) {
                // Tạo một form tạm thời
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "process");

                // Tạo input ẩn để truyền số lượng thay đổi và ID của sản phẩm
                var inputNum = document.createElement("input");
                inputNum.setAttribute("type", "hidden");
                inputNum.setAttribute("name", "num");
                inputNum.setAttribute("value", change);
                form.appendChild(inputNum);

                var inputId = document.createElement("input");
                inputId.setAttribute("type", "hidden");
                inputId.setAttribute("name", "id");
                inputId.setAttribute("value", productId);
                form.appendChild(inputId);

                // Thêm form vào body và gửi nó đi
                document.body.appendChild(form);
                form.submit();
            }
        </script>
        <%@ include file="footer.jsp" %>
    </body>
</html>
