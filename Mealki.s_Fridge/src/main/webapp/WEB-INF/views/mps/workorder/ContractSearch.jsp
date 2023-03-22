<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/workorder.css">
<title>밀키의 냉장고</title>
</head>
<body>


	<br>
	<form
		action="${pageContext.request.contextPath}/workorder/ContractSearch"
		method="GET">
		수주번호검색 <input name="keyword" type="text"
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
			placeholder="검색어를 입력해주세요">
		<button>검색</button>
	</form>

	<br>
	<table border="1" id='testTable'>
		<tr>
			<th>수주번호</th>
			<th>품목명</th>
			<th>주문수량</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>납품일자</th>
		</tr>


		<tr onClick="location.href='${pageContext.request.contextPath}/workorder/WoInsert'">
			<td>${workorderDTO.business_num}</td>
			<td>${workorderDTO.item_name}</td>
			<td>${workorderDTO.contract_qty}</td>
			<td>${workorderDTO.business_name}</td>
			<td>${workorderDTO.business_date}</td>
			<td>${workorderDTO.out_date}</td>
		</tr>


	</table>



	<input type="button" value="닫기" onclick="window.close()">
	
</body>
</html>