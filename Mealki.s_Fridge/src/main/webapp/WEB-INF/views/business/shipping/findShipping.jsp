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
	<h3>| 출하현황 목록</h3>
	<table id="example-table-1">
		<tr>
			<th style="background-color: #4B49AC; color: #fff;">작업지시번호</th>
			<th style="background-color: #4B49AC; color: #fff;">품목코드</th>
			<th style="background-color: #4B49AC; color: #fff;">품목명</th>
			<th style="background-color: #4B49AC; color: #fff;">재고수량</th>
<!-- 			<th style="background-color: #4B49AC; color: #fff;">거래처</th> -->
<!-- 			<th style="background-color: #4B49AC; color: #fff;">수주업체</th> -->
			
			
			<c:forEach var="dto" items="${itemListMap}">
			<tr class="row_a">
					<td id="wo_num">${dto.wo_num }</td>
					<td id="item_num">${dto.item_num }</td>
					<td id="item_name">${dto.item_name }</td>
					<td id="qc_qty">${dto.qc_qty }</td>
					
			</tr>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		 $(function() {
			$(".row_a").click(function() {
				var checkList = $(this);
				var td = checkList.children();
				var wo_num = td.eq(0).text();
				var item_num = td.eq(1).text();
				var item_name = td.eq(2).text();
				var qc_qty = td.eq(3).text();
// 				var supplier = td.eq(4).text();
// 				var supply_price = td.eq(5).text();

				opener.document.getElementById("wo_num").value = wo_num;
				opener.document.getElementById("item_num").value = item_num;
				opener.document.getElementById("item_name").value = item_name;
				opener.document.getElementById("qc_qty").value = qc_qty;
				
				
				window.close();
				
			}); 
		 });

	</script>
</body>
</html>