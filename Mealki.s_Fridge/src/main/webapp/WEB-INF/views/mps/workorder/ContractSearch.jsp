<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>밀키의 냉장고</title>
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
   <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/workorder.css">
<title>밀키의 냉장고</title>
</head>
<body>


	<div id="contract_search">
		<form action="${pageContext.request.contextPath}/workorder/ContractSearch" method="GET" name="contractsearchform" onsubmit="return checkForm()">
			수주번호 <input name="keyword" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"placeholder="숫자만 입력" value="${param.keyword}">
			<button class="btn btn-primary" type="submit" id="IconButton6"  style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;">
				검색
			</button>
		</form>
	</div>
	
	<div id="contract_list" style="padding-left: 10px; padding-right: 10px;">
	<table border="1" id="orderlist_table">
		<tr>
			<th>수주번호</th>
			<th>품목명</th>
			<th>주문수량</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>납품일자</th>
		</tr>

		<tr onClick="location.href='${pageContext.request.contextPath}/workorder/WoInsert?business_num=${workorderDTO.business_num}';WoInsert();">
			<td>${workorderDTO.business_num}</td>
			<td>${workorderDTO.item_name}</td>
			<td>${workorderDTO.contract_qty}</td>
			<td>${workorderDTO.cust_name}</td>
			<td>${workorderDTO.business_date}</td>
			<td>${workorderDTO.out_date}</td>
		</tr>

	</table>
	</div>
	<script>
	function WoInsert() {
		window.resizeTo(800, 650);
		window.moveTo(500, 150);
	};
	
	function checkForm() {
		let f = document.contractsearchform
		if(f.keyword.value == ""){ 
			alert('검색어가 없습니다.')
			return false
		}
		return true
	}
	</script>
	
</body>
</html>