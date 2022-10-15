<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="top">
                <div class="logo">
                    <a href="/trangchu"><img src="<c:url value='/images/logo.jpg'/>" alt="Brand Image"></a> 
                </div>
                <div class="close" id="close-btn">
                    <span class="material-symbols-outlined">close</span>
                </div>
            </div>

            <div class="sidebar">
                <a href="/admin" class="active">
                    <span class="material-symbols-outlined">dashboard</span>
                    <h3>Dashboard</h3>
                </a>
                <a href="/admin/user">
                    <span class="material-symbols-outlined">group</span>
                    <h3>Tài khoản</h3>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">history_edu</span>
                    <h3>Đơn hàng</h3>
                </a>
                <a href="/admin/product">
                    <span class="material-symbols-outlined">note_alt</span>
                    <h3>Sản phẩm</h3>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">calendar_month</span>
                    <h3>Thống kê</h3>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">star_half</span>
                    <h3>Đánh giá sản phẩm</h3>
                </a>
                <a href="/trangchu">
                    <span class="material-symbols-outlined">loyalty</span>
                    <h3>Quay lại shop</h3>
                </a>
                <a href="/logout">
                    <span class="material-symbols-outlined">logout</span>
                    <h3>Đăng xuất</h3>
                </a>
            </div>