<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login Form</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--<link rel="stylesheet" href="../asset/css/style_1.css"/>-->
    <link rel="stylesheet" href="./asset/css/base.css">
    <link rel="stylesheet" href="./asset/css/main.css">
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
            height: 40px; /* Thay đổi giá trị theo mong muốn của bạn */
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
                    <div class="header__title">
                        <a href="home" class="header__title-link">
                            Haei Shop
                        </a>
                    </div>
                    <div class="header__title">
                        <a href="newpass" class="header__title-login">
                            Đổi Mật Khẩu
                        </a>
                    </div>
                </div>

            </div>
        </header>
    </div>
    <section class="fxt-template-animation fxt-template-layout1">
        <div class="container-fluid">
            <div class="row">
                <div style="padding: 30px" class="col-md-6 col-12 fxt-none-767 fxt-bg-img"><img width="100%" height="100%" src="asset/img/baomat.jpg" alt="alt"/></div>
                <div style="padding: 30px" class="col-md-6 col-12 fxt-bg-color">
                    <div class="fxt-content" >
                        <div class="fxt-form">
                            <h2 style="color: red; font-size: 46px">Đổi mật khẩu</h2>
                            <p style="font-size: 20px">Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người khác</p>
                            <p id="rule" style="font-size: 16px">Mật khẩu mạnh là sự kết hợp của các chữ cái và dấu chấm câu. Nó phải dài ít nhất 6 ký tự.</p>
                            <form id="f1" action="newpass" method="post">
                                <input name="userName" value="${requestScope.acc.user}" type="hidden">
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-2">
                                        <input oninput="checkNumberCharacter(this)" id="pass1" type="password" class="form-control" name="password" placeholder="${requestScope.check == null ? 'Password' : 'New password'}" required value="${uPass}">
                                        <i id="iconsee" style="cursor: pointer; font-size: 14px" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                    </div>
                                    <label style="color: red; display:none; font-size: 14px" class="mb-1" id="text1"></label>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-2">
                                        <input oninput="checkSame(this)" id="pass2" type="password" class="form-control" name="cfpassword" placeholder="${requestScope.check == null ? 'Confirm Password' : 'Confirm new password'}" required value="${uPass}">
                                        <i id="iconsee" style="cursor: pointer; font-size: 14px" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                    </div>
                                    <label style="color: red; display:none ; font-size: 14px" class="mb-1" id="text"></label>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-3">
                                        <div class="fxt-content-between">
                                            <button style="border: 1px solid blue; background-color: blue; color: white; width: 70px ; height: 40px; border-radius: 10px; font-size: 14px" id="buttionsubmit" type="button" onclick="checkPass()" class="fxt-btn-fill">Continue</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <%@include file="footer.jsp" %> 
</body>
</html>