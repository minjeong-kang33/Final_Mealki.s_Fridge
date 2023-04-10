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
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/quality.css">
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
								<h3 class="font-weight-bold">품질 관리</h3>
								</h6>
							</div>

							<div class="contentbody">

								<!--  본문 내용 시작 -->
								<div id="productionsearch_bar">
									<div id="productiontable_search">
										<div id="productionselect_search">
											<form action="${pageContext.request.contextPath}/mps/quality/list" method="GET">
												<label>작업지시번호 : </label>
												<input type="text" name="wo_num" id="search_wo_num">
												<label>라인명 : </label>
												<input type="text" name="manu_name" id="search_manu_name">
												<label>품명 : </label>
												<input type="text" name="item_name" id="search_item_name">
												<label>작업일시 : </label>
												<input type="date" name="qc_sdate" id="search_manu_sdate">
												<input type="date" name="qc_edate" id="search_manu_date">
<!-- 												<label>작업일시 : </label> -->
<!-- 												<input type="date" name="fail_sdate" id="search_manu_sdate"> -->
<!-- 												 - <input type="date" name="fail_edate" id="search_manu_date"> -->
												<label>검수자 : </label>
												<input type="text" name="emp_Kname" id="search_emp_Kname">
												<button class="btn btn-primary" type="submit" id="IconButton6">
												조회
												</button>
											</form>
										</div>
									</div>
								</div>
								<br>
								<div id="production_body">
									<div id="production_bar">
									<h4>| 품질 작업 현황</h4>
									<div class="scrollBar" >
										<table border='1' id="production_table" style="width:100%">
											<thead>
											<tr align="center">
												<td >검수번호</td>
												<td style="width: 150px">작업지시번호</td> 
												<td >라인명</td>
												<td >라인코드</td>
												<td >품명</td>
												<td >품번</td>
												<td >검수자 </td>
												<td >수주량</td>
												<td >생산량 </td>
												<td >검수량 </td>
												<td >불량  </td>
												<td >검수완료일자  </td>
												<td >검수상태 </td>
									         </tr>
									         </thead>
<!-- 									         test -->
											 <tbody>
									       		<c:forEach var="dto" items="${qualityListMap}">
													<tr onClick="writeForm('${dto.wo_num}');">
														<td >${dto.qc_code}</td>
														<td style="width: 150px">${dto.wo_num}</td>
														<td >${dto.manu_name}</td>
														<td >${dto.manu_code}</td>
														<td >${dto.item_name}</td>
														<td >${dto.item_num}</td>
														<td >${dto.emp_Kname}</td>
														<td >${dto.wo_qty}</td>
														<td >${dto.manu_tocount}</td>
														<td >${dto.qc_qty}</td>
														<td >${dto.manu_fail}</td>
														<td >${dto.qc_date}</td>
														<c:choose>
															<c:when test="${dto.qc_qty ne dto.wo_qty and !empty dto.qc_qty}">
															<td >검수중</td>
															</c:when>
															<c:when test="${dto.qc_qty eq dto.wo_qty}">
															<td >완료</td>
															</c:when>
															<c:otherwise>
															<td >대기</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
												</tbody>
									    </table>
									</div>
								</div>
								<br>
								
<!-- 								불량 리스트  -->
								<div id="production_body">
									<div id="production_body">
									<h4>| 불량 현황</h4>
									<div class="scrollBar" >
										<table border='1' id="production_table" style="width:100%">
										<thead>
											<tr align="center" >
												<td>불량번호</td>
												<td>작업지시번호</td> 
												<td>라인명</td>
												<td>라인코드</td>
												<td>품명</td>
												<td>품번</td>
												<td>검수자 </td>
<!-- 												<td>불량코드 </td> -->
												<td>불량수량  </td>
												<td>검수완료일자  </td>
									         </tr>
									         </thead>
<!-- 									         test -->
											 <tbody>
									       		<c:forEach var="fail" items="${qualityFailList}">
									       		<c:if test="${fail.fail_qty ne null and fail.fail_qty ne 0}">
													<tr onClick="failWrite('${fail.wo_num}');">
														<td>${fail.fail_num}</td><td>${fail.wo_num}</td>
														<td>${fail.manu_name}</td><td>${fail.manu_code}</td>
														<td>${fail.item_name}</td><td>${fail.item_num}</td>
														<td>${fail.emp_Kname}</td><td>${fail.fail_qty}</td>
														<td>${fail.fail_date}</td>
													</tr>
												</c:if>
												</c:forEach>
											 </tbody>
									    </table>
									</div>
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
						function writeForm(wo_num) {
							var _width = '800';
							var _height = '500';
							var _left = Math.ceil((window.screen.width - _width) / 2);
							var _top = Math.ceil((window.screen.height - _height) / 2);
							let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
							window.open(
							"${pageContext.request.contextPath}/quality/writeForm?wo_num="+wo_num,
							"밀키의 냉장고",popOption);}
					</script>
					
					<script type="text/javascript">
						function failWrite(wo_num) {
							var _width = '800';
							var _height = '550';
							var _left = Math.ceil((window.screen.width - _width) / 2);
							var _top = Math.ceil((window.screen.height - _height) / 2);
							let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
							window.open(
							"${pageContext.request.contextPath}/quality/failWrite?wo_num="+wo_num,
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