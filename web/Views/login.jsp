<%-- 
    Document   : login
    Created on : Jan 8, 2024, 9:32:52 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
              integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./asset/css/base.css">
        <link rel="stylesheet" href="./asset/css/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="./asset/font/fontawesome-free-5.15.4-web/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <style>
            .password-container {
                position: relative;
                width: 100%;
            }

            .auth-form__input {
                width: calc(100% - 30px);
                padding-right: 30px;
            }

            .toggle-password {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
            }

            .toggle-password:hover i {
                display: block;
            }
        </style>
    </head>
    <body>
        <div id="main">
            <header id="header">
                <div class="grid">
                    <div class="navbar"></div>
                    <div class="header-with-search" style="display: flex; justify-content: space-around">
                        <div class="header__title">
                            <a href="home" class="header__title-link">
                                Haei Shop
                            </a>
                        </div>
                        <div class="header__title">
                            <a href="login" class="header__title-login">
                                Đăng Nhập
                            </a>
                        </div>
                    </div>

                </div>
            </header>
        </div>
        <div id="app__container">
            <div class="grid">
                <div class="grid__row login__form">
                    <div  class="auth-form" style="margin: auto">
                        <div class="auth-form__container">
                            <header class="auth-form__header">
                                <h3 class="auth-form__heading">Đăng Nhập</h3>
                                <span class="auth-form__switch-control"><a href="signup">Đăng Ký</a></span>
                            </header>

                            <form method="post">
                                <div class="auth-form__form">
                                    <!--Lỗi đăng nhập-->
                                    <c:if test="${requestScope.mess != null}">
                                        <div style="display: flex;border: 1px solid crimson; height: 60px; font-size: 15px; text-align: left; align-items: center; background-color: #fff9fa" class="auth-form__form-group">
                                            <div style="margin: 0px 1px 0 10px"><svg style="width: 20px; height: 20px;" 
                                                                                     viewBox="0 0 16 16" class="fJb11i"><path fill="none" stroke="#FF424F" 
                                                                                     d="M8 15A7 7 0 108 1a7 7 0 000 14z" clip-rule="evenodd"></path><rect 
                                                                                     stroke="none" width="7" height="1.5" x="6.061" y="5" fill="#FF424F" 
                                                                                     rx=".75" transform="rotate(45 6.06 5)"></rect><rect stroke="none" 
                                                                                     width="7" height="1.5" fill="#FF424F" rx=".75" transform="scale(-1 1) 
                                                                                     rotate(45 -11.01 -9.51)"></rect></svg></div>
                                            <p style="margin: 10px 2px">
                                                ${requestScope.mess}
                                            </p>
                                        </div>
                                    </c:if>
                                    <c:set var="cookie" value="${pageContext.request.cookies}"/>
                                    <div class="auth-form__form-group">
                                        <input value="${cookie.userCo.value}" name="user" type="text" class="auth-form__input" placeholder="Tên đăng nhập"/>
                                    </div>
                                    <div class="auth-form__form-group">
                                        <input value="${cookie.passCo.value}" name="pass" type="password" class="auth-form__input" placeholder="Mật khẩu"/>
                                        <i onclick="changeIcon(this)" class="navbar__icon fas fa-eye"></i>
                                    </div>
                                    <div style="font-size: 14px; color: blue" class="auth-form__aside">
                                        <input ${(cookie.rememCo != null ? 'checked' : '')} style="margin-right: 10px" type="checkbox" name="remember" value="on"/>Ghi nhớ đăng nhập
                                    </div>
                                </div>

                                <div class="auth-form__aside">
                                    <div class="auth-form__help">
                                        <a href="" class="auth-form__help-link auth-form__help-forgot">Quên mật khẩu</a>
                                        <span class="auth-form__help-separate"></span>
                                        <a href="" class="auth-form__help-link">Cần trợ giúp?</a>
                                    </div>
                                </div>

                                <div class="auth-form__control">
                                    <!--<button class="btn auth-form__control-back btn--normal">TRỞ LẠI</button>-->
                                    <button class="btn btn--primary">ĐĂNG NHẬP</button>
                                </div>
                            </form>
                        </div>

                        <footer class="auth-form__social">
                            <a href="" class="btn btn--size-s btn--with-icon auth-form__social-fb">
                                <i class="auth-form__social-icon fab fa-facebook-square"></i>
                                <span class="auth-form__social-tittle">Kết nối với Facebook</span>
                            </a>
                            <a href="" class="btn btn--size-s btn--with-icon auth-form__social-gg">
                                <i class=" auth-form__social-icon fab fa-google"></i>
                                <span class="auth-form__social-tittle">Kết nối với Google</span>
                            </a>
                        </footer>
                    </div>
                </div>
            </div> 
        </div>

        <%@include file="footer.jsp"%> 
        <script>
            function changeIcon(obj) {
                var id = obj.previousSibling.previousSibling.id;

                var inputP = document.getElementById(id);
                if (obj.className == 'navbar__icon fas fa-eye') {
                    obj.className = 'navbar__icon fas fa-eye';
                    inputP.type = 'text';
                } else {
                    obj.className = 'navbar__icon fas fa-eye';
                    inputP.type = 'password';
                }
            }
        </script>

    </body>
</html>
