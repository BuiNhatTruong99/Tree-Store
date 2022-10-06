<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

            <a href="#" type="submit" class="btn insert_btn" data-bs-toggle="modal" data-bs-target="#editModal">
                <span class="material-icons-sharp">view_in_ar</span> <h3>Thêm sản phẩm</h3> 
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
                    <tr>
                      <td scope="row">1</td>
                      <td class="img"><img src="<c:url value='/images/product/Tinh-Yeu-Xanh.jpg'/>" alt="Image product" class="img_pro"></td>
                      <td>Hoa Xanh</td>
                      <td>13</td>
                      <td>3.000.000 vnđ</td>
                      <td>Hoa cưới</td>
                      <td>ABC</td>
                      <td>Còn hàng</td>
                      <td>
                        <a href="#" data-bs-toggle="modal" data-bs-target="#editModal" data-bs-whatever="Nguyễn Văn A"><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span></a>
                        <a href="#" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xóa">disabled_by_default</span></a>
                      </td>
                    </tr>
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
        <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h1 class="modal-title" id="exampleModalLabel">
                    <span class="material-icons-sharp">
                        dashboard_customize
                    </span>
                    ThÃ´ng tin sáº£n pháº©m
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Avatar">
                            <label for="formFile" class="form-label mt-4">áº¢nh sáº£n pháº©m</label>
                            <input class="form-control" type="file" id="formFile">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="inputName" class="form-label">TÃªn sáº£n pháº©m</label>
                                <input type="text" class="form-control" id="inputName" placeholder="Hoa...">
                            </div>
                            <div class="mb-3">
                                <label for="inputDate" class="form-label">GiÃ¡</label>
                                <input type="number" min="0" class="form-control" id="inputDate">
                            </div>
                            <div>
                                <label for="inputSLTK" class="form-label">Sá» lÆ°á»£ng Äang tá»n kho</label>
                                <input type="number" min="0" class="form-control" id="inputSLTK">
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <select class="form-select" size="1" aria-label="size 3 select example">
                                <option selected>Chá»n Loáº¡i</option>
                                <option value="1">A</option>
                                <option value="2">B</option>
                                <option value="3">C</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Tráº¡ng thÃ¡i</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai" value="true" checked>
                                        <label class="form-check-label" for="inlineRadio1">CÃ²n hÃ ng</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trangthai" id="trangthai" value="false">
                                        <label class="form-check-label" for="inlineRadio2">Háº¿t hÃ ng</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Hiá»n tráº¡ng</label>
                                <div class="ms-5">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="isDelete" id="isDelete" value="true" checked>
                                        <label class="form-check-label" for="inlineRadio1">ChÆ°a xÃ³a</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="isDelete" id="isDelete" value="false">
                                        <label class="form-check-label" for="inlineRadio2">ÄÃ£ xÃ³a</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="exampleFormControlTextarea1" class="form-label">MÃ´ táº£</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"></textarea>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <a type="submit" href="#" class="btn btn-success">LÆ°u thay Äá»i</a>
                <a type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            </div>
        </div>
        </div>
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

</body>
</html>