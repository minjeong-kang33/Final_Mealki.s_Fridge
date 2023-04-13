<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
 <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/wms/findProduct.css">
</head>
<body>
	<h4>| 식자재 목록</h4>
	<table id="example-table-1">
		<tr>
			<th>품번</th>
			<th>품명</th>
			<th>단위</th>
			<th>현재고</th>
			<th>거래처</th>
			
			
			<c:forEach var="dto" items="${itemListMapStore }">
			<tr class="row_a">
					<td id="item_num">${dto.item_num }</td>
					<td id="item_name">${dto.item_name }</td>
					<td id="weight">${dto.weight }</td>
					<td id="stk_qnt">${dto.stk_qnt }</td>
					<td id="supplier">${dto.supplier }</td>
			</tr>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		 $(function() {
			$(".row_a").click(function() {
				
				var checkList = $(this);
				var td = checkList.children();
				
				var item_name = td.eq(1).text();

				opener.document.getElementById("item_name").value = item_name;
				
				window.close();
				
			}); 
		 });

	</script>
</body>
</html>