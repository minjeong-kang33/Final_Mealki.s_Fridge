<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
</head>
<body>

	수주번호검색
	<br>
	<a href=# onclick="return SujuSearch();" class="btn">검색</a>
	<br>
	<table border="1">
		<tr>
			<td>수주번호</td>
			<td>품목명</td>
			<td>수주업체</td>
			<td>수주일자</td>
			<td>납품일자</td>
		</tr>

		<c:forEach var="WorkorderDTO" items="${contractList}">
			<tr>
				<td>${WorkorderDTO.business_num}</td>
				<td>${WorkorderDTO.item_name}</td>
				<td>${WorkorderDTO.business_name}</td>
				<td>${WorkorderDTO.business_date}</td>
				<td>${WorkorderDTO.out_date}</td>
			</tr>
		</c:forEach>

	</table>
	


	<input type="button" value="닫기" onclick="window.close()">

</body>
</html>