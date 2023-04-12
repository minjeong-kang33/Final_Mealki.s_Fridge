<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/productionwrite.css">
<!--   Jquery -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script>
	$(document).ready(function(){
			$("#lineselect").on("change", function () {
			var value = $(this).val();
			var wonum = $(this).find("option:selected").data("wonum");
			var item = $(this).find("option:selected").data("itemname");
			var manucode = $(this).find("option:selected").data("manucode");
			var itemnum = $(this).find("option:selected").data("itemnum");
			var sdate = $(this).find("option:selected").data("sdate");
			var unstoqty = $(this).find("option:selected").data("unstoqty");
			
			$('input[name=manu_name]').attr('value',value);
			$('input[name=wo_num]').attr('value',wonum);
			$('input[name=item_name]').attr('value',item);
			$('input[name=manu_code]').attr('value',manucode);
			$('input[name=item_num]').attr('value',itemnum);
			$('input[name=unsto_qty]').attr('value',unstoqty);
				});
			});
</script>
    <script type="text/javascript">
        function click1(){
            var QWForm = document.insertProduct;
            var manu_fail = parseInt(insertProduct.manu_fail.value);
            var manu_tocount = parseInt(insertProduct.manu_tocount.value);
            var lineselect = insertProduct.lineselect.value;
            var unsto_qty = parseInt(insertProduct.unsto_qty.value);
            
            let check = /^[0-9]+$/; 
            if (!check.test(manu_fail)) {
           	alert("숫자만 입력가능 합니다.");
           	console.log("숫자만 입력 가능합니다.");
            }else if(!check.test(manu_tocount)){
            	alert("숫자만 입력가능 합니다.");
            }else if( lineselect == "" || lineselect == null){
            	alert("라인을 선택해 주세요");
            	insertProduct.lineselect.focus();
            }else if( manu_tocount == null){
                alert("수량이 값이 없습니다.");
                insertProduct.manu_tocount.focus();
            } else if(manu_tocount > unsto_qty){
            	alert("생산량이 수주량 보다 많습니다.");
            	console.log(manu_tocount);
            	console.log(manu_fail);
            	console.log(unsto_qty);
            	
            	insertProduct.manu_tocount.focus();
            } else if(manu_fail > unsto_qty){
            	alert("불량이 수주량 보다 많습니다.");
//             	console.log(manu_tocount);
//             	console.log(manu_fail);
//             	console.log(unsto_qty);
            	insertProduct.manu_fail.focus();
            }else {
            	$("#insertProduct").attr("action","${pageContext.request.contextPath}/mps/production/start").submit();
            }
        }
    </script>

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
								<h3 class="font-weight-bold">생산 작업서</h3>
							</div>
							<div class="contentbody">
								<!--  본문 내용 시작 -->

								<div id="writebody">
									<form id="insertProduct" name="insertProduct"  method="POST">
									<div id="line1">
										<span>라인명 : </span> 
										<select name="lineselect" id="lineselect">
											<option value="" data-wonum="" data-itemname=""
												data-manucode="" data-itemnum="" selected="selected">라인을
												선택하세요</option>
											<c:forEach var="sel" items="${selectList}">
												<c:if test="${sel.unsto_qty != sel.manu_tocount}">
													<option value="${sel.manu_name}" data-wonum="${sel.wo_num}"
														data-itemname="${sel.item_name}" data-manucode="${sel.manu_code}"
														data-itemnum="${sel.item_num}" data-unstoqty="${sel.unsto_qty}">${sel.manu_name}</option>
												</c:if>
											</c:forEach>
										</select>
										
										<span>품명 : </span>
										<input type="text" name="item_name" value="" readonly="readonly"> 
										<span>	작업지시번호 : </span>
										<input type="text" name="wo_num" class="wo_num" value="" readonly="readonly">
										<span>	생산량 : </span>
										<input type="text" name="manu_tocount" value="0" class="manu_tocount">
									</div>
										<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
									<div id="line2">
										<input type="hidden" name="manu_name" value=""> 
										<span>생산코드 :</span>
										<input type="text" name="manu_code" value="" readonly="readonly">
										<span> 아이템코드 :</span>
										<input type="text" name="item_num" readonly="readonly">
										<span> 작업자 :</span>
										<input type="text" name="emp_Kname" value="${productionDTO.emp_Kname}" readonly="readonly">
										<span> 불량 :</span> 
										<input type="text" name="manu_fail" value="0" class="manu_fail">
										<input type="text" name="unsto_qty" value="" class="unsto_qty">
										<p>
									</div>

										<!-- 				완료 했을때 완료시간 등록 -->
										<button class="btn btn-primary" type="button" id="IconButton2" onclick="click1()">
										완료</button>

										<!-- 				reset -->
										<button class="btn btn-primary" type="reset" id="IconButton3">
										취소</button>
									</form>
								</div>
								<!--  본문내용 끝 -->
						<!-- 페이징하실거면 여기서 시작 -->
						<!-- 페이징 끝 -->
					</div>

				</div>

			</div>
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