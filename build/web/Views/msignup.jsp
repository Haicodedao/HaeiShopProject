<%-- 
    Document   : register
    Created on : Jan 8, 2024, 9:37:57 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./asset/css/base.css">
        <link rel="stylesheet" href="./asset/css/main.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="./asset/font/fontawesome-free-5.15.4-web/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <style>
            i[id='iconsee']:hover {
                color: rgba(0, 0, 0, 0.5);
            }
            /* Tăng rộng của thanh input */
            /* Tăng rộng của thanh input */
            .form-control {
                width: 100%;
                font-size: 16px; /* Thay đổi giá trị theo mong muốn của bạn */
            }

            /* Tăng chiều cao của thanh input */
            .form-control {
                height: 35px; /* Thay đổi giá trị theo mong muốn của bạn */
            }

            /* Tăng cả rộng và chiều cao của biểu tượng mắt */
            .fa-eye-slash {
                font-size: 20px; /* Thay đổi giá trị theo mong muốn của bạn */
            }
        </style>
            <script src="./asset/js/common.js"></script>
    </head>
    <body>
        <div id="main">
            <header id="header">
                <div class="grid">
                    <div class="navbar"></div>
                    <div class="header-with-search" style="display: flex; justify-content: space-around">
                        <div style="width: 600px" class="header__title">
                            <a href="home" class="header__title-link">
                                Haei Shop
                            </a>
                        </div>
                        <div class="header__title">
                            <a href="" class="header__title-login">
                                Đăng Kí
                            </a>
                        </div>
                    </div>

                </div>
            </header>
        </div>
        <div id="app__container">
            <div style="display: flex; justify-content: space-around; align-items: center" class="grid">
                <div style="color: #3857e2; width: 40% ; height: 40%px" class="grid__row login__form">
                    <img width="100%" height="100%" src="asset/img/haeishop.jpg" alt="alt"/>
                </div>
                <div class="grid__row login__form">
                    <div class="auth-form" style="margin: auto;">
                        <div class="auth-form__container">
                            <header class="auth-form__header">
                                <h3 class="auth-form__heading">Đăng Ký</h3>
                                <span class="auth-form__switch-control" onclick=""><a href="login.jsp">Đăng nhập</a></span>
                            </header>
                            <form id="f1" action="msignup" method="post">
                                <c:if test="${requestScope.manasignup != null}">
                                <div style="display: flex;border: 1px solid crimson; height: 60px; font-size: 15px; text-align: left; align-items: center; background-color: #fff9fa" class="auth-form__form-group">
                                        <div style="margin: 0px 1px 0 10px"><svg style="width: 20px; height: 20px;" 
                                         viewBox="0 0 16 16" class="fJb11i"><path fill="none" stroke="#FF424F" 
                                         d="M8 15A7 7 0 108 1a7 7 0 000 14z" clip-rule="evenodd"></path><rect 
                                         stroke="none" width="7" height="1.5" x="6.061" y="5" fill="#FF424F" 
                                         rx=".75" transform="rotate(45 6.06 5)"></rect><rect stroke="none" 
                                         width="7" height="1.5" fill="#FF424F" rx=".75" transform="scale(-1 1) 
                                         rotate(45 -11.01 -9.51)"></rect></svg></div>
                                        <p style="margin: 10px 2px">
                                            ${requestScope.manasignup}
                                        </p>
                                    </div>
                                </c:if>
                                <div class="auth-form__form">
                                    <div class="auth-form__form-group">
                                        <input style="font-size: 16px" name="user" type="text" class="auth-form__input" placeholder="Tên đăng nhập">
                                    </div>
                                    <div class="auth-form__form-group">
                                        <input oninput="checkNumberCharacter(this)" id="pass1" type="password" class="form-control" name="password" placeholder="Mật khẩu" required>
                                        <i id="iconsee" style="cursor: pointer;font-size: 16px" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                    </div>
                                    <label style="color: red; display:none; font-size: 14px" class="mb-1" id="text1"></label>
                                    <div class="auth-form__form-group">
                                       <input oninput="checkSame(this)" id="pass2" type="password" class="form-control" name="cfpassword" placeholder="Nhập lại mật khẩu" required>
                                            <i id="iconsee" style="cursor: pointer; font-size: 16px" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                    </div>
                                </div>

                                <div class="auth-form__aside">
                                    <p class="auth-form__policy-text">
                                        Bằng việc đăng kí, bạn đã đồng ý với Shopee về
                                        <a href="#" class="auth-form__policy-link">Điều khoản dịch vụ</a> &
                                        <a href="#" class="auth-form__policy-link">Chính sách bảo mật</a>
                                    </p>
                                </div>

                                <div class="auth-form__control">
                                    <!--<button class="btn auth-form__control-back btn--normal">TRỞ LẠI</button>-->
                                    <button  type="button" onclick="checkPass()" class="btn btn--primary">ĐĂNG KÝ</button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div> 
        </div>>
        <%@include file="footer.jsp" %> 
    </body>
</html>
