

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
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
            .table-wrapper{
                background-color: #0061f2;
                color: white;
                width: 100%;
            }
        </style>
    <body style="background-color: #00acee">
        <div class="container" style="background-color: lightslategray">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog" style="width: 100%">
                    <div class="modal-content">
                        <a href="managerproduct">
                            <button style="position: absolute;
                                    right: 20px;
                                    top: 10px;
                                    font-size: 40px; " type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </a>
                        <c:set var="p" value="${requestScope.listP}"/>
                        <form id="formupdate" action="updatep">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label> 
                                    <input value="${p.id}" name="id" type="text" class="form-control" readonly required>
                                </div> 
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${p.title}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group" style="display: flex;
                                     align-items: center;
                                     justify-content: space-between">
                                    <label style="margin-right: 20px">Image</label>
                                    <div id="imageContainer">
                                        <c:forEach var="img" items="${p.img}">
                                            <img style="width: 200px;
                                                 height: auto;
                                                 margin-right: 10px;" src="${img}" multiple>
                                        </c:forEach>
                                    </div>
                                    <input  id="imageInput" name="image" type="file" multiple>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${p.price}00" name="price" type="number" step="0.01" min="0" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Describe</label>
                                    <textarea style="height: 100px" name="describe" class="form-control" required>${p.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <textarea name="quantity" class="form-control" required>${p.quantity}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select style="padding: 4px 0" name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCC}" var="c">
                                            <option ${(p.category.id == c.id ? 'selected' : '')} value="${c.id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Manager</label>
                                    <select style="padding: 4px 0" name="manager" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listU}" var="u">
                                            <option ${(p.account.id == u.id ? 'selected' : '')} value="${u.id}">${u.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input onclick="submitForm()" type="button" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>

            function submitForm() {
                var m = confirm("Bạn có chắc muốn thay đổi thông tin sản phẩm ?");

                if (m) {
                    document.getElementById("formupdate").submit();
                }
            }

            $("#imageInput").on("change", function () {
                // Get the selected files
                var files = $(this)[0].files;

                // Clear existing images
                $("#imageContainer").empty();

                // Display the new selected images
                for (var i = 0; i < files.length; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var imgElement = $("<img>").attr({
                            "style": "width: 200px; height: auto; margin-right: 10px;",
                            "src": e.target.result
                        });
                        $("#imageContainer").append(imgElement);
                    };
                    reader.readAsDataURL(files[i]);
                }
            });
        </script>
    </body>
</html>