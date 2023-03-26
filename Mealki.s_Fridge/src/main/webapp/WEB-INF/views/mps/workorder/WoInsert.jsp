<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/woinsert.css">
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
</head>
<body>

	<h1>작업지시서 등록</h1>
	<form action="${pageContext.request.contextPath}/mps/workorder/WoInsertPro" method="post" name="woinsertform" onsubmit="return checkForm()">
	<b>작성일 : <a id="current_date"></a></b>
<%-- 	<b>작성자 : ${sessionScope.emp_num}</b> --%>
	<table>
		<c:forEach var="WorkorderDTO" items="${WoInsert}" begin="0" end="0">
			<tr>
				<th colspan="2">수주번호</th>
				<th colspan="2">
				${WorkorderDTO.business_num}
				<input type="hidden" name="business_num" value="${WorkorderDTO.business_num}">
				</th>
			</tr>
			<tr>
<%-- 				<c:if test="${! empty WorkorderDTO.manu_num }"> --%>
<!-- 					이게맞나 -->
<%-- 				</c:if> --%>
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
				<td><b>품목코드</b></td>
				<td><b>품목명</b></td>
				<td><b>수량</b></td>
				<td></td>
			</tr>
			<tr>
				<td>${WorkorderDTO.item_num}</td>
				<td>
				${WorkorderDTO.item_name}
				<input type="hidden" name="item_name" value="${WorkorderDTO.item_name}">
				</td>
				<td>
					${WorkorderDTO.contract_qty}
					<input type="hidden" name="contract_qty" value="${WorkorderDTO.contract_qty}">
				</td>
				
				<td></td>
			</tr>
		</c:forEach>
		<tr>
			<td>ㄴ</td>
			<td><b>원재료코드</b></td>
			<td><b>원재료명</b></td>
			<td><b>수량</b></td>
		</tr>
		<c:forEach var="WorkorderDTO" items="${WoInsert}">
			<tr>
				<td></td>
				<td>원재료번호값</td>
				<td>${WorkorderDTO.r_name}</td>
				<td>${WorkorderDTO.wo_qty}EA</td>
			</tr>
		</c:forEach>
	</table>

		
		
	<div class="button">
		<input type="submit" value="등록" > 
		<input type="button" value="취소" onclick="window.close()">
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