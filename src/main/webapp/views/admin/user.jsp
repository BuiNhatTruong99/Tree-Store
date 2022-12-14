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

					    if (nguoidung.gioitinh) {
					    	$('#gioitinh').find(':radio[name=gender][value="true"]').prop('checked', true);
						} else {
							$('#gioitinh').find(':radio[name=gender][value="false"]').prop('checked', true);
						}
						
						if (nguoidung.vaitro) {
							$('#vaitro').find(':radio[name=rule][value="true"]').prop('checked', true);
						} else {
							$('#vaitro').find(':radio[name=rule][value="false"]').prop('checked', true);
						}
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
                    <h3>T??i kho???n</h3>
                </a>
                <a href="/admin/order">
                    <span class="material-symbols-outlined">history_edu</span>
                    <h3>????n h??ng</h3>
                </a>
                <a href="/admin/product">
                    <span class="material-symbols-outlined">note_alt</span>
                    <h3>S???n ph???m</h3>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">star_half</span>
                    <h3>????nh gi?? s???n ph???m</h3>
                </a>
                <a href="/admin/statistical">
                    <span class="material-symbols-outlined">calendar_month</span>
                    <h3>Th???ng k??</h3>
                </a>
                <a href="/trangchu">
                    <span class="material-symbols-outlined">loyalty</span>
                    <h3>Quay l???i shop</h3>
                </a>
                <a href="/logout">
                    <span class="material-symbols-outlined">logout</span>
                    <h3>????ng xu???t</h3>
                </a>
            </div>
        </aside>
        <!-- END ASIDE -->

        <main>
            <h1 class="title">Qu???n l?? ng?????i d??ng</h1>

            <a href="#" type="submit" class="btn insert_btn" data-bs-toggle="modal" data-bs-target="#insertModal">
                <span class="material-icons-sharp">person_add_alt_1</span> <h3>Th??m ng?????i d??ng</h3> 
            </a>

            <table class="table">
                <thead class="table-dark">
                    <tr>
                      <th scope="col">ID</th>
                      <th scope="col">???nh ?????i di???n</th>
                      <th scope="col">H??? v?? t??n</th>
                      <th scope="col">Ng??y sinh</th>
                      <th scope="col">Gi???i t??nh</th>
                      <th scope="col">S??? ??i???n tho???i</th>
                      <th scope="col">Email</th>
                      <th scope="col">?????a ch???</th>
                      <th scope="col">Vai tr??</th>
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
                      		<c:out value="N???"></c:out>
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
                      		<c:out value="Th??nh Vi??n"></c:out>
                      	</c:if>
                      	
                      </td>
                      <td>
                      
                      	<!-- EDIT -->
                        <a href="/admin/user/edit/${item.id_kh}" class="edit1" data-bs-toggle="modal" data-bs-target="#editModal" data-bs-whatever="Nguy???n V??n A"><span class="material-symbols-sharp" data-bs-toggle="tooltip"  data-bs-placement="bottom" title="Ch???nh s???a">add_circle</span></a>
                        <input type="hidden" id="id" name="id" value="${item.id_kh}">
                        <!-- EDIT -->
                        
                        <!-- DELETE -->
                        <a href="/admin/user/delete/${item.id_kh}" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="X??a">disabled_by_default</span></a>
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
                    Th??m ng?????i d??ng
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form name="frmIU" action="/admin/user/create" method="post" enctype='multipart/form-data'>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Avatar">
                            <label for="anh" class="form-label mt-3">???nh ?????i di???n</label>
                            <input class="form-control" type="file" name="anh" id="anh">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="hoten" class="form-label">H??? v?? t??n</label>
                                <input type="text" class="form-control" name="hoten" id="hoten" placeholder="Nguy???n V??n A..." ng-model="hoten" required="required">
                            </div>
                            <div class="text-danger mb-2 ms-2" style="margin-top: -0.2rem;" ng-hide="frmIU.hoten.$valid">Vui l??ng nh???p t??n ng?????i d??ng</div>
                            
                            <div class="mb-3">
                                <label for="ngaysinh" class="form-label">Ng??y sinh</label>
                                <input type="date" class="form-control" name="ngaysinh" id="ngaysinh" ng-model="ngaysinh" required="required">
                            </div>
                            <div class="text-danger mb-2 ms-2" style="margin-top: -0.2rem;" ng-hide="frmIU.ngaysinh.$valid">Vui l??ng nh???p ng??y sinh c???a b???n</div>
                            
                            <div>
                                <label for="inputPassword4" class="form-label">Gi???i t??nh</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender1" value="true" checked="checked">
                                        <label class="form-check-label" for="gender1">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender2" value="false">
                                        <label class="form-check-label" for="gender2">N???</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="sodt" class="form-label">S??? ??i???n tho???i</label>
                            <input type="text" class="form-control" name="sodt" id="sodt" placeholder="VD: 038, 096,...">
                        </div>
                        <div class="col-md-6">
                          <label for="taikhoan" class="form-label">T??i kho???n</label>
                          <input type="text" class="form-control" name="taikhoan" id="taikhoan">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="nva@gmail.com">
                        </div>
                        <div class="col-md-6">
                          <label for="matkhau" class="form-label">M???t kh???u</label>
                          <input type="password" class="form-control" name="matkhau" id="matkhau">
                        </div>
                        <div class="col-md-6">
                          <label for="diachi" class="form-label">?????a ch???</label>
                          <input type="text" class="form-control" name="diachi" id="diachi" placeholder="1234 Main St">
                        </div>
                        <div class="col-md-6">
                            <label for="inputPassword4" class="form-label">Vai tr??</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule1" value="true">
                                    <label class="form-check-label" for="rule1">Admin</label>
                                </div>
                                <div class="form-check form-check-inline" hidden="">
                                    <input class="form-check-input" type="radio" name="rule" id="rule2" value="false">
                                    <label class="form-check-label" for="rule2">Nh??n vi??n</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule3" value="false" checked="checked">
                                    <label class="form-check-label" for="rule3">Kh??ch h??ng</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success">Th??m</button>
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">????ng</a>
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
                    Th??ng tin ng?????i d??ng
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
                            <label for="anh" class="form-label mt-3">???nh ?????i di???n</label>
                            <input class="form-control" type="file" name="anh" id="anhshow">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="hoten" class="form-label">H??? v?? t??n</label>
                                <input type="text" class="form-control" name="hoten" id="hotenshow" placeholder="Nguy???n V??n A...">
                            </div>
                            <div class="mb-3">
                                <label for="ngaysinh" class="form-label">Ng??y sinh</label>
                                <input type="date" class="form-control" name="ngaysinh" id="ngaysinhshow">
                            </div>
                            <div id="gioitinh">
                                <label for="inputPassword4" class="form-label">Gi???i t??nh</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gendershow1" value="true" checked="checked">
                                        <label class="form-check-label" for="gendershow1">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gendershow2" value="false">
                                        <label class="form-check-label" for="gendershow2">N???</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="sodt" class="form-label">S??? ??i???n tho???i</label>
                            <input type="text" class="form-control" name="sodt" id="sodtshow" placeholder="VD: 038, 096,...">
                        </div>
                        <div class="col-md-6">
                          <label for="taikhoan" class="form-label">T??i kho???n</label>
                          <input type="text" class="form-control" name="taikhoan" id="taikhoanshow">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="emailshow" placeholder="nva@gmail.com">
                        </div>
                        <div class="col-md-6">
                          <label for="matkhau" class="form-label">M???t kh???u</label>
                          <input type="password" class="form-control" name="matkhau" id="matkhaushow">
                        </div>
                        <div class="col-md-6">
                          <label for="diachi" class="form-label">?????a ch???</label>
                          <input type="text" class="form-control" name="diachi" id="diachishow" placeholder="1234 Main St">
                        </div>
                        <div class="col-md-6" id="vaitro">
                            <label for="inputPassword4" class="form-label">Vai tr??</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="ruleshow1" value="true" checked="checked">
                                    <label class="form-check-label" for="rule1">Admin</label>
                                </div>
                                <!-- <div class="form-check form-check-inline" hidden="">
                                    <input class="form-check-input" type="radio" name="rule" id="ruleshow2" value="false">
                                    <label class="form-check-label" for="rule2">Nh??n vi??n</label>
                                </div> -->
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="ruleshow3" value="false">
                                    <label class="form-check-label" for="rule3">Kh??ch h??ng</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success">L??u thay ?????i</button>
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">????ng</a>
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