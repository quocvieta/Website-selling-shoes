<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Begin: promo_bar -->
<div id="promo_bar">
    <a href="#content">
        <span>
            "MIỄN PHÍ VẬN CHUYỂN TOÀN QUỐC VỚI MỌI ĐƠN HÀNG"
        </span>
    </a>
</div>
<!-- End: promo_bar -->


<!-- Begin: header -->
<header id="header">
    <div class="row">
        <div class="container">
            <div class="header_container">
                <!-- header_logo -->
                <div class="header_logo">
                    <a href="index.html">
                        <h1 class="logo">
                            <img src="./img/logo/logoPage.jpg" alt="LOGO_Vietsneakers">
                        </h1>
                    </a>
                </div>

                <!-- header_nav -->
                <div class="header_nav">
                    <nav class="desk_menu">
                        <ul id="nav">
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                                <li class>
                                    <a href="#" title="Manager">Manager</a>
                                    <ul class="sub_nav">
                                        <li class>
                                            <a href="account" title="Manager Account">Manager Accounts</a>
                                        </li>
                                        <li class>
                                            <a href="manage" title="Manager Product">Manager Products</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <li class="header_menu">
                                <a href="home" title="Trang chủ">Trang chủ</a>
                            </li>
                            <li class>
                                <a href="#content" title="Sản phẩm">Sản phẩm</a>
                                <ul class="sub_nav">
                                    <c:forEach items="${listC}" var="o">
                                        <li><a href="category?category_id=${o.category_id}">${o.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </li>
                            <li class>
                                <a href="#footer" title="About us">About us</a>
                            </li>
                            <c:if test="${sessionScope.acc != null}">
                                <li class>
                                    <a href="logout" title="Logout">Logout</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>

                <!-- header_action -->
                <div class="header_action">
                    <div class="action_acc">
                        <a href="login.jsp">
                            <i class="user_icon ti-user"></i>
                        </a>
                    </div>
                    <div class="action_search">
                        <button class="search_btn" onclick="openSearchSidebar()">
                            <i class="search_icon ti-search"></i>
                        </button>
                    </div>
                    <div id="searchSidebar">
                        <div class="search_content">
                            <form action="search" method="post">
                                <h3>Tìm kiếm</h3>
                                <input value="${txtS}" name="txt" type="text" id="searchInput" class="search_input" placeholder="Tìm kiếm sản phẩm...">
                                <button class="sub_search_btn" type="submit">Tìm kiếm</button>
                            </form>
                            <button id="closeSearch" class="close_search" onclick="closeSearchSidebar()">&times;</button>
                        </div>
                    </div>
                    <div class="action_cart">
                        <a href="show">
                            <i class="cart_icon ti-shopping-cart"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- End: header -->
