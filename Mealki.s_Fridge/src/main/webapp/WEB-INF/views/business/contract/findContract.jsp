<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/business/findContract.css">
	
</head>
<body>
	<h3>|수주현황 </h3>
		<table id="find-table">
			<tr>
				<th style="background-color: #4B49AC; color: #fff;">수주번호</th>
				<th style="background-color: #4B49AC; color: #fff;">거래처코드</th>
				
				<th style="background-color: #4B49AC; color: #fff;">품목코드</th>
				<th style="background-color: #4B49AC; color: #fff;">품목명</th>
<!-- 				<th style="background-color: #4B49AC; color: #fff;">수주업체</th> -->
<!-- 				<th style="background-color: #4B49AC; color: #fff;">수주수량</th> -->
				
				 <c:forEach var="ContractDTO" items="${contractListMap}">
				 <tr class="row_a">	
				 	<td id="business_num">${ContractDTO.business_num }</td>
				 	<td id="cust_num">${ContractDTO.cust_num }</td>
				 	
				 	<td id="item_num">${ContractDTO.item_num }</td>
				 	<td id="item_name">${ContractDTO.item_name }</td>
<%-- 				 	<td id="business_name">${ContractDTO.business_name }</td> --%>
<%-- 				 	<td id="contract_qty">${ContractDTO.contract_qty }</td> --%>
				</tr> 	
			    </c:forEach>
		</table>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>		
<script type="text/javascript">		
	$(function() {
		$(".row_a").click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var cust_num = td.eq(1).text();
// 			var business_num = td.eq(0).text();
			var item_num = td.eq(2).text();
			var item_name = td.eq(3).text();
// 			var business_name = td.eq(4).text();
			var contract_qty = td.eq(5).text();

			
			opener.document.getElementById("cust_num").value = cust_num;
// 			opener.document.getElementById("business_num").value = business_num;
			opener.document.getElementById("item_num").value = item_num;
			opener.document.getElementById("item_name").value = item_name;
// 			opener.document.getElementById("business_name").value = business_name;
			opener.document.getElementById("contract_qty").value = contract_qty;
			
			window.close();
			
		}); 
	 });
	</script>

	
</body>

</html>