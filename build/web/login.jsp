<%-- 
    Document   : login
    Created on : Mar 4, 2024, 11:31:13 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Viet Sneakers</title>
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


            /* Begin: Login */
            #login-account {
                padding-top: 150px;
            }

            @media (min-width: 992px) {
                .wrapbox-heading-account {
                    height: 60vh;
                    border-right: 1px solid #ededed;
                }
            }

            .wrapbox-heading-account {
                display: flex;
                display: -webkit-flex;
                -webkit-align-items: center;
                align-items: center;
            }

            @media (min-width: 992px) {
                .wrapbox-heading-account .header-page {
                    padding-bottom: 70px;
                }
            }

            .wrapbox-heading-account .header-page {
                position: relative;
            }

            .wrapbox-heading-account .header-page h1 {
                color: #272727;
                font-size: 40px;
                font-weight: 700;
                margin: 0px 0;
                line-height: initial;
            }

            .wrapbox-heading-account .header-page:after {
                content: "";
                background: #000;
                display: block;
                width: 60px;
                height: 4px;
                margin-top: 30px;
            }

            @media (min-width: 1200px) {
                .wrapbox-content-account {
                    padding: 150px 15px 100px 50px;
                    justify-content: center;
                    height: 100vh;
                }
            }

            .large_form {
                margin-bottom: 30px;
            }

            .userbox input[type=text],
            .userbox input[type=date],
            .userbox input[type=email],
            .userbox input[type=password] {
                width: 100%;
                height: 55px;
                border: 1px solid transparent;
                background: #ededed;
                color: #272727;
                padding: 0 50px;
                font-weight: 500;
                -webkit-appearance: none;
            }

            .userbox .action_bottom {
                padding: 0;
            }

            .action_account_custommer .action_bottom,
            .action_account_custommer .req_pass {
                display: inline-block;
                vertical-align: middle;
            }


            .button {
                display: block;
                left: -2px;
                top: 0;
                right: -2px;
                bottom: 0;
                z-index: -1;
                background-color: #F3B61A;
            }

            .userbox .action_bottom .btn {
                display: inline-block;
                border-radius: 0;
                padding: 0 30px;
                height: 45px;
                line-height: 45px;
                text-transform: uppercase;
                font-weight: 600;
                background: transparent;
            }

            .action_account_custommer .req_pass {
                margin-left: 20px;
            }

            .req_pass {
                color: #959898;
                font-weight: 500;
            }

            a {
                color: #272727;
                text-decoration: none;
                outline: none;
                font-size: 16px;
            }

            .come-back {
                margin-top: 35px;
                display: block;
                font-weight: 500;
            }

            .come-back i {
                margin-right: 10px;
            }

            .arrow_left_icon {
                display: inline-block;
            }
            /* End: Login */

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
        <!-- Begin: Menu -->
        <jsp:include page="menu.jsp"></jsp:include>
            <!-- End: footer -->

            <!-- Begin: login-account -->
            <div id="login-account">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-xs-12 wrapbox-heading-account">
                            <div class="header-page clearfix">
                                <h1>Đăng nhập / Đăng ký</h1>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 wrapbox-content-account">
                            <div id="customer-login">
                                <div id="login" class="userbox">
                                    <!-- Form đăng nhập -->
                                    <form accept-charset="UTF-8" action="login" method="post" id="customer_login">
                                    <c:choose>
                                        <c:when test="${not empty mess}">
                                            <div class="alert alert-danger" role="alert">
                                                ${mess}
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty registerError}">
                                            <div class="alert alert-danger" role="alert">
                                                ${registerError}
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty success}">
                                            <div class="alert alert-success" role="alert">
                                                ${success}
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty failure}">
                                            <div class="alert alert-danger" role="alert">
                                                ${failure}
                                            </div>
                                        </c:when>
                                    </c:choose>
                                    <div class="clearfix large_form">
                                        <input required type="text" value name="username" placeholder="Tên đăng nhập">
                                    </div>
                                    <div class="clearfix large_form">
                                        <input required type="password" value name="password" placeholder="Mật khẩu" size="16">
                                    </div>
                                    <div class="clearfix action_account_custommer">
                                        <div class="action_bottom button dark">
                                            <input class="btn btn-signin" type="submit" value="Đăng nhập">
                                        </div>
                                        <div class="req_pass">
                                            <a href="register" id="register_link" title="Đăng ký">Đăng ký</a>
                                        </div>
                                    </div>
                                </form>

                                <!-- Form đăng ký -->
                                <form accept-charset="UTF-8" id="register_form" style="display: none;" action="register" method="post">
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px;" required type="text" name="firstname" placeholder="Họ">
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px" required type="text" name="lastname" placeholder="Tên">
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <label><input style="" type="radio" name="gender" value="male"> Nam</label>
                                        <label><input style="" type="radio" name="gender" value="female"> Nữ</label>
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px" required type="email" name="email" placeholder="Email">
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px" required type="text" name="address" placeholder="Địa chỉ">
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px" required type="text" name="phonenumber" placeholder="Số điện thoại" pattern="[0-9]{10,11}" title="Vui lòng nhập số điện thoại hợp lệ (10 hoặc 11 chữ số)">
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px" required type="text" name="username" placeholder="Tài khoản">
                                    </div>
                                    <div class="clearfix large_form" style="margin-bottom: 15px">
                                        <input style="height: 40px" required type="password" name="password" placeholder="Mật khẩu">
                                    </div>
                                    <div class="clearfix large_form" style="">
                                        <input style="height: 40px" required type="password" name="repassword" placeholder="Nhập lại mật khẩu" 
                                               title="${not empty registerError ? registerError : ''}">
                                    </div>
                                    <div class="clearfix action_account_custommer">
                                        <div class="action_bottom button dark">
                                            <input class="btn btn-register" type="submit" value="Đăng ký">
                                        </div>
                                    </div>
                                    <div class="clearfix req_pass">
                                        <a class="come-back" href="home">
                                            <i class="arrow_left_icon ti-arrow-left"></i>
                                            Quay lại trang chủ
                                        </a>
                                    </div>
                                </form>

                                <script>
                                    document.getElementById("register_link").addEventListener("click", function (event) {
                                        event.preventDefault();
                                        // Ẩn form đăng nhập
                                        document.getElementById("customer_login").style.display = "none";
                                        // Hiển thị form đăng ký
                                        document.getElementById("register_form").style.display = "block";
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: login-account -->

        <!-- Begin: footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- End: footer -->

        <!-- Javascript -->
        <script src="./js/mycode.js"></script>
        <script src="./js/Jquery.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </body>
</html>
