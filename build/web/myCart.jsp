<%-- 
    Document   : cart
    Created on : Mar 9, 2024, 8:30:34 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link rel="icon" href="./img/logo/logoPage.jpg" type="image/jpg"/>
        <link rel="stylesheet" href="./fonts/themify-icons/themify-icons.css"/>
        <link rel="stylesheet" href="./css/bootstrap.min.css"/>
        <style>
            /* CSS cho phần sidebar */
            .sidebar {
                width: 50%; /* Thiết lập chiều rộng là 50% của màn hình */
                float: left; /* Căn lề bên trái */
            }

            /* CSS cho phần main */
            .main {
                width: 50%; /* Chiều rộng còn lại của màn hình */
                float: right; /* Căn lề bên phải */
            }

            /* CSS cho các phần tử con bên trong sidebar và main */
            .sidebar-content,
            .main-header,
            .section {
                padding: 20px; /* Thêm khoảng cách lề 20px xung quanh các phần tử con */
                box-sizing: border-box; /* Đảm bảo rằng padding không làm thay đổi kích thước tổng của phần tử */
            }

            .product-table {
                width: 100%;
                border-collapse: collapse;
            }

            .product-table th,
            .product-table td {
                padding: 8px; /* Thay đổi giá trị này để điều chỉnh khoảng cách giữa các số */
                border: none;
                text-align: left;
            }

            .product-table th {
                background-color: #f2f2f2;
            }

            .product-image {
                width: 400px; /* Đặt chiều rộng mong muốn, ví dụ 50px */
            }

            .product-thumbnail-wrapper {
                width: 50%;
            }

            img {
                max-width: 100%;
            }

            .product-description {
                padding-left: 20px; /* Dịch cột sang trái 20px */
            }

            .product-description-name {
                font-weight: bold;
            }

            .total-line-table {
                width: 100%;
                border-collapse: collapse;
            }

            .total-line-name {
                text-align: right;
                font-size: 30px;
            }

            /* CSS cho các phần tử con bên trong sidebar */
            .order-summary-sections,
            .section-header,
            .order-total,
            .continue-shopping {
                margin-bottom: 20px; /* Thêm khoảng cách dưới 20px cho các phần tử con */
            }

            .continue-shopping {
                margin-top: 50px;
                text-align: center;
            }

            /* CSS cho các nút và liên kết */
            .button,
            a {
                display: inline-block; 
                padding: 10px 20px; 
                background-color: #007bff; 
                color: #fff; 
                text-decoration: none; 
                border: none; /* Không viền */
                border-radius: 5px; 
                cursor: pointer;
                transition: background-color 0.3s; 
            }

            .button:hover,
            a:hover {
                background-color: #fff; 
                color: #0056b3; 
                text-decoration: none; 
                border: 1px solid #0056b3;
            }

            /* CSS cho các input */
            input[type="text"],
            input[type="email"],
            input[type="submit"] {
                width: 100%; /* Chiều rộng 100% của phần tử cha */
                padding: 10px; /* Thêm padding 10px từ trên và dưới, 20px từ trái và phải */
                margin-bottom: 10px; /* Thêm khoảng cách dưới 10px cho các input */
                border: 1px solid #ccc; /* Viền 1px màu xám nhạt */
                border-radius: 5px; /* Bo góc với bán kính 5px */
                box-sizing: border-box; /* Đảm bảo rằng padding và border không làm thay đổi kích thước tổng của phần tử */
            }

            .trash-btn {
                border: none; /* Loại bỏ border của icon-trash */
                background: none;
                font-size: 21px;
            }

            .trash-icon:hover {
                color: red; /* Khi hover vào icon-trash, thay đổi màu thành đỏ */
            }
            
            .submit-order {
                text-align: center;
            }
            
            /* CSS cho các input submit */
            input[type="submit"] {
                width: 26%;
                background-color: #28a745;
                color: #fff;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #fff; 
                color: #218838; 
                text-decoration: none; 
                border: 1px solid #218838;
            }

            /* CSS cho alert success */
            .alert-success {
                background-color: #d4edda; /* Màu nền là màu xanh lá cây nhạt */
                color: #155724; /* Màu chữ là màu xanh lá cây đậm */
                padding: 15px; /* Thêm padding 15px từ trên và dưới, 20px từ trái và phải */
                margin-bottom: 20px; /* Thêm khoảng cách dưới 20px cho các alert */
                border-radius: 5px; /* Bo góc với bán kính 5px */
            }

        </style>
    </head>
    <body>
        <div class="content">
            <div class="sidebar col-md-6">
                <div class="sidebar-content">
                    <div class="order-summary-sections">
                        <div class="order-list">
                            <table class="product-table">
                                <tbody>
                                    <c:set var="o" value="${requestScope.cart}"/>
                                    <c:forEach items="${o.items}" var="i">
                                        <tr>
                                            <td class="product-image">
                                                <div class="product-thumbnail-wrapper">
                                                    <img src="${i.product.image_url}" alt="alt"/>
                                                </div>
                                            </td>
                                            <td class="product-description">
                                                <span class="product-description-name">${i.product.name}</span><br>
                                                <span class="product-description-size">${i.size}</span>
                                            </td>
                                            <td class="product-quantity" style="text-align: center">
                                                ${i.quantity}
                                            </td>
                                            <td class="product-price">
                                                <span class="order-summary-emphasis">
                                                    <fmt:formatNumber>${i.price}</fmt:formatNumber>
                                                    </span>
                                                </td>
                                                <td style="text-align: center">
                                                    <form action="process" method="POST">
                                                        <input type="hidden" name="product_id" value="${i.product.product_id}">
                                                        <input type="hidden" name="size" value="${i.getSize()}">
                                                    <button type="submit" class="trash-btn" value="remove">
                                                        <i class="trash-icon ti-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="order-total">
                            <table class="total-line-table">
                                <tfoot class="total-line-table-footer">
                                    <tr class="total-line">
                                        <td class="total-line-name payment-due-label">
                                            <span class="payment-due-label-total">Tổng cộng</span>
                                        </td>
                                        <td class="total-line-name payment-due">
                                            <span class="payment-due-currency">VND</span>
                                            <span class="payment-due-price">
                                                <fmt:formatNumber>${o.totalMoney}</fmt:formatNumber>
                                                </span>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                            <div class="continue-shopping">
                                <a href="home" class="button">
                                    <i class="back_icon ti-back-left"></i>
                                    Tiếp tục mua hàng
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main col-md-6">
                    <div class="main-header">
                        <h1 class="logo-text">Viet Sneakers</h1>
                    </div>
                    <div class="section">
                        <div class="section-header">
                            <h2>Thông tin giao hàng</h2>
                        </div>
                    <c:choose>
                        <c:when test="${sessionScope.acc == null}">
                            <div class="section-title">
                                <p>
                                    Bạn đã có tài khoản?
                                    <a href="login.jsp">Đăng nhập</a>
                                </p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="section-content">
                                <form accept-charset="UTF-8" action="checkout">
                                    <div>
                                        <input required type="text" name="firstname" placeholder="Họ">
                                    </div>
                                    <div>
                                        <input required type="text" name="lastname" placeholder="Tên">
                                    </div>
                                    <div>
                                        <input required type="email" name="email" placeholder="Email">
                                    </div>
                                    <div>
                                        <input required type="text" name="address" placeholder="Địa chỉ">
                                    </div>
                                    <div>
                                        <input required type="text" name="phone_number" placeholder="Số điện thoại" pattern="[0-9]{10,11}" title="Vui lòng nhập số điện thoại hợp lệ (10 hoặc 11 chữ số)">
                                    </div>
                                    <div>
                                        <div class="submit-order">
                                            <input type="submit" value="Hoàn tất đơn hàng">
                                        </div>
                                    </div>
                                </form>
                                <c:if test="${not empty mess}">
                                    <div class="alert alert-success" role="alert">
                                        ${mess}
                                    </div>
                                </c:if>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Javascript -->
        <script src="./js/mycode.js"></script>
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>
</html>
