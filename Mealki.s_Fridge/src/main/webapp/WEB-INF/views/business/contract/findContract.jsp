<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
 <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/business/findContract.css">
	
</head>
<body>
	<h3>|거래처목록 </h3>
		<table id="find-table">
			<tr>

				<th style="background-color: #4B49AC; color: #fff;">거래처코드</th>
				<th style="background-color: #4B49AC; color: #fff;">거래처명</th>
				
				
				 <c:forEach var="ContractDTO" items="${contractListMap}">
				 <tr class="row_a">	
				 	<td id="cust_num">${ContractDTO.cust_num }</td>
				 	<td id="cust_name">${ContractDTO.cust_name }</td>
				</tr> 	
			    </c:forEach>
		</table>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>		
<script type="text/javascript">		
	$(function() {
		$(".row_a").click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var cust_num = td.eq(0).text();
			var cust_name = td.eq(1).text();


			
			opener.document.getElementById("cust_num").value = cust_num;
			opener.document.getElementById("cust_name").value = cust_name;
			
			
			window.close();
			
		}); 
	 });
	</script>

	
</body>

</html>