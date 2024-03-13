<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Quản lý sản phẩm</title>
        <link rel="icon" href="images/logo1.png"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <!-- Material Design Bootstrap Ecommerce -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 
        <style>
            td img {
                width: 200px;
                height: 120px;
            }
            body {
                margin: 0;
                padding: 0;
            }

            .alert.alert-success {
                margin: 20px 10px;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css"><style>body {
                background-color: #fbfbfb;
            }
            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }
            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }
            .text_page_head{
                font-size: 18px;
                font-weight: 600;
            }
            .text_page {
                font-size: 14px;
                font-weight: 600;
            }
            .buttonadd{
                position: absolute;
                right: 100px;
                top: 30px;
            }
            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }
            select {
                width: 32.3%;
                margin: 0;
                font-size: 100%;
                padding: 5px 10px 5px 10px;
                font-family: Segoe UI, Helvetica, sans-serif;
                border: 1px solid #D0D0D0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                border-radius: 20px;
                outline: none;
            }

        </style>
    </style>
</head>
<body>

    <!--Main Navigation-->
    <header>
        <jsp:include page="leftadmin.jsp"></jsp:include>
        </header>
    <jsp:include page="header_right.jsp"></jsp:include>
        <!--Main layout-->
        <main>
            <div class="container pt-4">
                <!--Section: Quan Ly tai Khoan-->
                <section class="mb-4">
                    <div class="card">
                        <div class="row" style="">
                            <div class="col-sm-4" style="text-align: center; margin-top: 20px; padding-top: 20px">
                                <h3 class="mb-0" id="">
                                    <strong>Manage Products</strong>
                                </h3>
                            </div>
                            <div class="col-lg-6" style="text-align: center; margin-top: 20px; margin-bottom: 20px;padding-top: 20px"F>
                                <form action="adsearchproduct" method="post" style="display: flex; justify-content: center">
                                    <input required name="valueSearch" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" id="searchId" type="text" oninput="searchByName()" placeholder="Search product name" style="width: 60%; padding: 4px 10px; border-radius: 15px">
                                <button type="submit" style="border-radius: 50%; width: 40px; font-size: 18px; margin-left: 10px"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="col-lg-2">
                            <a href="#addProductModal" style="height: 40px" class="buttonadd btn btn-success" data-toggle="modal"><i class="fa-solid fa-plus"></i></a>
                        </div>

                    </div>

                    <c:if test="${requestScope.error!=null }">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                        </div>
                    </c:if>
                    <c:if test="${requestScope.mess!=null }">
                        <div class="alert alert-success" role="alert">
                            ${requestScope.mess}
                        </div>
                    </c:if>

                    <div class="card-body">
                        <div class="table-responsive"  id="contentt">
                            <table  class="table table-hover text-nowrap">
                                <thead>
                                    <tr>
                                        <th class="text_page_head" scope="col">ID</th>
                                        <th class="text_page_head" scope="col">Name</th>
                                        <th class="text_page_head" style="text-align: center" scope="col">Image</th>
                                        <th class="text_page_head" scope="col">Price</th>
                                        <th class="text_page_head" scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach items="${requestScope.listPro}" var="pro">
                                        <c:set value="${i + 1}" var="i"/>
                                        <tr class="product_items">
                                            <td class="text_page">${i}</td>
                                            <td style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" class="text_page">${pro.title}</td>
                                            <td style="text-align: center">
                                                <img style="width: 170px; height:180px" src="${pro.img}">
                                            </td>
                                            <td class="text_page">${pro.price}00 VND</td>
                                            <td class="text_page">
                                                <a href="adupdateproduct?pid=${pro.id}"><button type="button" class="btn btn-warning"><i class="fa-solid fa-pen"></i></button></a>
                                                <a href="addeleteproduct?pid=${pro.id}" id="deleteLink">
                                                    <button type="button" class="btn btn-danger" onclick="confirmDelete()"><i class="fa-solid fa-trash"></i></button>
                                                </a>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </section>
            <!--Section: Quan Ly tai Khoan-->
        </div>


    </main>
    <div class="modal fade" id="modal_box" role="dialog"></div>
    <!-- Edit Modal HTML -->
    <div id="addProductModal" class="modal fade" style="margin-right: 40px">
        <div class="modal-dialog" style="margin: 28px 22%">
            <div class="modal-content" style="width: 1000px; max-height: 900px; overflow: scroll">
                <form action="adminaddproduct">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add Product</h4>
                    </div>
                    <div class="modal-body">					
                        <div class="form-group">
                            <label>Product Name</label>
                            <input name="name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input name="image" type="file" id="imageInput" required>
                            <img multipart src="#" id="previewImage" alt="Preview" style="max-width: 100%; max-height: 200px; margin-top: 10px; display: none;">
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input name="price" type="number" step="0.01" min="0" class="form-control" required> 
                        </div>
                        <div class="form-group">
                            <label>Describe</label>
                            <textarea name="describe" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Quantity</label>
                            <input name="quantity" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Manager</label>
                            <select style="padding: 5px 0" name="manager" class="form-select" >
                                <c:forEach items="${requestScope.listaccMa}" var="accma">
                                    <option value="${accma.id}">${accma.user}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Category</label>
                            <select style="padding: 5px 0" name="category" class="form-select" >
                                <c:forEach items="${requestScope.listCa}" var="ca">
                                    <option value="${ca.id}">${ca.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">  
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
//        id="imageInput": Là id của trường input chọn file.
//id="previewImage": Là id của thẻ img để hiển thị hình ảnh đã chọn.
//Sự kiện change được thêm vào trường input để bắt sự kiện khi người dùng chọn một tệp.
//Khi người dùng chọn một tệp, đoạn mã JavaScript sẽ đọc nội dung của tệp và hiển thị hình ảnh bằng cách thay đổi src của thẻ img.
        document.getElementById('imageInput').addEventListener('change', function () {
            var preview = document.getElementById('previewImage');
            var file = document.getElementById('imageInput').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
                preview.style.display = 'block';
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = '';
                preview.style.display = 'none';
            }
        });

        function confirmDelete() {
            if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')) {
                window.location.href = document.getElementById('deleteLink').getAttribute('href');
            }
        }
    </script>
</body>


</html>