<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script type="text/javascript">
		$(document).ready(function() {
 			$('[data-toggle="tooltip"]').tooltip();
			// Check id
			/* $('table .edit1').on('click', function() {
				var id = $(this).parent().find('#id').val();
				alert(id);
			}); */

			$('table .edit1').on('click', function() {
				var id = $(this).parent().find('#id').val();
				$.ajax({
					type: 'GET',
					url: '${pageContext.request.contextPath}/admin/user/edit/' + id,
					success: function(nguoidung) {
						$('#editModal #id').val(nguoidung.id_kh);
 						$('#editModal #hotenshow').val(nguoidung.hoten);
						$('#editModal #sodtshow').val(nguoidung.sodt);
						$('#editModal #emailshow').val(nguoidung.email);
						$('#editModal #taikhoanshow').val(nguoidung.tentk);
						$('#editModal #matkhaushow').val(nguoidung.matkhau);
						$('#editModal #diachishow').val(nguoidung.diachi);

						/* Set Date to input type Date */
						var now = new Date(nguoidung.ngaysinh);
						var day = ("0" + now.getDate()).slice(-2);
						var month = ("0" + (now.getMonth() + 1)).slice(-2);
						var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
					    $('#ngaysinhshow').val(today);
						
						if (nguoidung.vaitro) {
							$('#editModal #ruleshow1:selected') 
						} else {
							$('#editModal #ruleshow3:selected');
						}
						if (nguoidung.gioitinh) {
							$('#editModal #gendershow1:selected') 
						} else {
							$('#editModal #gendershow2:selected');
						}
						
						//$('#editModal #vaitro').val(nguoidung.vaitro);
						//$('#editModal #gioitinh').val(nguoidung.gioitinh);
						//$('#editModal #anh').val(nguoidung.anh);
					}
				})
			});
		});
	</script>
</head>
<body ng-app="myapp1" ng-controller="myctrl1">
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
                <a href="/admin/user" class="active">
                    <span class="material-symbols-outlined">group</span>
                    <h3>Tài khoản</h3>
                </a>
                <a href="/admin/order">
                    <span class="material-symbols-outlined">history_edu</span>
                    <h3>Đơn hàng</h3>
                </a>
                <a href="/admin/product">
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
            <h1 class="title">Quản lý người dùng</h1>

            <a href="#" type="submit" class="btn insert_btn" data-bs-toggle="modal" data-bs-target="#insertModal">
                <span class="material-icons-sharp">person_add_alt_1</span> <h3>Thêm người dùng</h3> 
            </a>

            <table class="table">
                <thead class="table-dark">
                    <tr>
                      <th scope="col">ID</th>
                      <th scope="col">Ảnh đại diện</th>
                      <th scope="col">Họ và tên</th>
                      <th scope="col">Ngày sinh</th>
                      <th scope="col">Giới tính</th>
                      <th scope="col">Số điện thoại</th>
                      <th scope="col">Email</th>
                      <th scope="col">Địa chỉ</th>
                      <th scope="col">Vai trò</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:set var="stt" value="${0}"></c:set>
                  <c:forEach var="item" items="${listnd}">
                    <tr>
                    <c:set var="stt" value="${stt+1}"> </c:set>
                      <td scope="row">${stt}</td>
                      <td class="img"><img src="/images/user/${item.anh}" alt="Avatar" class="img_avt"></td>
                      <td>${item.hoten}</td>
                      <td><fmt:formatDate type="date" dateStyle="short" value="${item.ngaysinh}"/> </td>
                      <td>
                      <c:if test="${item.gioitinh == true}">
                      		<c:out value="Nam"></c:out>
                      	</c:if>
                      	<c:if test="${item.gioitinh == false}">
                      		<c:out value="Nữ"></c:out>
                      	</c:if>
                      </td>
                      <td>${item.sodt}</td>
                      <td>${item.email }</td>
                      <td>${item.diachi}</td>
                      <td>
                      	<c:if test="${item.vaitro == true}">
                      		<c:out value="Admin"></c:out>
                      	</c:if>
                      	<c:if test="${item.vaitro == false}">
                      		<c:out value="Thành Viên"></c:out>
                      	</c:if>
                      	
                      </td>
                      <td>
                      
                      	<!-- EDIT -->
                        <a href="/admin/user/edit/${item.id_kh}" class="edit1" data-bs-toggle="modal" data-bs-target="#editModal" data-bs-whatever="Nguyễn Văn A"><span class="material-symbols-sharp" data-bs-toggle="tooltip"  data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span></a>
                        <input type="hidden" id="id" name="id" value="${item.id_kh}">
                        <!-- EDIT -->
                        
                        <!-- DELETE -->
                        <a href="/admin/user/delete/${item.id_kh}" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xóa">disabled_by_default</span></a>
                      	<!-- DELETE -->
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
            </table>
        </main>
        <div class="right1">
            <div class="top">
                <button id="menu-btn">
                    <span class="material-symbols-outlined">
                        menu
                    </span>
                </button>
                <div class="theme-toggler">
                    <span class="material-icons-sharp active">
                        light_mode
                    </span>
                    <span class="material-icons-sharp">
                        dark_mode
                    </span>
                </div>
                <div class="profile">
                    <div class="info">
                        <p>Hi, ${user.hoten}</p>
                        <div class="rule">${user.vaitro?"admin":""}</div>
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
                        badge
                    </span>
                    Thêm người dùng
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form name="frmIU" action="/admin/user/create" method="post" enctype='multipart/form-data'>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Avatar">
                            <label for="anh" class="form-label mt-3">Ảnh đại diện</label>
                            <input class="form-control" type="file" name="anh" id="anh">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="hoten" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" name="hoten" id="hoten" placeholder="Nguyễn Văn A..." ng-model="hoten" required="required">
                            </div>
                            <div class="text-danger mb-2 ms-2" style="margin-top: -0.2rem;" ng-hide="frmIU.hoten.$valid">Vui lòng nhập tên người dùng</div>
                            
                            <div class="mb-3">
                                <label for="ngaysinh" class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" name="ngaysinh" id="ngaysinh" ng-model="ngaysinh" required="required">
                            </div>
                            <div class="text-danger mb-2 ms-2" style="margin-top: -0.2rem;" ng-hide="frmIU.ngaysinh.$valid">Vui lòng nhập ngày sinh của bạn</div>
                            
                            <div>
                                <label for="inputPassword4" class="form-label">Giới tính</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender1" value="true" checked="checked">
                                        <label class="form-check-label" for="gender1">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender2" value="false">
                                        <label class="form-check-label" for="gender2">Nữ</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="sodt" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" name="sodt" id="sodt" placeholder="VD: 038, 096,...">
                        </div>
                        <div class="col-md-6">
                          <label for="taikhoan" class="form-label">Tài khoản</label>
                          <input type="text" class="form-control" name="taikhoan" id="taikhoan">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="nva@gmail.com">
                        </div>
                        <div class="col-md-6">
                          <label for="matkhau" class="form-label">Mật khẩu</label>
                          <input type="password" class="form-control" name="matkhau" id="matkhau">
                        </div>
                        <div class="col-md-6">
                          <label for="diachi" class="form-label">Địa chỉ</label>
                          <input type="text" class="form-control" name="diachi" id="diachi" placeholder="1234 Main St">
                        </div>
                        <div class="col-md-6">
                            <label for="inputPassword4" class="form-label">Vai trò</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule1" value="true">
                                    <label class="form-check-label" for="rule1">Admin</label>
                                </div>
                                <div class="form-check form-check-inline" hidden="">
                                    <input class="form-check-input" type="radio" name="rule" id="rule2" value="false">
                                    <label class="form-check-label" for="rule2">Nhân viên</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule3" value="false" checked="checked">
                                    <label class="form-check-label" for="rule3">Khách hàng</label>
                                </div>
                            </div>
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
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h1 class="modal-title" id="exampleModalLabel">
                    <span class="material-icons-sharp">
                        badge
                    </span>
                    Thông tin người dùng
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/admin/user/update" method="post" enctype='multipart/form-data'>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row g-3">
                    	<input type="hidden" name="id" id="id">
                        <div class="col-md-6">
                            <img class="avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Avatar">
                            <label for="anh" class="form-label mt-3">Ảnh đại diện</label>
                            <input class="form-control" type="file" name="anh" id="anhshow">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="hoten" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" name="hoten" id="hotenshow" placeholder="Nguyễn Văn A...">
                            </div>
                            <div class="mb-3">
                                <label for="ngaysinh" class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" name="ngaysinh" id="ngaysinhshow">
                            </div>
                            <div>
                                <label for="inputPassword4" class="form-label">Giới tính</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gendershow1" value="true" checked="checked">
                                        <label class="form-check-label" for="gendershow1">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gendershow2" value="false">
                                        <label class="form-check-label" for="gendershow2">Nữ</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="sodt" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" name="sodt" id="sodtshow" placeholder="VD: 038, 096,...">
                        </div>
                        <div class="col-md-6">
                          <label for="taikhoan" class="form-label">Tài khoản</label>
                          <input type="text" class="form-control" name="taikhoan" id="taikhoanshow">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="emailshow" placeholder="nva@gmail.com">
                        </div>
                        <div class="col-md-6">
                          <label for="matkhau" class="form-label">Mật khẩu</label>
                          <input type="password" class="form-control" name="matkhau" id="matkhaushow">
                        </div>
                        <div class="col-md-6">
                          <label for="diachi" class="form-label">Địa chỉ</label>
                          <input type="text" class="form-control" name="diachi" id="diachishow" placeholder="1234 Main St">
                        </div>
                        <div class="col-md-6">
                            <label for="inputPassword4" class="form-label">Vai trò</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="ruleshow1" value="true" checked="checked">
                                    <label class="form-check-label" for="rule1">Admin</label>
                                </div>
                                <div class="form-check form-check-inline" hidden="">
                                    <input class="form-check-input" type="radio" name="rule" id="ruleshow2" value="false">
                                    <label class="form-check-label" for="rule2">Nhân viên</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule3" id="ruleshow3" value="false">
                                    <label class="form-check-label" for="rule3">Khách hàng</label>
                                </div>
                            </div>
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		    var app = angular.module("myapp1", []);
		    app.controller("myctrl1", function ($scope) {
		       
		    })
	</script>
</body>
</html>