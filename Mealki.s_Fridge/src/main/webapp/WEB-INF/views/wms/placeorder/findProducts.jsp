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
	<div style="text-align: center; margin-top: 10px;">
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			<a href="${pageContext.request.contextPath}/wms/placeorder/findProducts?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지 이전]</a>
		</c:if>
				
		<c:if test="${pageDTO.currentPage > 0}">
			<c:forEach var="i" begin="${pageDTO.startPage }" end="4" step="1">
				<a href="${pageContext.request.contextPath}/wms/placeorder/findProducts?pageNum=${i}">${i}</a> 
			</c:forEach>
		</c:if>

		<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			<a href="${pageContext.request.contextPath}/wms/placeorder/findProducts?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지 다음]</a>
		</c:if> 
	</div>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	/* 현재고량이 10미만일 경우 빨간 글씨로 표시 */
	var rows = document.querySelectorAll('#example-table-1 tr');

	rows.forEach(function(row) {
	  var stk_qnt_td = row.querySelector('#stk_qnt');

	  if (stk_qnt_td && stk_qnt_td.textContent.trim() !== '' && parseInt(stk_qnt_td.textContent.trim()) < 10) {
	    stk_qnt_td.style.color = 'red';
	  }
	});
	</script>
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
			}); 
		 });
	</script>
	
</body>

</html>