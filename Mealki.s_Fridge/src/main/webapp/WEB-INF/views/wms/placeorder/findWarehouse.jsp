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

	<h4>| 창고 목록</h4>
	<table id="example-table-1">
		<tr>
			<th>창고 번호</th>
			<th>창고 이름</th>

			<c:forEach var="WarehouseDTO" items="${warehouseList }">
				<tr class="row_a">
					<td id="click_result" style="display: none;"></td>
					<td ondblclick="setParentText()">${WarehouseDTO.whs_num }</td>
					<td ondblclick="setParentText()">${WarehouseDTO.whs_name }</td>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	$(function () {
		$( ".row_a" ).click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var whs_num = td.eq(1).text();
			
			var str = "<input value="+whs_num+" id=whs_num >";
			$("#click_result").html(str);
		});
	});
	
	function setParentText(){
    	opener.document.getElementById("findWarehouse").value = document.getElementById("whs_num").value;
    	window.close();
    }
	</script>
</body>
</html>