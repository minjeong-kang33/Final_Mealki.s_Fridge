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
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h3>| 상품 유형</h3>
	<table id="example-table-1">
		<tr>
			<th style="background-color: #4B49AC; color: #fff;">상품 유형</th>

			<c:forEach var="ItemDTO" items="${item_typeList }">
				<tr class="row_a">
					<td>${ItemDTO.item_type }</td>
			</c:forEach>
	</table>
	
<script type="text/javascript">
	$(function () {
		$( ".row_a" ).click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var item_type = td.eq(0).text();
			
			opener.document.getElementById("finditem_type").value = item_type;
			window.close();
		});
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
</body>
</html>