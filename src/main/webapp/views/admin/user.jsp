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
</head>
<body>
    <div class="container2">
        <!-- BEGIN ASIDE -->
       <aside>
             <%@include file="/views/header/headeradmin.jsp"%>
        </aside>
        <!-- END ASIDE -->

        <main>
            <h1 class="title">Quản lý người dùng</h1>

            <a href="#" type="submit" class="btn insert_btn" data-bs-toggle="modal" data-bs-target="#editModal">
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
                  <c:forEach var="item" items="${user}">
                    <tr>
                    <c:set var="stt" value="${stt+1}"> </c:set>
                      <td scope="row">${stt}</td>
                      <td class="img"><img src="/images/product/${item.anh}" alt="Image product" class="img_avt"></td>
                      <td>${item.hoten }</td>
                      <td><fmt:formatDate type="date" dateStyle="short" value="${item.ngaysinh}"/> </td>
                      <td>
                      <c:if test="${item.gioitinh == false}">
                      		<c:out value="Nam"></c:out>
                      	</c:if>
                      	<c:if test="${item.gioitinh == true}">
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
                        <a href="/admin/user/edit/${item.id_kh}" id="id" data-bs-toggle="modal" data-bs-target="#editModal" data-bs-whatever="Nguyễn Văn A"><span class="edit material-symbols-sharp " data-bs-toggle="tooltip"  data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span></a>
                        <a href="/admin/user/delete/${item.id_kh}" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xóa">disabled_by_default</span></a>
                      	<input type="hidden" id="id" name="id" value="${item.id_kh}">
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
                        <p>Hi, Đỗ Phi Hùng</p>
                        <div class="rule">Admin</div>
                    </div>
                    <div class="profile-photo">
                        <img src="https://posapp.vn/wp-content/themes/twentysixteen-child/images/icon-user-slide.png" alt="abc">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
     
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModal" aria-hidden="true">
    <form:form action="/admin/user"  modelAttribute="nguoidung" method="post">
        <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h1 class="modal-title" id="exampleModalLabel">
                    <span class="material-icons-sharp">
                        badge
                    </span>
                    Thông tin người dùng
                    <input type="hidden" value="${nguoidung.id_kh}">
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    
                   <div class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" name="img" src="/images/product/${nguoidung.anh}" alt="Avatar">
                            <label for="formFile" class="form-label mt-3">Ảnh đại diện</label>
                           <input type="file" src="../images/product" name="anh" class="form-control">
                            
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                            <form:label path="hoten" class="form-label" >Họ và tên</form:label>
                                
                                <form:input path="hoten" id="hoten"  type="text" class="form-control"/>
                                
                            </div>
                            <div class="mb-3">
                                <label for="inputDate" class="form-label">Ngày sinh</label>
                              	<form:input path="ngaysinh" type="date" class="form-control"/>
                            </div>
                            <div>
                                <label for="inputPassword4" class="form-label">Giới tính</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <form:radiobutton path="gioitinh" value="false"  label="Nam"/>
                                        
                                        <form:radiobutton path="gioitinh" value="true" label="Nữ"/>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="inputPhone" class="form-label">Số điện thoại</label>
                            <input name="sodt" class="form-control" />
                        </div>
                        <div class="col-md-6">
                          <label for="inputAccount" class="form-label">Tài khoản</label>
                          <form:input path="tentk" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="inputEmail" class="form-label">Email</label>
                            <form:input path="email" class="form-control" type="email" />
                        </div>
                        <div class="col-md-6">
                          <label for="inputPassword" class="form-label">Mật khẩu</label>
                          <form:input path="matkhau" class="form-control" />
                        </div>
                        <div class="col-md-6">
                          <label for="inputAddress" class="form-label">Địa chỉ</label>
                         <form:input path="diachi" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label for="inputPassword4" class="form-label">Vai trò</label>
                            <div>
                                <div class="form-check form-check-inline">
                                <form:radiobutton path="vaitro" value="true" label="Admin"/>
                               
                                    <form:radiobutton path="vaitro" value="false" label="Thành viên"/>
                                </div>
                               
                            </div>
                        </div>
                     </div>
                </div>
            </div>
            <div class="modal-footer">
            	<button formaction="/add_user"  formmethod="post" class="btn btn-secondary">Lưu thay đổi</button>
               
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            </div>
        </div>
        </div>
        </form:form>
    </div>

    <script src="<c:url value='/css/admin.js'/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <!-- SET VALUE TO INPUT MODAL -->
    <!-- <script>
        $(document).ready(function(){
            $('.edit_btn').click(function (e){
                e.preventDefault();

                // Láº¥y id á» sau cá»t tr
                var id = $(this).closest('tr').find('.id').text();
                console.log(id);
            });
        });
    </script> -->
	<script type="text/javascript">
		$(document).ready(function () {
			$('table .edit').on('click',function()
					{
			
				var id = $(this).parent().find('#id').val();
				console.log(id);
				$.ajax({type: 'GET',
					url:'/admin/user/edit/' + id,
					success: function(nguoidung)
					{
						$('editModal #hoten').val(nguoidung.hoten);
					}})
					})
			
		})
	</script>
</body>
</html>