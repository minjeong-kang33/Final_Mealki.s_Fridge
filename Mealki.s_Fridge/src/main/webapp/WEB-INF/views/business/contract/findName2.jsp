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
	<h3>|담당자 </h3>
		<table id="find-table">
			<tr>

				<th style="background-color: #4B49AC; color: #fff;">담당자</th>
				
				
				
				 <c:forEach var="ContractDTO" items="${NameList2}">
				 <tr class="row_a">	
				 	<td id="incharge_name">${ContractDTO.emp_Kname}</td>
				 	
				</tr> 	 
			    </c:forEach>
		</table>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>		
<script type="text/javascript">		
	$(function() {
		$(".row_a").click(function() {
			var checkList = $(this);
			var td = checkList.children();
			var emp_Kname = td.eq(0).text();
		
			opener.document.getElementById("emp_Kname").value = emp_Kname;
			
			
			window.close();
			
		}); 
	 });
	</script>

	
</body>

</html>