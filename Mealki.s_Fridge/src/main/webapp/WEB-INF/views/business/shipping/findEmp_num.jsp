<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/wms/findWarehouse.css">
</head>
<body>

	<h3>| 담당자 목록</h3>
	<table id="example-table-1">
		<tr>
			<th style="background-color: #4B49AC; color: #fff;">담당자</th>
			<th style="background-color: #4B49AC; color: #fff;">수주업체</th>

			<c:forEach var="EmployeeDTO" items="${employeeList }">
				<tr class="row_a">
					<td>${EmployeeDTO.incharge_name }</td>
					<td>${EmployeeDTO.business_name }</td>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(function () {
		$( ".row_a" ).click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var incharge_name = td.eq(0).text();
			var business_name = td.eq(1).text();
			
			opener.document.getElementById("incharge_name").value = incharge_name;
			opener.document.getElementById("business_name").value = business_name;
	    	window.close();
		});
	});
	</script>
</body>
</html>