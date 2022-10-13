<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div class="container1">
        <!-- BEGIN ASIDE -->
        <aside>
          <%@include file="/views/header/headeradmin.jsp"%>
        </aside>
        <!-- END ASIDE -->

        <main>
            <h1>Dashboard</h1>

            <div class="insights">
                <!-- Tổng tiền trong tháng -->
                <div class="total">
                    <span class="material-symbols-outlined bg-primary">payments</span>
                    <div>
                        <h3>Tổng tiền trong tháng</h3>
                    </div>
                    <div class="middle">
                        <h1> <fmt:formatNumber value="${tongtien}" type="number" maxFractionDigits = "3"> </fmt:formatNumber> VND </h1>
                    </div>
                </div>
                <!-- Số sản phẩm đã bán -->
                <div class="sold">
                    <span class="material-symbols-outlined bg-success">archive</span>
                    <div>
                        <h3>Sản phẩm đã bán</h3>
                    </div>
                    <div class="middle">
                        <h1>${tongsanpham}</h1>
                    </div>
                </div>
                <!-- Số đơn đang chờ xác nhận -->
                
                <div class="order">
                    <span class="material-symbols-outlined bg-danger">receipt_long</span>
                    <div>
                        <h3>Đơn chờ xác nhận</h3>
                    </div>
                    <div class="middle">
                        <h1>${xacnhan}</h1>
                    </div>
                </div>
            </div>

            <div class="recent-orders">
                <h2 class="my-3">Đơn hàng đang chờ xác nhận</h2>
                <table>
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Tên người mua</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền (vnđ)</th>
                            <th>Trạng thái</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ID00001</td>
                            <td>Nguyễn Duy Anh</td>
                            <td>1</td>
                            <td>7.000.000</td>
                            <td class="status">Chờ xác nhận</td>
                            <td>
                                <a class="text-success" href="#" type="submit"><span class="material-symbols-outlined">check_box</span></a>
                                <a class="text-danger" href="#" type="submit"><span class="material-symbols-outlined">disabled_by_default</span></a>
                            </td>
                        </tr>
                        <tr>
                            <td>ID00002</td>
                            <td>Nguyễn Duy Anh</td>
                            <td>1</td>
                            <td>7.000.000</td>
                            <td class="status">Chờ xác nhận</td>
                            <td>
                                <a class="text-success" href="#" type="submit"><span class="material-symbols-outlined">check_box</span></a>
                                <a class="text-danger" href="#" type="submit"><span class="material-symbols-outlined">disabled_by_default</span></a>
                            </td>
                        </tr>
                        <tr>
                            <td>ID00003</td>
                            <td>Nguyễn Duy Anh</td>
                            <td>1</td>
                            <td>7.000.000</td>
                            <td class="status">Chờ xác nhận</td>
                            <td>
                                <a class="text-success" href="#" type="submit"><span class="material-symbols-outlined">check_box</span></a>
                                <a class="text-danger" href="#" type="submit"><span class="material-symbols-outlined">disabled_by_default</span></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="chart">
                <h2>Doanh thu năm 2022</h2>
                <div class="line-chart" id="curve_chart" style="width: 100%; height: 67vh;"></div>
            </div>
            
        </main>

        <div class="right">
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

            <!-- SHOP-INFO -->
            <div class="shop-info">
                <h2>Thông tin</h2>
                <div class="info">
                    <div class="box-info bg-dark">
                        <span class="material-icons-sharp">
                            checklist_rtl
                        </span>
                        <h3>Đơn hàng hoàn thành</h3>
                        <div class="amount1">${dagiao} đơn đã giao</div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
                        </div>
                    </div>
                    <div class="box-info bg-success">
                        <span class="material-icons-sharp">
                            mark_unread_chat_alt
                        </span>
                        <h3>Số lượng đánh giá tốt</h3>
                        <div class="amount1">Tổng: ${danhgia} đánh giá</div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped bg-warning progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
                        </div>
                    </div>
                    <div class="box-info bg-danger">
                        <span class="material-icons-sharp">
                            account_box
                        </span>
                        <h3>Số lượng tài khoản</h3>
                        <div class="amount">
                            ${user}
                        </div>
                    </div>
                    <div class="box-info">
                        <span class="material-icons-sharp">
                            inventory
                        </span>
                        <h3>Tổng đơn hàng đã bán</h3>
                        <div class="amount">
                            ${dagiao}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CHART -->
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
  
        function drawChart() {
          var data = google.visualization.arrayToDataTable([
            ['Tháng', 'Tổng tiền'],
            ['1',  10000000],
            ['2',  16000000],
            ['3',  23000000],
            ['4',  3000000],
            ['5',  15000000],
            ['6',  7000000],
            ['7',  50000000],
            ['8',  70000000],
            ['9',  8000000],
            ['10',  0],
            ['11',  0],
            ['12',  1000000]
          ]);
  
          var options = {
            title: '',
            curveType: 'function',
            legend: { position: 'bottom' }
          };
  
          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
  
          chart.draw(data, options);
        }
    </script>

    <script src="<c:url value='/css/admin.js'/>"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>