<%-- 
    Document   : ManageAccount
    Created on : Mar 9, 2024, 11:41:24 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Account</title>
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
        <!-- Admins -->
        <div class="container-lg">
            <div class="promo-bar">
                <h2>Manage Account Admin</h2>
            </div>
            <div class="mt-4">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listA}" var="o">
                            <tr>
                                <td>${o.admin_id}</td>
                                <td>${o.username}</td>
                                <td>${o.password}</td>
                                <td>${o.firstname}</td>
                                <td>${o.lastname}</td>
                                <td>${o.email}</td>
                                <td class="text-right">
                                    <a href="deleteAccount?admin_id=${o.admin_id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?')">
                                        <i class="trash_icon ti-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Users -->
        <div class="container-lg">
            <div class="promo-bar">
                <h2>Manage Account User</h2>
            </div>
            <div class="mt-4">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Họ</th>
                            <th>Tên</th>
                            <th>Giới tính</th>
                            <th>Email</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listU}" var="o">
                            <tr>
                                <td>${o.user_id}</td>
                                <td>${o.username}</td>
                                <td>${o.password}</td>
                                <td>${o.firstname}</td>
                                <td>${o.lastname}</td>
                                <td>${o.gender ? "Nam" : "Nữ"}</td>
                                <td>${o.email}</td>
                                <td>${o.address}</td>
                                <td>${o.phone_number}</td>
                                <td class="text-right">
                                    <a href="deleteAccount?user_id=${o.user_id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?')">
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
