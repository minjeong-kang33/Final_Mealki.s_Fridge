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
<h3>출고관리 상세</h3>
</div>

<hr>
<table border="1" class="storeDetail_table">
<c:forEach var="UnstoreDTO" items="${unstoreDetailList}">
	<tr><th>작업지시번호</th><td>${UnstoreDTO.wo_num }</td><th>납기일</th><td>${UnstoreDTO.out_date }</td><th>작업지시일자</th><td>${UnstoreDTO.wo_date }</td><th>작업지시 담당자 사번</th><td>${UnstoreDTO.wo_emp }</td></tr>
 <tr><th>출고관리번호</th><td>${UnstoreDTO.unsto_num }</td><th>출고진행현황</th><td>${UnstoreDTO.unsto_progress }</td><th>출고일자</th><td>${UnstoreDTO.unsto_date }</td><th>출고담당자 사번</th><td>${UnstoreDTO.emp_num }</td></tr>
	<tr><th>품명</th><td colspan="3">${UnstoreDTO.item_name }</td><th>납품처명</th><td colspan="3">${UnstoreDTO.business_name }</td></tr>
</c:forEach>	
</table>
<br>
<table border="1" class="storeDetail_table">
	<tr><th>원재료품목코드</th><th>원재료명</th><th>필요수량</th><th>재고수량</th><th>재고상태</th></tr>
<c:forEach var="UnstoreDTO" items="${unstoreStatus}">
	<tr><td>${UnstoreDTO.item_num }</td><td>${UnstoreDTO.item_name }</td><td>${UnstoreDTO.wo_qty }</td><td>${UnstoreDTO.stk_qnt }</td><td>${UnstoreDTO.unstore_status }</td></tr>
</c:forEach>
</table>

<div>
<button class="btn btn-primary" type="submit" id="IconButton6" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;" value="인쇄하기" onclick="window.print()">인쇄하기</button>
</div>
</body>
</html>