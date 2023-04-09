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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css">
  <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-16x16.png" />
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wms/detail.css">
 
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>

	<script type="text/javascript">

	</script>
</head>
<body>

<div class="title_div">
<h3>입고관리 상세</h3>
</div>

<hr>
<table border="1" class="storeDetail_table">
<c:forEach var="StoreDTO" items="${storeDetailList}">
	<tr><th>발주관리번호</th><td>${StoreDTO.order_num }</td><th>납기일</th><td>${StoreDTO.due_date }</td><th>발주일자</th><td>${StoreDTO.order_date }</td><th>발주담당자 사번</th><td>${StoreDTO.emp_num }</td></tr>
	<tr><th>입고관리번호</th><td>${StoreDTO.sto_num }</td><th>입고진행현황</th><td>${StoreDTO.sto_progress }</td><th>입고일자</th><td>${StoreDTO.sto_date }</td><th>입고담당자 사번</th><td>${StoreDTO.sto_empNum }</td></tr>
	<tr><th>품명</th><td>${StoreDTO.item_name }</td><th>발주수량</th><td>${StoreDTO.order_qty }</td><th>재고수량</th><td>${StoreDTO.stk_qnt }</td><th>위치</th>
		<td><c:if test="${StoreDTO.sto_progress eq '입고완료'}">${StoreDTO.sto_shelf } - ${StoreDTO.sto_shelfDetail }</c:if></td>
	</tr>
</c:forEach>	
</table>

<div>
<button class="btn btn-primary" type="submit" id="IconButton6" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;" value="인쇄하기" onclick="window.print()">인쇄하기</button>
</div>
</body>
</html>