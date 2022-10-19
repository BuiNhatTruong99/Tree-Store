<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<%@include file="/views/head/headadmin.jsp"%>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.0/angular.min.js"></script>
	<script src="https://code.angularjs.org/1.8.0/angular-route.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Lấy mã sản phẩm để thực hiện xem view product -->
    <script type="text/javascript">
		$(document).ready(function() {
 			$('[data-toggle="tooltip"]').tooltip();

			/* $('table .edit').on('click', function() {
				var id = $(this).parent().find('#id').val();
				alert(id);
			}); */

			$('table .edit').on('click', function() {
				var id = $(this).parent().find('#id').val();
				$.ajax({
					type: 'GET',
					url: '${pageContext.request.contextPath}/admin/product/edit/' + id,
					success: function(sanpham) {
						$('#editModal #id').val(sanpham.id_sp);
 						$('#editModal #tensp').val(sanpham.tensp);
						$('#editModal #gia').val(sanpham.gia);
						$('#editModal #sltonkho').val(sanpham.sltonkho);
						$('#dm option[value="'+sanpham.id_dm+'"]').attr("selected", "selected");
						if (sanpham.trangthai == true) {
							$('#trangthai').find(':radio[name=trangthai][value="true"]').prop('checked', true);
						} else {
							$('#trangthai').find(':radio[name=trangthai][value="false"]').prop('checked', true);
						}
						if (sanpham._delete == false) { 
							$('#isdelete').find(':radio[name=is_delete][value="false"]').prop('checked', true);
						} else {
							$('#isdelete').find(':radio[name=is_delete][value="true"]').prop('checked', true);
						}
						$('#editModal #mota').val(sanpham.mota);
						//$('#editModal #anh_sp').val(sanpham.anh);
					}
				})
			});
		});
	</script>

</head>
<body ng-app="myapp2" ng-controller="myctrl2">
	<div class="container2">
		<!-- BEGIN ASIDE -->
		<aside>
			<div class="top">
                <div class="logo">
                    <a href="/trangchu"><img src="<c:url value='/images/logo.jpg'/>" alt="Brand Image"></a> 
                </div>
                <div class="close" id="close-btn">
                    <span class="material-symbols-outlined">close</span>
                </div>
            </div>

            <div class="sidebar">
                <a href="/admin">
                    <span class="material-symbols-outlined">dashboard</span>
                    <h3>Dashboard</h3>
                </a>
                <a href="/admin/user">
                    <span class="material-symbols-outlined">group</span>
                    <h3>Tài khoản</h3>
                </a>
                <a href="/admin/order">
                    <span class="material-symbols-outlined">history_edu</span>
                    <h3>Đơn hàng</h3>
                </a>
                <a href="/admin/product" class="active">
                    <span class="material-symbols-outlined">note_alt</span>
                    <h3>Sản phẩm</h3>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">star_half</span>
                    <h3>Đánh giá sản phẩm</h3>
                </a>
                <a href="/admin/statistical">
                    <span class="material-symbols-outlined">calendar_month</span>
                    <h3>Thống kê</h3>
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
		</aside>
		<!-- END ASIDE -->

		<main>
			<h1 class="title">Quản lý sản phẩm</h1>

			<a href="#" type="submit" class="btn insert_btn"
				data-bs-toggle="modal" data-bs-target="#insertModal"> <span
				class="material-icons-sharp">view_in_ar</span>
				<h3>Thêm sản phẩm</h3>
			</a>

			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Ảnh sản phẩm</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Số lượng tồn kho</th>
						<th scope="col">Giá</th>
						<th scope="col">Loại</th>
						<th scope="col">Mô tả</th>
						<th scope="col">Trạng thái</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<!-- DANH SÁCH SẢN PHẨM -->
					<c:set var="start"  scope="session" value="${0}"></c:set>
					<c:forEach var="item" items="${sp}">
						
						<tr>
						<c:set var="start" value="${start+ 1}"></c:set>
							<td scope="row">${start}</td>
							<td class="img"><img
								src="<c:url value='/images/product/${item.anh}'/>"
								alt="Image product" class="img_pro"></td>
							<td>${item.tensp}</td>
							<td>${item.sltonkho}</td>
							<td>$${item.gia}</td>
							<td>${item.danhmuc.tendm}</td>
							<td>${item.mota}</td>
							<td>
							<c:if test="${item.trangthai == true}">
                      			<c:out value="Còn hàng"></c:out>
                      		</c:if>
	                      	<c:if test="${item.trangthai == false}">
	                      		<c:out value="Hết hàng"></c:out>
	                      	</c:if>
							</td>
							<td>
								<!-- EDIT -->
								<a href="/admin/product/edit/${item.id_sp}" class="edit" data-bs-toggle="modal" data-bs-target="#editModal" data-bs-whatever="Nguyễn Văn A">
									<span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span>
								</a>
								<input type="hidden" id="id" value="${item.id_sp}">
								<!-- EDIT -->
								
								<!-- DELETE -->
								<a href="/admin/product/delete/${item.id_sp}" >
								<!-- DELETE -->
								
								<span class="material-symbols-outlined">Close</span></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>

		<div class="right1">
			<div class="top">
				<button id="menu-btn">
					<span class="material-symbols-outlined"> menu </span>
				</button>
				<div class="theme-toggler">
					<span class="material-icons-sharp active"> light_mode </span> <span
						class="material-icons-sharp"> dark_mode </span>
				</div>
				<div class="profile">
					<div class="info">
                        <p>Hi, ${user.hoten}</p>
                        <div class="rule">${user.vaitro?"Admin":""}</div>
                    </div>
                    <div class="profile-photo">
                        <img src="/images/user/${user.anh}" alt="avt">
                    </div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- MODAL INSERT -->
	<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModal" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h1 class="modal-title" id="exampleModalLabel">
                    <span class="material-icons-sharp">
                        dashboard_customize
                    </span>
                    Thêm sản phẩm
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/admin/product/create" method="post" enctype='multipart/form-data'>
            <div class="modal-body">
                <div class="container-fluid">
                	<div class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" src="${not empty url?url:'/images/product/imgpro_default.png'}" alt="Ảnh sản phẩm">
                            <label for="anh_sp" class="form-label mt-4">Ảnh sản phẩm</label>
                            <input class="form-control" type="file" name="anh_sp" id="anh_sp">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="tensp" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" name="tensp" id="tensp" placeholder="Hoa...">
                            </div>
                            <div class="mb-3">
                                <label for="gia" class="form-label">Giá</label>
                                <input type="number" min="0" class="form-control" name="gia" id="gia" value="0">
                            </div>
                            <div>
                                <label for="sltonkho" class="form-label">Số lượng đang tồn kho</label>
                                <input type="number" min="0" name="sltonkho" class="form-control" id="sltonkho" value="0">
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                        	<label for="danhmuc" class="form-label">Loại danh mục</label>
                            <select class="form-select" name="danhmuc" id="danhmuc" size="1" aria-label="size 3 select example">
                                <c:forEach var="item" items="${danhmuc}">
                                <option value="${item.id_dm}">${item.tendm}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Trạng thái</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai1" value="true" checked>
                                        <label class="form-check-label" for="trangthai1">Còn hàng</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai2" value="false">
                                        <label class="form-check-label" for="trangthai2">Hết hàng</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Hiện trạng</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_delete" id="is_delete1" value="false" checked>
                                        <label class="form-check-label" for="is_delete1">Chưa xóa</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_delete" id="is_delete2" value="true">
                                        <label class="form-check-label" for="is_delete2">Đã xóa</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="mota" class="form-label">Mô tả</label>
                            <textarea class="form-control" name="mota" id="mota" rows="4"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success">Thêm</button>
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</a>
            </div>
            </form>
        </div>
        </div>
    </div>
	
	<!-- MODAL EDIT -->
    <div class="modal fade editModal" id="editModal" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h1 class="modal-title" id="exampleModalLabel">
                    <span class="material-icons-sharp">
                        dashboard_customize
                    </span>
                    Thông tin sản phẩm
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/admin/product/update" method="post" enctype='multipart/form-data'>
            <div class="modal-body">
                <div class="container-fluid">
                	<div class="row g-3">
                		<input type="hidden" name="id" id="id">
                        <div class="col-md-6">
                            <img class="avatar" src="${not empty url?url:'/images/product/imgpro_default.png'}" alt="Ảnh sản phẩm">
                            <label for="anh_sp" class="form-label mt-4">Ảnh sản phẩm</label>
                            <input class="form-control" type="file" name="anh_sp" id="anh_sp">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="tensp" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" name="tensp" id="tensp" placeholder="Hoa...">
                            </div>
                            <div class="mb-3">
                                <label for="gia" class="form-label">Giá</label>
                                <input type="number" min="0" class="form-control" name="gia" id="gia" value="0">
                            </div>
                            <div>
                                <label for="sltonkho" class="form-label">Số lượng đang tồn kho</label>
                                <input type="number" min="0" name="sltonkho" class="form-control" id="sltonkho" value="0">
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                        	<label for="danhmuc" class="form-label">Loại danh mục</label>
                            <select class="form-select" name="danhmuc" id="dm" size="1" aria-label="size 3 select example">
                                <c:forEach var="item" items="${danhmuc}">
                                <option value="${item.id_dm}">${item.tendm}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3" id="trangthai">
                                <label for="inputPassword4" class="form-label">Trạng thái</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai1" value="true" checked>
                                        <label class="form-check-label" for="trangthai1">Còn hàng</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai2" value="false">
                                        <label class="form-check-label" for="trangthai2">Hết hàng</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3" id="isdelete">
                                <label for="inputPassword4" class="form-label">Hiện trạng</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_delete" id="is_delete1" value="false" checked>
                                        <label class="form-check-label" for="is_delete1">Chưa xóa</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_delete" id="is_delete2" value="true">
                                        <label class="form-check-label" for="is_delete2">Đã xóa</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="mota" class="form-label">Mô tả</label>
                            <textarea class="form-control" name="mota" id="mota" rows="4"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success">Lưu thay đổi</button>
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</a>
            </div>
            </form>
        </div>
        </div>
    </div>
	

	<script src="<c:url value='/css/admin.js'/>"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		    var app = angular.module("myapp2", []);
		    app.controller("myctrl2", function ($scope) {
		       
		    })
	</script>
	
</body>
</html>