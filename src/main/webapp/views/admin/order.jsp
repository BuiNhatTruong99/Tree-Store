<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
            <h1 class="title">Quản lý đơn hàng</h1>

            <!-- ĐƠN CHỜ XÁC NHẬN -->
            <h3>Đơn hàng chờ xác nhận</h3>
            <table class="table">
                <thead class="table-dark">
                    <tr>
                      <th scope="col">STT</th>
                      <th scope="col">Ngày đặt</th>
                      <th scope="col">Tên khách hàng</th>
                      <th scope="col">Mã đơn</th>
                      <th scope="col">Tổng tiền</th>
                      <th scope="col">Trạng thái</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:set value="${0 }" var="start"></c:set>
                   <c:forEach items="${confirm }" var="item">
                    <tr>
                   	<c:set var="start" value="${start+1}"></c:set>
                      <td scope="row">${start}</td>
                      <td> ${item.ngaydat} </td>
                      <td>${item.nguoidung.hoten }</td>
                      <td>${item.id_ddh }</td>
                      <td>${item.tongtien }</td>
                      <td>${item.trangthai}</td>
                      <td>
                        <a type="submit" href="/increase/${item.id_ddh}"><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xác nhận">task_alt</span></a>
                        <a href="#"><span class="material-symbols-sharp" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" data-bs-placement="bottom" title="Xem chi tiết">expand_circle_down</span></a>
                        <a href="/delete/${item.id_ddh }" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xóa">disabled_by_default</span></a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
            </table>
             <!-- Hóa đơn chi tiết -->
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body row">
                        <div class="col">
                            <form class="row g-3">
                            <c:forEach items="${confirm }" var="item">
                                <div class="mb-3">
                                    <label for="inputSDT" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="inputSdt" value="${item.sodt }" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="inputDiachi" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="inputDC" value="${item.diachi }" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="formControlTextarea" class="form-label">Ghi chú khách hàng</label>
                                    <textarea class="form-control" id="formControlTextarea" rows="4" disabled>${item.ghichukh }</textarea>
                                </div>
                                </c:forEach>
                            </form>
                        </div>
                        <div class="col">
                            <label>Sản phẩm đã chọn</label>
                            <div class="overflow-auto" style="height: 295px;">
                            <table class="table" >
                                <thead class="table">
                                    <tr>
                                      <th scope="col">Ảnh sản phẩm</th>
                                      <th scope="col">Tên sản phẩm</th>
                                      <th scope="col">Số lượng</th>
                                      <th scope="col">Giá</th>
                                      <th scope="col">Loại</th>
                                      <th scope="col">Tổng giá</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                      <td>Hoa Xanh</td>
                                      <td>2</td>
                                      <td>$1300</td>
                                      <td>Hoa cưới</td>
                                      <td>$2600</td>
                                    </tr>
                                    <tr>
                                        <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                        <td>Hoa Xanh</td>
                                        <td>2</td>
                                        <td>$1300</td>
                                        <td>Hoa cưới</td>
                                        <td>$2600</td>
                                      </tr>
                                      <tr>
                                        <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                        <td>Hoa Xanh</td>
                                        <td>2</td>
                                        <td>$1300</td>
                                        <td>Hoa cưới</td>
                                        <td>$2600</td>
                                      </tr>
                                  </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <!-- ĐƠN HÀNG ĐANG GIAO -->
            <h3 class="my-3">Đơn hàng đã xác nhận và chuẩn bị</h3>
            <table class="table">
                <thead class="table-dark">
                    <tr>
                      <th scope="col">STT</th>
                      <th scope="col">Ngày đặt</th>
                      <th scope="col">Tên khách hàng</th>
                      <th scope="col">Mã đơn</th>
                      <th scope="col">Tổng tiền</th>
                      <th scope="col">Trạng thái</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:set value="${0 }" var="starts"></c:set>
                  <c:forEach var="items" items="${notdone }">
                    <tr>
                    <c:set value="${starts + 1}" var="starts"></c:set>
                      <td scope="row">${starts }</td>
                      <td>${items.ngaydat}</td>
                      <td>${items.nguoidung.hoten }</td>
                      <td>${items.id_ddh }</td>
                      <td>${items.tongtien }</td>
                      <td>${items.trangthai }</td>
                      <td>
                        <a href="/update/${items.id_ddh}" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xác nhận">task_alt</span></a>
                        <a href="#"><span class="material-symbols-sharp" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" data-bs-placement="bottom" title="Xem chi tiết">expand_circle_down</span></a>
                        <a href="/promote/${items.id_ddh }" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Trả về đơn chờ">move_up</span></a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
            </table>
            <!-- Hóa đơn chi tiết -->
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body row">
                        <div class="col">
                            <form class="row g-3">
                            <c:forEach var="items" items="${notdone }">
                                <div class="mb-3">
                                    <label for="inputSDT" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="inputSdt" value="${items.sodt }" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="inputDiachi" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="inputDC" value="${items.diachi }" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="formControlTextarea" class="form-label">Ghi chú khách hàng</label>
                                    <textarea class="form-control" id="formControlTextarea" rows="4" disabled>${items.ghichukh }</textarea>
                                </div>
                                </c:forEach>
                            </form>
                        </div>
                        <div class="col">
                            <label>Sản phẩm đã chọn</label>
                            <div class="overflow-auto" style="height: 295px;">
                            <table class="table" >
                                <thead class="table">
                                    <tr>
                                      <th scope="col">Ảnh sản phẩm</th>
                                      <th scope="col">Tên sản phẩm</th>
                                      <th scope="col">Số lượng</th>
                                      <th scope="col">Giá</th>
                                      <th scope="col">Loại</th>
                                      <th scope="col">Tổng giá</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                      <td>Hoa Xanh</td>
                                      <td>2</td>
                                      <td>$1300</td>
                                      <td>Hoa cưới</td>
                                      <td>$2600</td>
                                    </tr>
                                    <tr>
                                        <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                        <td>Hoa Xanh</td>
                                        <td>2</td>
                                        <td>$1300</td>
                                        <td>Hoa cưới</td>
                                        <td>$2600</td>
                                      </tr>
                                      <tr>
                                        <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                        <td>Hoa Xanh</td>
                                        <td>2</td>
                                        <td>$1300</td>
                                        <td>Hoa cưới</td>
                                        <td>$2600</td>
                                      </tr>
                                  </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                  </div>
                </div>
            </div>

            <h3 class="my-3">Đơn hàng đã giao</h3>
            <table class="table">
                <thead class="table-dark">
                    <tr>
                      <th scope="col">STT</th>
                      <th scope="col">Ngày đặt</th>
                      <th scope="col">Tên khách hàng</th>
                      <th scope="col">Mã đơn</th>
                      <th scope="col">Tổng tiền</th>
                      <th scope="col">Trạng thái</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:set value="${0 }" var="begin"></c:set>
                  <c:forEach var="itemss" items="${done}">
                    <tr>
                    <c:set value="${begin +1}" var="begin"></c:set>
                      <td scope="row">${begin }</td>
                      <td>${itemss.ngaydat }</td>
                      <td>${itemss.nguoidung.hoten }</td>
                      <td>${itemss.id_ddh}</td>
                      <td>${itemss.tongtien }</td>
                      <td>${itemss.trangthai}</td>
                      <td>
                        <a href="/increase/${itemss.id_ddh}"><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Trả về đơn giao">move_up</span></a>
                        <a href="#"><span class="material-symbols-sharp" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" data-bs-placement="bottom" title="Xem chi tiết">expand_circle_down</span></a>
                        <a href="/delete/${itemss.id_ddh }"><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xóa">disabled_by_default</span></a>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
            </table>
            <!-- Hóa đơn chi tiết -->
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body row">
                        <div class="col">
                            <form class="row g-3">
                            <c:forEach var="itemss" items="${done}">
                                <div class="mb-3">
                                    <label for="inputSDT" class="form-label">Số điện thoại</label>
                                    <input type="text" class="form-control" id="inputSdt" value="${itemss.sodt }" disabled>
                                </div>
                                <div class="mb-3">
                                    <label for="inputDiachi" class="form-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="inputDC" value="${itemss.diachi }" disabled>
                                </div>
                                <div>
                                    <label for="inputDiachi" class="form-label">Đánh giá</label>
                                    <div>
                                        <span class="material-icons-sharp">star</span>
                                        <span class="material-icons-sharp">star</span>
                                        <span class="material-icons-sharp">star</span>
                                        <span class="material-icons-sharp">star_half</span>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="formControlTextarea" class="form-label">Nội dung đánh giá</label>
                                    <textarea class="form-control" id="formControlTextarea" rows="4" disabled></textarea>
                                </div>
                                </c:forEach>
                            </form>
                        </div>
                        <div class="col">
                            <label>Sản phẩm đã chọn</label>
                            <div class="overflow-auto" style="height: 365px;">
                            <table class="table" >
                                <thead class="table">
                                    <tr>
                                      <th scope="col">Ảnh sản phẩm</th>
                                      <th scope="col">Tên sản phẩm</th>
                                      <th scope="col">Số lượng</th>
                                      <th scope="col">Giá</th>
                                      <th scope="col">Loại</th>
                                      <th scope="col">Tổng giá</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                      <td>Hoa Xanh</td>
                                      <td>2</td>
                                      <td>$1300</td>
                                      <td>Hoa cưới</td>
                                      <td>$2600</td>
                                    </tr>
                                    <tr>
                                        <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                        <td>Hoa Xanh</td>
                                        <td>2</td>
                                        <td>$1300</td>
                                        <td>Hoa cưới</td>
                                        <td>$2600</td>
                                      </tr>
                                      <tr>
                                        <td class="img"><img src="<c:url value='images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                                        <td>Hoa Xanh</td>
                                        <td>2</td>
                                        <td>$1300</td>
                                        <td>Hoa cưới</td>
                                        <td>$2600</td>
                                      </tr>
                                  </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
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
    
  

    <script src="<c:url value='/css/admin.js'/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>