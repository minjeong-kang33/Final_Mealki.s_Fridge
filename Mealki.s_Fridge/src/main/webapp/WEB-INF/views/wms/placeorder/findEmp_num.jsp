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

	<h4>| 자재부 사원 목록</h4>
	<table id="example-table-1">
		<tr>
			<th>사원 번호</th>
			<th>사원 이름</th>

			<c:forEach var="EmployeeDTO" items="${employeeList }">
				<tr class="row_a">
					<td id="click_result" style="display: none;"></td>
					<td ondblclick="setParentText()">${EmployeeDTO.emp_num }</td>
					<td ondblclick="setParentText()">${EmployeeDTO.emp_Kname }</td>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(function () {
		$( ".row_a" ).click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var emp_num = td.eq(1).text();
			
			var str = "<input value="+emp_num+" id=emp_num >";
			$("#click_result").html(str);
		});
	});
	
	function setParentText(){
    	opener.document.getElementById("findEmp_num").value = document.getElementById("emp_num").value;
    	window.close();
    }
	</script>
</body>
</html>