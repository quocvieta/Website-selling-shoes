/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function openSearchSidebar() {
    document.getElementById("searchSidebar").style.display = "block"; // Di chuyển cửa sổ vào vị trí hiển thị
}

function closeSearchSidebar() {
    document.getElementById("searchSidebar").style.display = "none"; // Di chuyển cửa sổ ra khỏi màn hình
}

/* SLIDER move */

var index = 0;
var slides = document.getElementsByClassName("slide"); // Lấy tất cả các ảnh trong slider

// Ẩn tất cả các ảnh trừ ảnh đầu tiên
for (var i = 1; i < slides.length; i++) {
    slides[i].style.display = "none";
}

// Hàm hiển thị ảnh tiếp theo
function nextSlide() {
    // Ẩn ảnh hiện tại
    slides[index].style.display = "none";
    // Tăng chỉ số lên 1 và quay lại đầu nếu đã đến ảnh cuối cùng
    index = (index + 1) % slides.length;
    // Hiển thị ảnh mới
    slides[index].style.display = "block";
}

// Thiết lập hàm nextSlide() được gọi tự động sau một khoảng thời gian
setInterval(nextSlide, 3000); // 3000 milliseconds = 3 seconds


function minusQuantity() {
    var quantityInput = document.getElementById("quantity");
    var currentValue = parseInt(quantityInput.value);
    if (currentValue > 1) {
        quantityInput.value = currentValue - 1;
    }
}

function plusQuantity() {
    var quantityInput = document.getElementById("quantity");
    var currentValue = parseInt(quantityInput.value);
    quantityInput.value = currentValue + 1;
}



document.addEventListener("DOMContentLoaded", function() {
    // Lấy tất cả các phần tử có class "pro_price"
    var priceElements = document.getElementsByClassName("pro_price");

    // Duyệt qua từng phần tử và định dạng giá tiền
    for (var i = 0; i < priceElements.length; i++) {
        var priceElement = priceElements[i];
        var price = parseFloat(priceElement.textContent);

        // Định dạng số tiền theo định dạng mong muốn (ví dụ: 2.600.000)
        var formattedPrice = new Intl.NumberFormat('vi-VN').format(price);

        // Gán lại giá trị đã định dạng vào phần tử HTML
        priceElement.textContent = formattedPrice + "₫";
    }
});



