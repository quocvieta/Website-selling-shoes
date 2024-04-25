<%-- 
    Document   : edit
    Created on : Mar 8, 2024, 5:44:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="icon" href="./img/logo/logoPage.jpg" type="image/jpg"/>
        <link rel="stylesheet" href="./fonts/themify-icons/themify-icons.css"/>
        <link rel="stylesheet" href="./css/bootstrap.min.css"/>
        <style>
            #editProduct {
                width: 60%;
                margin: 0 auto;
            }

            .form-container {
                background-color: #f2f2f2;
                padding: 50px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-container span {
                background-color: #283672;
                color: #fff;
                text-align: center;
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 20px;
                padding: 20px 0;
                display: block;
            }

            table {
                width: 100%;
            }

            table td {
                padding: 10px 0;
            }

            input[type="text"],
            input[type="number"],
            select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                margin-top: 5px;
            }

            label {
                margin-left: 10px;
            }

            .btn-container {
                text-align: center;
                margin-top: 20px;
            }

            input[type="submit"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            input[type="checkbox"] {
                margin-right: 5px;
            }

        </style>
    </head>
    <body>
        <div id="editProduct" class="form-container">
            <span>Cập nhật sản phẩm</span>
            <form action="edit" method="post">
                <table>
                    <tr>
                        <td style="font-weight: bold">Mã sản phẩm</td>
                        <td><input value="${detail.product_id}" type="text" id="product_id" name="product_id" readonly required></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">Tên sản phẩm</td>
                        <td><input value="${detail.name}" type="text" id="name" name="name" required></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">Brand</td>
                        <td>
                            <select id="brand" name="brand" required>
                                <option value="">Select Brand</option>
                                <c:forEach items="${listC}" var="o">
                                    <option value="${o.name}" <c:if test="${o.name eq detail.brand}">selected</c:if>>${o.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">Màu sắc</td>
                        <td><input value="${detail.color}" type="text" id="color" name="color" required></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">Giá</td>
                        <td><input value="${detail.price}" type="number" id="price" name="price" required></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">Link ảnh</td>
                        <td>
                            <c:forEach items="${listPI}" var="o" varStatus="status">
                                <input value="${o.image_url}" type="text" id="image_url${status.index + 1}" name="image_url${status.index + 1}" required>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold">Size</td>
                        <td>
                            <c:forEach items="${listPS}" var="o">
                                <input type="checkbox" id="size_${o.size}" name="size_${o.size}" value="${o.size}" <c:if test="${o.quantity > 0}">checked</c:if>>
                                <label for="size_${o.size}">${o.size}</label>
                                <input type="number" id="quantity_${o.size}" name="quantity_${o.size}" min="0" placeholder="Số lượng" value="${o.quantity}">
                            </c:forEach>
                        </td>
                    </tr>
                </table>
                <div class="btn-container">
                    <input type="submit" value="Cập nhật sản phẩm">
                </div>
            </form>
        </div>
        <!-- Javascript -->
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>
</html>
