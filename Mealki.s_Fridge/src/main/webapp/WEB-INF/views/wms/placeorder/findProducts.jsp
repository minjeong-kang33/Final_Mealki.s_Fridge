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
	<h3>| 식자재 목록</h3>
	<table id="example-table-1">
		<tr>
			<th style="background-color: #4B49AC; color: #fff;">품번</th>
			<th style="background-color: #4B49AC; color: #fff;">품명</th>
			<th style="background-color: #4B49AC; color: #fff;">단위</th>
			<th style="background-color: #4B49AC; color: #fff;">현재고</th>
			<th style="background-color: #4B49AC; color: #fff;">거래처</th>
			<th style="background-color: #4B49AC; color: #fff;">납입단가</th>
			
			
			<c:forEach var="dto" items="${itemListMap }">
			<tr class="row_a">
					<td id="item_num">${dto.item_num }</td>
					<td id="item_name">${dto.item_name }</td>
					<td id="weight">${dto.weight }</td>
					<td id="stk_qnt">${dto.stk_qnt }</td>
					<td id="supplier">${dto.supplier }</td>
					<td id="supply_price">${dto.supply_price }</td>
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
				
				var index = $(this).index() + 1;

				window.opener.postMessage({
					  item_num: item_num,
					  item_name: item_name,
					  weight: weight,
					  stk_qnt: stk_qnt,
					  supplier: supplier,
					  supply_price: supply_price,
					  index: index
					}, '*');

					// 팝업 창 닫기
					window.close();
				
				/* var index = $(this).index()+1;
	            
	            opener.document.getElementById("item_num_" + index).value = item_num;
	            opener.document.getElementById("item_name_" + index).value = item_name;
	            opener.document.getElementById("weight_" + index).value = weight;
	            opener.document.getElementById("stk_qnt_" + index).value = stk_qnt;
	            opener.document.getElementById("supplier_" + index).value = supplier;
	            opener.document.getElementById("supply_price_" + index).value = supply_price; */
				
			}); 
		 });
			/* opener.document.getElementById("item_num").value = item_num;
			opener.document.getElementById("item_name").value = item_name;
			opener.document.getElementById("weight").value = weight;
			opener.document.getElementById("stk_qnt").value = stk_qnt;
			opener.document.getElementById("supplier").value = supplier;
			opener.document.getElementById("supply_price").value = supply_price; */
	</script>
	
</body>

</html>