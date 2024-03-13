<%-- 
    Document   : profile
    Created on : Dec 19, 2023, 5:20:39 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Profile</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./asset/css/base.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="./asset/css/main.css">
        <link rel="stylesheet" href="./asset/css/profile.css"/>
        <style>
            .form-control {
                height: 40px; /* Đặt chiều cao tùy ý */
                font-size: 16px; /* Đặt kích thước chữ tùy ý */
            }
            .col-xl-8{
                width: 50%;
                margin-left: 5%;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="row">
            <c:set var="acc" value="${requestScope.accpro}"/>
            <div style="margin-left: 10%; font-size: 25px" class="col-xl-3">
                <div class="card mb-4 mb-xl-0">
                    <div style="color: black; font-size: 18px" class="card-header">Hello : ${acc.name}<br>
                        <svg width="12" height="12" viewBox="0 0 12 12" 
                             xmlns="http://www.w3.org/2000/svg" 
                             style="margin-right: 4px;"><path d="M8.54 0L6.987 1.56l3.46
                             3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48"
                             accesskey=""fill="#9B9B9B" fill-rule="evenodd"></path></svg> 
                        Sửa hồ sơ
                    </div>
                </div>
                <div class="card mb-4 mb-xl-0">
                    <div class="container d-flex justify-content-center">
                        <div class="card p-3" style="margin: 10px 0">
                            <div class="d-flex flex-row ">
                                <a  style= "color: orange "href="#"><img width="30px" height="30px" style="border-radius: 80%; margin-right: 10px;" src="./asset/img/user.jpg" alt="alt"/>Hồ sơ</a>
                            </div>
                            <div class="d-flex flex-row ">
                                <a href="newpass?aid=${acc.id}">Đổi mật khẩu</a>
                            </div>
                            <div class="d-flex flex-row ">
                                <a href="url">Đơn mua</a>
                            </div>
                            <div class="d-flex flex-row ">
                                <a href="home">Trở lại</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-8" style="margin-top: -37px; font-size: 18px">
                <div class="card mb-4">
                    <div class="card-header" style="font-weight: 700; color: black; font-size: 20px">Hồ Sơ Của Tôi</div>
                    <div  class="card-header"><h2 style="color: green">${requestScope.succ}</h2></div>
                    <div class="card-body">
                        <form method="post" action="profile">
                            <div style="" class="mb-3">  
                                <label class="mb-1" for="inputUsername">Username</label>
                                <input class="form-control" readonly id="inputUsername" name="username" type="text" placeholder="Enter your username" value="${acc.user}">
                            </div>
                            <div class="gx-3 mb-3">
                                <label class="mb-1" for="inputFirstName">Full name</label>                                
                                <input class="form-control acceptEdit"  name="name" id="inputFirstName" type="text" placeholder="Full Name" value="${acc.name}"> 
                            </div>

                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="mb-1" for="inputOrgName">Role</label>
                                    <c:choose>
                                        <c:when test="${acc.role.roid == 1}">
                                            <input class="form-control" id="inputOrgName" readonly type="text" placeholder="Enter your organization name" value="Admin">
                                        </c:when>
                                        <c:when test="${acc.role.roid == 3}">
                                            <input class="form-control" id="inputOrgName" readonly type="text" placeholder="Enter your organization name" value="Customer">
                                        </c:when>
                                        <c:otherwise>
                                            <input  class="form-control" id="inputOrgName" readonly type="text" placeholder="Enter your organization name" value="Manager">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-6">
                                    <label class="mb-1" for="inputLocation">Address</label>
                                    <input class="form-control acceptEdit" name="address" id="inputFirstName"  type="text" placeholder="Address" value="${acc.address}">
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control acceptEdit" name="email" id="inputFirstName"  type="email" placeholder="Email" value="${acc.email}">
                                </div>

                                <div class="col-md-6">
                                    <label class="mb-1" for="inputPhone">Phone number</label>
                                    <input class="form-control acceptEdit" name="phone" id="inputFirstName"  type="text" placeholder="Phone" value="${acc.phone}">
                                </div>
                            </div>
                                <button style="color: white; border: 1px solid blue; border-radius:20% ; background-color: blue "  id="buttonVip" type="submit">Save</button>                     
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>