<%-- 
    Document   : managerProduct
    Created on : Mar 6, 2024, 11:23:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Product</title>
        <link rel="icon" href="./img/logo/logoPage.jpg" type="image/jpg"/>
        <link rel="stylesheet" href="./fonts/themify-icons/themify-icons.css"/>
        <link rel="stylesheet" href="./css/bootstrap.min.css"/>
        <style>
            .container {
                width: 90%; /* Thay đổi kích thước container */
                margin: 0 auto; /* Canh giữa container */
            }

            .container-lg {
                width: 95%; /* Độ rộng lớn hơn */
                max-width: 1300px; /* Giới hạn độ rộng tối đa */
                margin: 0 auto; /* Canh giữa container */
            }

            /* Style cho promo-bar */
            .promo-bar {
                background-color: #283672;
                color: #fff;
                padding: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .promo-bar h2 {
                color: #fff;
                text-transform: uppercase;
                font-weight: bold;
                font-size: 24px;
                margin-bottom: 10px;
            }

            /* Style cho nút thêm mới */
            .promo-bar button {
                background-color: #28a745;
                border: none;
                color: #fff;
                padding: 5px 10px;
                border-radius: 5px;
                cursor: pointer;
            }

            .promo-bar button:hover {
                background-color: #218838;
            }

            /*CSS cho form*/
            .form-container {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                z-index: 1000;
                display: none;
                width: 600px;
                max-height: 850px; 
                overflow-y: auto;
            }

            .form-container td {
                color:#283672
            }

            .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                cursor: pointer;
                font-size: 20px;
                color: #aaa;
            }

            /* Hiệu ứng hover cho nút đóng */
            .close-btn:hover {
                color: red;
            }

            .form-container span {
                color: #283672;
                font-size: 25px; /* Kích thước font cho tiêu đề của form */
                font-weight: bold;
            }

            .form-container table {
                width: 100%;
            }

            .form-container table td {
                padding: 10px 0;
            }

            .form-container input[type="text"],
            .form-container input[type="number"],
            .form-container select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .form-container input[type="checkbox"] {
                margin-right: 5px;
            }

            .form-container input[type="submit"] {
                background-color: #4CAF50; /* Màu nền cho nút submit */
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .form-container input[type="submit"]:hover {
                background-color: #45a049; /* Hiệu ứng hover cho nút submit */
            }

            /* Style cho container chứa nút */
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }


            /* Style cho bảng sản phẩm */
            .table {
                width: 100%;
                margin-top: 20px;
            }

            /* Style cho các nút Edit và Delete */
            .btn-edit {
                background-color: #ffc107;
                color: #212529;
            }

            .btn-delete {
                background-color: #dc3545;
                color: #fff;
            }

            /* Responsive styling */
            @media (max-width: 768px) {
                .promo-bar {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .promo-bar button {
                    margin-top: 10px;
                }
            }

        </style>
    </head>
    <body>
        <div class="container-lg">
            <div class="promo-bar">
                <h2>Manage Product</h2>
                <button id="showFormBtn" class="btn btn-primary">
                    <i class="plus_icon ti-plus"></i>
                    Thêm mới
                </button>
                <div id="addProductForm" class="form-container">
                    <span class="close-btn">&times;</span>
                    <span>Thêm mới sản phẩm</span>
                    <form action="add" method="post">
                        <table>
                            <tr>
                                <td>Tên sản phẩm</td>
                                <td><input type="text" id="name" name="name" required></td>
                            </tr>
                            <tr>
                                <td>Brand</td>
                                <td>
                                    <select id="brand" name="brand" required>
                                        <option value="">Select Brand</option>
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.name}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Màu sắc</td>
                                <td><input type="text" id="color" name="color" required></td>
                            </tr>
                            <tr>
                                <td>Giá</td>
                                <td><input type="number" id="price" name="price" required></td>
                            </tr>
                            <tr>
                                <td>Link ảnh</td>
                                <td><input type="text" id="image_url" name="image_url" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="text" id="image_url2" name="image_url2" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="text" id="image_url3" name="image_url3" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="text" id="image_url4" name="image_url4" required></td>
                            </tr>
                            <tr>
                                <td>Size</td>
                                <td>
                                    <input type="checkbox" id="size_39" name="size_39" value="39">
                                    <label for="size_39">39</label>
                                    <input type="number" id="quantity_39" name="quantity_39" min="0" placeholder="Số lượng">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="checkbox" id="size_40" name="size_40" value="40">
                                    <label for="size_40">40</label>
                                    <input type="number" id="quantity_40" name="quantity_40" min="0" placeholder="Số lượng">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="checkbox" id="size_41" name="size_41" value="41">
                                    <label for="size_41">41</label>
                                    <input type="number" id="quantity_41" name="quantity_41" min="0" placeholder="Số lượng">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="checkbox" id="size_42" name="size_42" value="42">
                                    <label for="size_42">42</label>
                                    <input type="number" id="quantity_42" name="quantity_42" min="0" placeholder="Số lượng">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="checkbox" id="size_43" name="size_43" value="43">
                                    <label for="size_43">43</label>
                                    <input type="number" id="quantity_43" name="quantity_43" min="0" placeholder="Số lượng">
                                </td>
                            </tr>
                        </table>
                        <div class="btn-container">
                            <input type="submit" value="Thêm sản phẩm">
                        </div>
                    </form>
                </div>


                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var addProductForm = document.getElementById('addProductForm');
                        var showFormBtn = document.getElementById('showFormBtn');
                        var closeBtn = document.querySelector('.close-btn');

                        // Hiển thị form khi nút "Thêm mới" được click
                        showFormBtn.addEventListener('click', function () {
                            addProductForm.style.display = 'block';
                        });

                        // Đóng form khi nút đóng được click
                        closeBtn.addEventListener('click', function () {
                            addProductForm.style.display = 'none';
                        });
                    });

                </script>

            </div>
            <div class="mt-4">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th >Image</th>
                            <th class="text-center">Sizes</th>
                            <th class="text-center">Quantity</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listP}" var="o">
                            <tr>
                                <td>${o.product_id}</td>
                                <td>${o.name}</td>
                                <td>${o.price}</td>
                                <td><img src="${o.image_url}" alt="Product Image" style="max-height: 100px;"></td>
                                <td>
                                    <ul>
                                        <c:forEach items="${listPS}" var="s">
                                            <c:if test="${s.product_id == o.product_id}">
                                                <li>${s.size}</li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </td>
                                <td>
                                    <ul>
                                        <c:forEach items="${listPS}" var="s">
                                            <c:if test="${s.product_id == o.product_id}">
                                                <li>${s.size}: ${s.quantity}</li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>
                                </td>
                                <td class="text-right">
                                    <a href="load?product_id=${o.product_id}" class="btn btn-primary btn-sm">
                                        <i class="pencil_icon ti-pencil"></i>
                                    </a>
                                    <a href="delete?product_id=${o.product_id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?')">
                                        <i class="trash_icon ti-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-center" style="padding: 20px 0 40px 0">
                    <button class="btn btn-info" onclick="window.location.href = 'home'">
                        <i class="arrow_left_icon ti-arrow-left"></i>
                        Quay lại trang chủ
                    </button>
                </div>

            </div>
        </div>
        <!-- Javascript -->
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>
</html>
