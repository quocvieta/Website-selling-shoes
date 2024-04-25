<%-- 
    Document   : detail
    Created on : Mar 2, 2024, 1:21:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product - Viet Sneakers</title>
        <link rel="icon" href="./img/logo/logoPage.jpg" type="image/jpg"/>
        <link rel="stylesheet" href="./fonts/themify-icons/themify-icons.css"/>
        <link rel="stylesheet" href="./css/bootstrap.min.css"/>
        <style>
            /* Reset CSS */
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                font-family: Arial, Helvetica, sans-serif;
            }


            #promo_bar {
                background: #283672;
                font-size: 13px;
                width: 100%;
                -webkit-transition: 0.3s;
                transition: 0.3s;
                position: fixed;
                top: 0;
                z-index: 1000;
                overflow: hidden;
                text-align: center;
                cursor: pointer;
            }

            #promo_bar a {
                display: block;
                padding: 10px 15px;
                color: #fff;
                text-decoration: none;
            }



            a {
                color: #272727;
                text-decoration: none;
                outline: none;
                transition: all 0.2s ease-in-out;
            }
            a {
                color: #337ab7;
                text-decoration: none;
            }
            a {
                background-color: transparent;
            }


            /* Begin: header */

            #header {
                background-color: #fff;
                position: fixed;
                margin-top: 30px;
                left: 0;
                right: 0;
                width: 100%;
                z-index: 1000;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            }

            .header_container {
                display: flex;
                justify-content: space-between;
            }

            .header_container {
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }

            .header_logo img{
                width: 150px;
                height: auto;
            }

            .desk_menu {
                position: relative;
            }

            #nav li {
                position: relative;
                list-style-type: none;
            }

            #nav li a {
                font-weight: bolder;
                text-transform: uppercase;
            }

            #nav .sub_nav {
                display: none;
                position: absolute;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3)
            }

            #nav .sub_nav a {
                padding: 0 30px;
                line-height: 30px;
                display: block;
            }

            #nav li:hover .sub_nav{
                display: block;
            }

            #nav .sub_nav li:hover a {
                color: #fff;
                background-color: #F3B61A;
            }

            .desk_menu > ul>li>a:hover:before, .desk-menu > ul>li.header_menu>a:before {
                opacity: 1;
                -webkit-transform: scale(1, 1);
                transform: scale(1, 1);
            }

            .desk_menu > ul>li>a:before {
                position: absolute;
                content: "";
                bottom: 0;
                left: 0;
                width: 100%;
                opacity: 0;
                -webkit-transform: scale(0, 1);
                transform: scale(0, 1);
                -webkit-transform-origin: left center;
                transform-origin: left center;
                border-bottom: 2px solid #F3B61A;
                -webkit-transition: opacity 0.3s, -webkit-transform 0.3s;
                transition: opacity 0.3s, -webkit-transform 0.3s;
                transition: transform 0.3s, opacity 0.3s;
                transition: transform 0.3s, opacity 0.3s, -webkit-transform 0.3s;
            }

            :before, :after {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

            .desk_menu > ul > li {
                display: inline-block;
                height: 100%;
                padding: 0;
                z-index: 5;
                margin-right: 10px;
            }

            .desk_menu > ul > li .header_menu > a {
                color: #000;
            }


            .desk_menu ul li a {
                color: #272727;
                text-decoration: none;
            }

            .desk_menu > ul > li > a {
                position: relative;
                z-index: 2;
                display: block;
                padding: 0 30px;
                line-height: 150px;
                width: 100%;
                height: 100%;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-weight: bolder;
                font-size: 13px;
            }

            .header_action {
                display: flex;
                justify-content: space-between;
                margin: auto 10px;
            }

            .action_acc,
            .action_search,
            .action_cart {
                display: inline-block;
                vertical-align: middle;
            }

            .action_search {
                margin-left: auto; /* Dịch cả phần tử sang bên phải */
            }

            .header_action a,
            .header_action .search_btn {
                text-decoration: none;
            }

            .search_btn {
                border: none;
                background: none;
                padding: 0;
                margin: 0;
                cursor: pointer;
            }

            .header_action .user_icon,
            .header_action .search_icon,
            .header_action .cart_icon {
                padding-left: 15px;
                color: #337ab7;
                font-size: 24px;
            }

            #searchSidebar {
                display: none; /* Ẩn cửa sổ tìm kiếm ban đầu */
                position: fixed;
                top: 0;
                right: 0;
                width: 500px; /* Độ rộng của cửa sổ tìm kiếm */
                height: 100%;
                background-color: white; /* Màu nền của cửa sổ tìm kiếm */
                transition: right 200ms; /* Hiệu ứng chuyển động khi mở và đóng cửa sổ */
                z-index: 999; /* Đảm bảo cửa sổ tìm kiếm hiển thị trên tất cả các phần tử khác */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Thêm viền shadow */
            }

            #searchSidebar .search_input {
                background: rgba(0, 0, 0, 0.1);
            }

            .search_content {
                padding: 20px;
            }

            .search_input {
                width: calc(100% - 80px); /* Độ rộng của input trừ đi kích thước của nút đóng */
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .sub_search_btn {
                padding: 10px 5px;
                font-weight: bolder;
            }

            .close_search {
                position: absolute;
                top: 10px;
                right: 10px;
                background: none;
                border: none;
                font-size: 30px;
                cursor: pointer;
            }
            /* End: header */


            /* Begin: Product */
            #product {
                padding-top: 200px;
            }

            #detail_product {
                padding-top: 100px;
            }

            .product_detail_main {
                margin-bottom: 40px;
            }

            .product_gallery {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
            }

            .pr_style_02 .product_image_detail {
                width: 100%;
                padding-left: 0px;
                position: relative;
            }

            .product_image_detail {
                width: 91%;
                padding-left: 10px;
                position: relative;
            }

            .product_image_detail ul {
                margin: 0;
            }

            ul {
                padding: 0;
                list-style-type: none;
            }

            ul, ol {
                margin-top: 0;
                margin-bottom: 10px;
            }

            @media (min-width: 992px) {
                .pr_style_02 .product_gallery_item:nth-of-type(2n+1) {
                    clear: both;
                }
            }

            @media (min-width: 992px) {
                .pr_style_02 .product_gallery_item {
                    width: 50%;
                    padding-right: 5px;
                    float: left;
                }
            }

            .pr_style_02 .product_gallery_item {
                margin-bottom: 10px;
            }

            .product_gallery_item {
                text-align: center;
                margin-bottom: 10px;
            }

            .pr_style_02 .product_gallery_item img {
                border: 1px solid #f7f7f8;
            }

            img {
                max-width: 100%;
            }

            img {
                vertical-align: middle;
            }

            img {
                border: 0;
            }

            @media (min-width: 992px) {
                .pr_style_02 .product_gallery_item:nth-of-type(2n) {
                    padding-left: 5px;
                    padding-right: 0;
                }
            }

            @media (min-width: 992px) {
                .product-content-desc {
                    position: -webkit-sticky;
                    position: sticky;
                    top: 80px;
                }
            }

            @media (min-width: 992px) {
                .col-md-4 {
                    width: 33.33333333%;
                }
            }

            .col-md-4, .col-sm-12, .col-xs-12 {
                position: relative;
                min-height: 1px;
                padding-right: 15px;
                padding-left: 15px;
            }

            .product_title {
                padding: 0 0 10px;
                border-bottom: 1px dotted #dfe0e1;
            }

            .product_title h1 {
                font-size: 20px;
                font-weight: 700;
                margin: 0 0 5px;
                line-height: initial;
            }

            h1 {
                font-size: 36px;
                color: #272727;
            }

            .product_price {
                padding: 10px 0;
                border-bottom: 1px dotted #dfe0e1;
            }

            .product_price span.pro_price {
                font-size: 18px;
                opacity: .92;
                font-weight: bold;
            }

            .swatch {
                padding: 10px 0;
                width: 100%;
                float: left;
                border-bottom: 1px dotted #dfe0e1;
            }

            .swatch .header_size {
                margin: 0 0 8px;
                font-size: 13px;
                text-align: left;
                line-height: initial;
            }

            b{
                font-weight: 700;
            }

            select[name="size"] {
                color: white;
                border: none;
                width: auto;
                padding: 5px;
                height: 50px;
                appearance: none;
                -webkit-appearance: none;
                background-image: none;
                outline: none; /* Add this line to remove outline when selected */
            }

            select[name="size"] option {
                background-color: white;
                color: black;
                border: 1px solid #000;
                display: inline-block;
                font-weight: bolder;
                margin-right: 10px;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
            }

            select[name="size"] option:checked {
                background-color: black;
                color: white;
            }

            select[name="size"] option:hover,
            select[name="size"] option:focus {
                background-color: black;
                color: white;
            }

            .selector_actions {
                width: 100%;
                margin-top: 15px;
            }

            .quantity_area {
                margin-top: 10px;
                margin-bottom: 15px;
            }

            .quantity_area input.qty_btn {
                float: left;
                background: #f3f4f4;
                border: solid 1px #f3f4f4;
                cursor: pointer;
                font-weight: 600;
                font-size: 16px;
                outline: none;
                height: 32px;
                width: 32px;
                text-align: center;
                border-radius: 0;
            }

            input, button {
                font-family: inherit;
                font-size: inherit;
                line-height: inherit;
            }

            input {
                line-height: normal;
            }

            input {
                margin: 0;
                font: inherit;
                color: inherit;
            }

            .quantity_area input#quantity {
                background: #fff;
                font-weight: 600;
                height: 32px;
                padding: 0;
                text-align: center;
                width: 70px;
                border: 1px solid #f3f4f4;
                border-left: none;
                border-right: none;
                border-radius: 1px;
                float: left;
                -webkit-appearance: none;
            }

            .row_flex {
                display: -webkit-flex;
                display: flex;
                -webkit-align-items: center;
                align-items: center;
            }

            button.btn_addtocart {
                border: 1px solid #272625;
                background-color: #272625;
            }

            button.btn_addtocart  {
                color: #fff;
                font-size: 14px;
                font-weight: bold;
                text-transform: uppercase;
                box-shadow: none;
                padding: 14px 15px;
                line-height: 22px;
                width: 65%;
                margin-bottom: 15px;
            }


            /* End: Product */


            /* Begin: Footer */
            #footer {
                background-color: #5764a8;
            }

            #footer .footer_title {
                text-align: center;
                padding: 30px 0;
            }

            .footer_title a {
                color: #fff;
                text-decoration: none;
                padding-bottom: 20px;
                border-bottom: 2px solid #F3B61A;
            }

            .footer_img img {
                width: 100%;
                height: auto;
            }

            .footer_container {
                padding: 30px 0;
            }

            .footer_container p,
            .footer_container li {
                color: #fff;
            }

            .footer_container h4 {
                color: #fff;
                font-size: 15px;
                letter-spacing: 0.02em;
                margin: 0 0 20px;
                position: relative;
                line-height: 22px;
                text-transform: uppercase;
            }

            .footer_container_content li {
                list-style: none;
            }

            .footer_container_content li::before {
                content: "-";
                color: #F3B61A;
                font-size: 18px;
                font-weight: bolder;
                margin-right: 10px;
            }

            .footer_copyright {
                padding: 24px 0;
                border-top: 1px dashed #e0d9d6;
            }

            .footer_copyright p{
                text-align: center;
                color: #fff;
            }

            .footer_copyright a {
                text-decoration: none;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <!-- Begin: product -->
            <div id="product">
                <div class="container">
                    <div class="row product_detail_wrapper">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="row product_detail_main pr_style_02">
                                <div class="col-md-8 col-sm-12 col-xs-12">
                                    <div class="product_gallery">
                                        <div class="product_image_detail box__product-gallery scroll">
                                            <ul id="slider_product" class="site-box-content slide_product clearfix">
                                            <c:forEach items="${listPI}" var="o">
                                                <li class="product_gallery_item gallery-item current">
                                                    <img class="product_image_feature" src="${o.image_url}" alt="aaa">
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div id="detail_product" class="col-md-4 col-sm-12 col-xs-12 product_content_desc">
                                <div class="product_title">
                                    <h1>${detail.name}</h1>
                                    <h6>${detail.product_id}</h6>
                                </div>
                                <div class="product_price">
                                    <span class="pro_price" id="formattedPrice">
                                        ${detail.price}
                                    </span>
                                </div>
                                <form name="f" id="add_item_form" action="buy" method="post" class="variants clearfix">
                                    <div class="select_swatch clearfix">
                                        <div id="variant_swatch_0" class="swatch clearfix">
                                            <div class="header_size">
                                                <b>SIZE</b>
                                            </div>
                                            <div class="select_swap">
                                                <select name="size" size="${listPS.size()}" required>
                                                    <c:forEach items="${listPS}" var="o">
                                                        <option value="${o.size}">${o.size}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="selector_action">
                                        <div class="quantity_area clearfix">
                                            <input type="button" value="-" class="qty_btn" onclick="minusQuantity()">
                                            <input type="text" id="quantity" name="quantity" value="1" class="quantity_selector">
                                            <input type="button" value="+" class="qty_btn" onclick="plusQuantity()">
                                        </div>
                                        <div class="wrap_addcard clearfix">
                                            <div class="row_flex">
                                                <input type="hidden" name="product_id" value="${detail.product_id}">
                                                <button type="submit" id="add_to_card" class="add_to_cartProduct button btn_addtocart addtocart_modal" name="add">
                                                    <span>Thêm vào giỏ</span>
                                                    <!--<input style="background-color: #272625; border: none; width: 100%; height: 100%" type="submit" value="Thêm vào giỏ">-->
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <c:if test="${sessionScope.messError != null}" >
                                    <div class="alert alert-danger" role="alert">
                                        ${messError}
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: product -->

        <!-- Begin: footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- End: footer -->

        <!-- Javascript -->
        <script src="./js/mycode.js"></script>
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>
</html>

