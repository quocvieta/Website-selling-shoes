<%-- 
    Document   : home
    Created on : Feb 26, 2024, 11:15:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viet Sneakers</title>
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



            /* Begin: Slider */

            #slider img {
                padding-top: 100px;
                width: 100%;
                height: auto;
            }

            /* End: Slider */



            /* Begin: Content */
            #content .content_title {
                text-align: center;
                padding: 30px 0;
            }

            .content_title a {
                color: #000;
                text-decoration: none;
                padding-bottom: 20px;
                border-bottom: 2px solid #F3B61A;
            }

            .pro-loop {
                display: block;
                position: relative;
                overflow: hidden;
                height: 100%;
                background: #fff;
                margin-bottom: 30px;
            }



            .content_product {
                text-align: center;
                padding: 20px;
            }

            .content_product img {
                width: 100%;
                height: auto;
                max-width: 100%;
                display: block;
                margin-bottom: 10px;
            }

            .content_product p {
                font-size: 14px;
                margin: 0;
                font-weight: 700;
            }

            .content_product_info {
                padding: 0 10px;
            }

            .content_product_info h3,
            .content_product_info p {
                margin-top: 0;/* Loại bỏ khoảng cách lề */
            }

            .content_product_info a {
                text-decoration: none;
                color: #000;
            }
            /* End: Content */



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

            <!-- Begin: slider -->
            <div id="slider">
                <img src="./img/slider/1.jpg" class="slide" />
                <img src="./img/slider/2.jpg" class="slide" />
                <img src="./img/slider/3.jpg" class="slide" />
            </div>
            <!-- End: slider -->


            <!-- Begin: content -->
            <div id="content">
                <div class="content_title">
                    <h2>
                        <a href="#">Sản Phẩm</a>
                    </h2>
                </div>

                <div class="row">
                <c:forEach items="${listP}" var="o" varStatus="loop">
                    <div class="col-md-3 col-sm-6 col-xs-6 pro-loop">
                        <div class="content_product">
                            <a href="detail?product_id=${o.product_id}">
                                <img src="${o.image_url}" alt="${o.name}">
                            </a>
                            <div class="content_product_info">
                                <h3>
                                    <a href="detail?product_id=${o.product_id}" title="${o.name}">
                                        ${o.name}
                                    </a>
                                </h3>
                                <p class="pro_price" id="formattedPrice">
                                    ${o.price}
                                </p>
                            </div>
                        </div>
                    </div>
                    <%-- Mở hàng mới sau mỗi 4 phần tử --%>
                    <c:if test="${loop.index % 4 == 3}">
                    </div><div class="row">
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <!-- End: content -->


        <!-- Begin: footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- End: footer -->

        <!-- Javascript -->
        <script src="./js/mycode.js"></script>
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>
</html>
