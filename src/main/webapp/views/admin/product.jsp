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
</head>
</head>
<body>
	<div class="container2">
		<!-- BEGIN ASIDE -->
		<aside>
			<%@include file="/views/header/headeradmin.jsp"%>
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
								<a href="/admin/product/edit/${item.id_sp}" data-bs-toggle="modal"
									data-bs-target="#editModal" data-bs-whatever="Nguyễn Văn A"><span
									class="material-symbols-sharp" data-bs-toggle="tooltip"
									data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span></a>
								<a href="/admin/product/delete/${item.id_sp}" >
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
						<p>Hi, Đỗ Phi Hùng</p>
						<div class="rule">Admin</div>
					</div>
					<div class="profile-photo">
						<img
							src="https://posapp.vn/wp-content/themes/twentysixteen-child/images/icon-user-slide.png"
							alt="abc">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	
	<%-- <div class="modal fade" id="editModal" tabindex="-1"
		aria-labelledby="editModal" aria-hidden="true">
	<form:form action="/admin/product"  modelAttribute="sanpham" method="post">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-warning">
					<h1 class="modal-title" id="exampleModalLabel">
						<span class="material-icons-sharp"> dashboard_customize </span>
						Thông tin sản phẩm
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						
						<div class="row g-3">
							<div class="col-md-6">
							
								<img  class="avatar"
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU"
									alt="Avatar" > <label for="formFile"
									class="form-label mt-4">Danh sách sản phẩm</label> 
									<form:input type="file" path="anh" class="form-control" scr="<c:url value='./images/{{anh}}'/>" />
							
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									
									<form:label path="" class="form-label">Tên sản phẩm</form:label>
										<form:input path="tensp" placeholder="Hoa..." class="form-control"/>
								</div>
								<div class="mb-3">
									<label for="inputDate" class="form-label">Giá</label>
									<form:input path="gia"  placeholder="..."  class="form-control"/>
									 
								</div>
								<div>
									<label for="inputSLTK" class="form-label">Số Lượng sản phẩm trong kho</label>
									<form:input path="sltonkho" placeholder="..." class="form-control"/>
									 
								</div>
							</div>

							<div class="col-md-12">
								<label for="inputSLTK" class="form-label">Loại sản phẩm</label>
								
								<form:select path="danhmuc" class="form-select" size="1"
									aria-label="size 3 select example" name="dm">
									<c:forEach var="item" items="${danhmuc}" >
										<option value="${item.id_dm}" >${item.tendm}</option>
									</c:forEach>
								</form:select>
								
							</div>
							<div class="col-md-6">
								<div class="mb-3">
									<label for="inputPassword4" class="form-label">Trạng thái</label>
									<div class="ms-5">
										<div class="form-check form-check-inline">
											<form:radiobutton path="trangthai" value="true" label="Còn hàng"/>
											<form:radiobutton path="trangthai" value="false" label="Hết hàng"/>
										</div>
										
									</div>
								</div>
								<div class="mb-3">
									<label for="inputPassword4" class="form-label">Hiện trạng</label>
									<div class="ms-5">
										<div class="form-check form-check-inline">
											<input type="radio" value="Chưa xóa" name="hientrang" checked="checked">Chưa xoá
											<input type="radio"  value="Đã xóa" name="hientrang" >Đã xoá
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
								<form:textarea cssStyle="width: 300px;height: 100px" path="mota" />
							</div>
							</div>
					</div>
				</div>
				<div class="modal-footer">
				<button formaction="/add" formmethod="post"  class="btn btn-success">Lưu thay đổi</button>
					<button type="submit" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
		</form:form>
	</div> --%>
	
	<!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
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
            <div class="modal-body">
                <div class="container-fluid">
                    <form action="/admin/product/add" method="post" class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Avatar">
                            <label for="formFile" class="form-label mt-4">Ảnh sản phẩm</label>
                            <input class="form-control" type="file" name="anh" id="formFile">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="inputName" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" name="tensp" id="inputName" placeholder="Hoa...">
                            </div>
                            <div class="mb-3">
                                <label for="inputGia" class="form-label">Giá</label>
                                <input type="number" min="0" class="form-control" name="gia" id="inputGia">
                            </div>
                            <div>
                                <label for="inputSLTK" class="form-label">Số lượng đang tồn kho</label>
                                <input type="number" min="0" name="sltonkho" class="form-control" id="inputSLTK">
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <select class="form-select" size="1" aria-label="size 3 select example">
                                <c:forEach var="item" items="${danhmuc}">
                                <option value="${id_dm}" selected="selected">item.tendm</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Trạng thái</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai" value="true">
                                        <label class="form-check-label" for="inlineRadio1">Còn hàng</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai" value="false">
                                        <label class="form-check-label" for="inlineRadio2">Hết hàng</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Hiện trạng</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_delete" id="is_delete" value="true" checked>
                                        <label class="form-check-label" for="inlineRadio1">Chưa xóa</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="is_delete" id="is_delete" value="false">
                                        <label class="form-check-label" for="inlineRadio2">Đã xóa</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <a type="submit" href="#" class="btn btn-success">Lưu thay đổi</a>
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            </div>
        </div>
        </div>
    </div>
	

	<script src="<c:url value='/css/admin.js'/>"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	
	<!-- Lấy mã sản phẩm để thực hiện xem view product -->
    <script type="text/javascript">

	</script>

</body>
</html>