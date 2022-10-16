<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/views/head/linkhead.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	<div class="container-fluid">
		<!-- BEGIN ASIDE -->
		<div class="row">
			<div class="col-2 col-md-2 m-0 p-4">
				<aside>
					<%@include file="/views/header/headeradmin.jsp"%>
				</aside>
			</div>
			<div class="col-10 col-md-10 m-0 p-3">
				<div class="right">
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

					<!-- Chart Area -->
					<div class="container-fluid chart">
						<div class="top-title">
							<h1>BIỂU ĐỒ THỐNG KÊ</h1>
						</div>
						<!-- Select box to chose years -->
						<form action="thongke" method="get">
							<div class="col-md-4 row year m-auto">
								<div class="col-3 col-md-3 p-0 year-title">
									<label for="inputSLTK" class="form-label">Năm:</label>
								</div>
								<div class="col-6 col-md-6 p-0 year-value">
									<form:select path="years" class="form-select"
										aria-label="size 3 select example" name="year">
										<c:forEach var="item" items="${years}">
											<option value="${item.years}">${item.years}</option>
										</c:forEach>
									</form:select>
								</div>
								<div class="col-3 col-md-3 p-0">
									<button class="btn btn btn-primary">Filter</button>
								</div>

							</div>
						</form>
						<!-- Show chart to layout -->
						<div class="chart-respon row">
							<div class="chart-area col">
								<canvas id="myChart"></canvas>
							</div>
							<div class="chart-area col">
								<canvas id="myChartCol"></canvas>
							</div>
						</div>
						<div class="chart-respon row">
							<div class="chart-area col">
								<canvas id="myChartRadar"></canvas>
							</div>
							<div class="chart-area col">
								<canvas id="myChartPolar"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- CHART -->
	<script> /*get data from jsp - data*/
		let nameCate = [], numCate = [], numCateRadar2=[];
		<c:forEach var="item" items="${value}">
		nameCate.push('${item.date}')
		numCate.push('${item.total}')
		numCateRadar2.push('${item.total*Math.floor(Math.random() * (5 - 2)) + 2}')
		</c:forEach>
		/*create chart from data*/
		window.onload = function() {
			cateChart("myChart", nameCate, numCate)
			colChart("myChartCol", nameCate, numCate)
			polarChart("myChartPolar", nameCate, numCate)
			radarChart("myChartRadar", nameCate, numCate, numCateRadar2)
		}
	</script>
	<script src="<c:url value='/css/script.js'/>"></script>
	<script src="<c:url value='/css/admin.js'/>"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>