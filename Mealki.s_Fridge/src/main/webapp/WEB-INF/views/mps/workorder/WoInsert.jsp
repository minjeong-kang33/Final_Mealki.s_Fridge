<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
</head>
<body>
		
			수주번호 - ${WorkorderDTO.business_num} <br>
			품목 - ${WorkorderDTO.item_name} <br>
			수량 - ${WorkorderDTO.contract_qty} <br>
			
	<table border="1">
		<tr>
			<td>원재료</td>
			<td>원재료 지시수량</td>
		</tr>

		<c:forEach var="WorkorderDTO" items="${WoInsert}">
			<tr>
				<td>${WorkorderDTO.r_name}</td>
				<td>${WorkorderDTO.wo_qty} EA</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>