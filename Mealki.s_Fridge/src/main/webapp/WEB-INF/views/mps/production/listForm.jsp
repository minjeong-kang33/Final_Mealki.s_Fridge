<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/maincss/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/css/vert	ical-layout-light/style.css">
<!-- endinject -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/production.css">
<%-- <script src="${pageContext.request.contextPath}/resources/mps/productchart.js"></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script> -->
</head>
<body>

	<div class="container-scroller">

		<!-- 헤더, 사이드바,개인설정 시작 
	사이드바와 개인설정은 sidebar에 같이 있음-->
		<jsp:include page="../../main/top.jsp" />
		<jsp:include page="../../main/sidebar.jsp" />
		<!-- 헤더, 사이드바,개인설정 끝 -->


		<!-- 본문시작 -->
		<div class="main-panel">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-md-12 grid-margin">
						<div class="row">
							<div class="col-12 col-xl-8 mb-4 mb-xl-0">
								<!--  제목을 적어주세요 -->
								<h3 class="font-weight-bold">생산 리스트</h3>
							</div>

							<div class="contentbody">

								<!--  본문 내용 시작 -->
								<div id="productionsearch_bar">
									<div id="productiontable_search">
										<div id="productionselect_search">
											<form action="${pageContext.request.contextPath}/mps/production/list" method="GET">
												<label>작업지시번호 : </label>
												<input type="text" name="wo_num" id="search_wo_num">
												<label>라인명 : </label>
												<input type="text" name="manu_name" id="search_manu_name">
												<label>품명 : </label>
												<input type="text" name="item_name" id="search_item_name">
												<label>작업마감일시 : </label>
												<input type="date" name="manu_sdate" id="search_manu_sdate">
												 - <input type="date" name="manu_date" id="search_manu_date">
												<label>작업자 : </label>
												<input type="text" name="emp_Kname" id="search_emp_Kname">
												<button class="btn btn-primary" type="submit" id="IconButton6">
												조회
												</button>
											</form>
										</div>
									</div>
									<br>
								</div>
								
								<div id="production_body">
									<div id="production_bar">
									<h4>| 일일 작업 현황</h4>
									<div class="scrollBar" >
										<table border='1' id="production_table">
											<thead>
											<tr align="center">
												<td class="tdwo_num">작업지시번호</td> 
												<td class="tdmanu_name">라인명</td>
												<td class="tdmanu_code">라인코드</td>
												<td class="tditem_name">품명</td>
												<td class="tditem_num">품번</td>
												<td class="tdunsto_qty">수주량</td>
												<td class="tdmanu_tocount">하루생산량</td>
												<td class="tdmanu_fail">불량</td>
												<td class="tdemp_Kname">작업자</td>
												<td class="tdmanu_date">작업마감일</td>
									         </tr>
									         </thead>
									         <tbody>
									       		<c:forEach var="dto" items="${productionListMap}">
														<tr onClick="updateForm('${dto.manu_date}');">
															<td class="tdwo_num">${dto.wo_num}</td>
															<td class="tdmanu_name">${dto.manu_name}</td>
															<td class="tdmanu_code">${dto.manu_code}</td>
															<td class="tditem_name">${dto.item_name}</td>
															<td class="tditem_num">${dto.item_num}</td>
															<td class="tdunsto_qty">${dto.unsto_qty}</td>
															<td class="tdmanu_tocount">${dto.manu_tocount}</td>
															<td class="tdmanu_fail">${dto.manu_fail}</td>
															<td class="tdemp_Kname">${dto.emp_Kname}</td>
															<td class="tdmanu_date">${dto.manu_date}</td>
														</tr>
												</c:forEach>
											</tbody>
									    </table>
									    <hr>
									    <p>
								</div>
								<!--  본문내용 끝 -->

							</div>
							<!-- 페이징하실거면 여기서 시작 -->
<!-- 							페이징 -->
							<!-- 페이징 끝 -->
						</div>

					</div>

				</div>
					<script type="text/javascript">
						function updateForm(manu_date) {
							var _width = '800';
							var _height = '500';
							var _left = Math.ceil((window.screen.width - _width) / 2);
							var _top = Math.ceil((window.screen.height - _height) / 2);
							let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
							window.open(
							"${pageContext.request.contextPath}/mps/production/update?manu_date="+manu_date,
							"밀키의 냉장고",popOption);}
					</script>
					
				<!-- 이 밑으로 무언가 쓰지 마세요 페이징도 이 위에서 처리되야함. -->

				<!-- 푸터시작 -->
				<jsp:include page="../../main/footer.jsp" />
				<!--  푸터 끝 -->

				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- plugins:js -->
	<script
		src="${pageContext.request.contextPath}/resources/maincss/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script
		src="${pageContext.request.contextPath}/resources/maincss/vendors/chart.js/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/off-canvas.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/hoverable-collapse.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/template.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/settings.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/dashboard.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/maincss/js/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->
</body>
</html>