<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/workorder.css">
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
</head>
<body>
<div style="padding:10px;">

	<div style="text-align: center; padding:30px 10px 10px 30px;"> 
	<h1>작업지시서 등록</h1>
	</div>
	
	<form action="${pageContext.request.contextPath}/mps/workorder/WoInsertPro" method="post" name="woinsertform" onsubmit="return checkForm()">
	<div style="text-align: right;">
	<b>작성일 : <a id="current_date"></a></b>
	</div>
	
	<table border="1" id="orderlist_table">
		<c:forEach var="WorkorderDTO" items="${WoInsert}" begin="0" end="0">
			<tr>
				<th colspan="2">수주번호</th>
				<th colspan="2">
				${WorkorderDTO.business_num}
				<input type="hidden" name="business_num" value="${WorkorderDTO.business_num}">
				</th>
			</tr>
			<tr>
				<td colspan="2"><b>생산라인</b></td>
				<td colspan="2">
					<select id="manu_name" name="manu_name">
						<option value="" disabled selected hidden>--생산라인선택--</option>
						<option value="가공1">가공1</option>
						<option value="가공2">가공2</option>
						<option value="가공3">가공3</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><b>품목코드</b></th>
				<th><b>품목명</b></th>
				<th><b>수량</b></th>
				<th></td>
			</tr>
			<tr>
				<td>${WorkorderDTO.item_num}</td>
				<td>
				${WorkorderDTO.item_name}
				<input type="hidden" name="item_name" value="${WorkorderDTO.item_name}">
				</td>
				<td>
					${WorkorderDTO.contract_qty} EA
					<input type="hidden" name="contract_qty" value="${WorkorderDTO.contract_qty}">
				</td>
				
				<td></td>
			</tr>
		</c:forEach>
		<tr>
			<th>ㄴ</th>
			<th><b>원재료 품목코드</b></th>
			<th><b>원재료 품목명</b></th>
			<th><b>수량</b></th>
		</tr>
		<c:forEach var="WorkorderDTO" items="${WoInsert}">
			<tr>
				<td></td>
				<td>${WorkorderDTO.ritem_num}</td>
				<td>${WorkorderDTO.r_name}</td>
				<td>${WorkorderDTO.wo_qty} EA</td>
			</tr>
		</c:forEach>
	</table>

		
		
	<div style="margin-top:10px; text-align: right;">
		<input type="submit" value="등록" class="btn btn-primary" style="margin-left: 10px; padding-top: 5px; padding-bottom: 5px;"> 
		<input type="button" value="취소" onclick="window.close()" class="btn btn-primary" style="margin-left: 10px; padding-top: 5px; padding-bottom: 5px;">
	</div>
	
</form>
		
</body>
		
	<script>
		date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
   		document.getElementById("current_date").innerHTML = year + "년 " + month
				+ "월 " + day + "일";
	</script>
	
	<script>
		function checkForm() {
		let f = document.woinsertform
		if(f.manu_name[0].selected){ 
			alert('생산라인을 선택하세요')
			return false
		}
		return true
	}
	</script>
</html>