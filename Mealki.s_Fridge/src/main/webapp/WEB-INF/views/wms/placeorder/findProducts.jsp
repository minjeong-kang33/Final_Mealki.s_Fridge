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
					<td>${dto.item_num }</td>
					<td>${dto.item_name }</td>
					<td>${dto.weight }</td>
					<td>${dto.stk_qnt }</td>
					<td>${dto.supplier }</td>
					<td>${dto.supply_price }</td>
				</tr>
			</c:forEach>
	</table>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
/* 		detailView(item_num,item_name,weight,stk_qnt,supplier)
		{
			window.opener.document.getElementById("text").value = document.getElementById("text").value;
			window.opener.document.OFsearch.item_num.value = item_num;
			window.opener.document.OFsearch.item_name.value = item_name;
			window.opener.document.OFsearch.weight.value = weight;
			window.opener.document.OFsearch.stk_qnt.value = stk_qnt;
			window.opener.document.OFsearch.supplier.value = supplier;
			window.opener.document.OFsearch.submit(); //폼 전송

			self.close(); //자식창 닫기

		} */
	</script>
	<script type="text/javascript">
		/* $(function() {
			$(".row_a").click(function() {
				var checkList = $(this);
				var td = checkList.children();
				var item_num = td.eq(1).text();

				var str = "<input value="+item_num+" id=item_name >";
				$("#click_result").html(str);
			});
		}); */
/* 
		function setParentText() {
			opener.document.getElementById("findProducts").value = document.getElementById("item_name").value;
			opener.document.getElementById("findProducts").value = document.getElementById("item_name").value;
			window.close();
		} */
	</script>
</body>
</html>