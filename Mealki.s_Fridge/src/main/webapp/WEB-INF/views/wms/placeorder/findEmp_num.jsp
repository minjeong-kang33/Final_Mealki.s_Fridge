<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
 <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/wms/findWarehouse.css">
</head>
<body>

	<h3>| 자재부 사원 목록</h3>
	<table id="example-table-1">
		<tr>
			<th style="background-color: #4B49AC; color: #fff;">사원 번호</th>
			<th style="background-color: #4B49AC; color: #fff;">사원 이름</th>

			<c:forEach var="EmployeeDTO" items="${employeeList }">
				<tr class="row_a">
					<td>${EmployeeDTO.emp_num }</td>
					<td>${EmployeeDTO.emp_Kname }</td>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(function () {
		$( ".row_a" ).click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var emp_num = td.eq(0).text();
			
			opener.document.getElementById("findEmp_num").value = emp_num;
	    	window.close();
		});
	});
	</script>
</body>
</html>