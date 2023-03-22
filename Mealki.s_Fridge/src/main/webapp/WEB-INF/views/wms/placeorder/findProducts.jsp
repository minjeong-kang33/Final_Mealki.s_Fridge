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
	<h4>| 식자재 목록</h4>
	<table id="example-table-1">
		<tr>
			<th>품번</th>
			<th>품명</th>
			<th>단위</th>
			<th>현재고</th>
			<th>거래처</th>
			<th>납입단가</th>

			<c:forEach var="dto" items="${itemListMap }">
				<tr class="row_a">
					<td id="item_num">${dto.item_num }</td>
					<td id="item_name">${dto.item_name }</td>
					<td id="weight">${dto.weight }</td>
					<td id="stk_qnt">${dto.stk_qnt }</td>
					<td id="supplier">${dto.supplier }</td>
					<td ondblclick="setParentText()" id="supply_price">${dto.supply_price }</td>
				</tr>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script type="text/javascript">
		 $(function() {
			$(".row_a").click(function() {
				var checkList = $(this);
				var td = checkList.children();
				
				var item_num = td.eq(0).text();
				var item_name = td.eq(1).text();
				var weight = td.eq(2).text();
				var stk_qnt = td.eq(3).text();
				var supplier = td.eq(4).text();
				var supply_price = td.eq(5).text();

			opener.document.getElementById("item_num").value = document.getElementById("item_num").innerText;
			opener.document.getElementById("item_name").value = document.getElementById("item_name").innerText;
			opener.document.getElementById("weight").value = document.getElementById("weight").innerText;
			opener.document.getElementById("stk_qnt").value = document.getElementById("stk_qnt").innerText;
			opener.document.getElementById("supplier").value = document.getElementById("supplier").innerText;
			opener.document.getElementById("supply_price").value = document.getElementById("supply_price").innerText;
			window.close();
				

			});
		}); 
 

	</script>
</body>
</html>