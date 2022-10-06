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
                    <tr>
                      <td scope="row">1</td>
                      <td class="img"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Image product" class="img_avt"></td>
                      <td>Nguyễn Văn A</td>
                      <td>01/04/1999</td>
                      <td>Nam</td>
                      <td>0123456789</td>
                      <td>teo@gmail.com</td>
                      <td>1259 Quang Trung, P.9, Q.Gò Vấp</td>
                      <td>Admin</td>
                      <td>
                        <a href="#" data-bs-toggle="modal" data-bs-target="#editModal" data-bs-whatever="Nguyễn Văn A"><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span></a>
                        <a href="#" ><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Xóa">disabled_by_default</span></a>
                      </td>
                    </tr>
                    <tr>
                        <td class="id" scope="row">2</td>
                        <td class="img"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Image product" class="img_avt"></td>
                        <td>Nguyễn Văn A</td>
                        <td>01/04/1999</td>
                        <td>Nam</td>
                        <td>0123456789</td>
                        <td>teo@gmail.com</td>
                        <td>1259 Quang Trung, P.9, Q.Gò Vấp</td>
                        <td>Admin</td>
                        <td>
                          <a class="edit_btn" href="#" data-bs-toggle="modal" data-bs-target="#editModal"><span class="material-symbols-sharp" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Chỉnh sửa">add_circle</span></a>
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
                        badge
                    </span>
                    ThÃ´ng tin ngÆ°á»i dÃ¹ng
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="row g-3">
                        <div class="col-md-6">
                            <img class="avatar" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6iPDSqcgCcAtdEz_rPY0B-sxqMd7hz0Hlg&usqp=CAU" alt="Avatar">
                            <label for="formFile" class="form-label mt-3">áº¢nh Äáº¡i diá»n</label>
                            <input class="form-control" type="file" id="formFile">
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="inputName" class="form-label">Há» vÃ  tÃªn</label>
                                <input type="text" class="form-control" id="inputName" placeholder="Nguyá»n VÄn A...">
                            </div>
                            <div class="mb-3">
                                <label for="inputDate" class="form-label">NgÃ y sinh</label>
                                <input type="date" class="form-control" id="inputDate">
                            </div>
                            <div>
                                <label for="inputPassword4" class="form-label">Giá»i tÃ­nh</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender" value="true">
                                        <label class="form-check-label" for="inlineRadio1">Nam</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender" value="false">
                                        <label class="form-check-label" for="inlineRadio2">Ná»¯</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="inputPhone" class="form-label">Sá» Äiá»n thoáº¡i</label>
                            <input type="text" class="form-control" id="inputPhone" placeholder="VD: 038, 096,...">
                        </div>
                        <div class="col-md-6">
                          <label for="inputAccount" class="form-label">TÃ i khoáº£n</label>
                          <input type="text" class="form-control" id="inputAccount">
                        </div>
                        <div class="col-md-6">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="inputEmail" placeholder="nva@gmail.com">
                        </div>
                        <div class="col-md-6">
                          <label for="inputPassword" class="form-label">Máº­t kháº©u</label>
                          <input type="password" class="form-control" id="inputPassword">
                        </div>
                        <div class="col-md-6">
                          <label for="inputAddress" class="form-label">Äá»a chá»</label>
                          <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                        </div>
                        <div class="col-md-6">
                            <label for="inputPassword4" class="form-label">Vai trÃ²</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule" value="true">
                                    <label class="form-check-label" for="inlineRadio1">Admin</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule" value="false">
                                    <label class="form-check-label" for="inlineRadio2">NhÃ¢n viÃªn</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="rule" id="rule" value="false">
                                    <label class="form-check-label" for="inlineRadio2">KhÃ¡ch hÃ ng</label>
                                </div>
                            </div>
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