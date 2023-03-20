<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/wms/findWarehouse.css">
</head>
<body>

<h4> | 필수 입력 사항 </h4>
<table>
<tr><th>창고 번호</th><th>창고 이름</th>

<c:forEach var="WarehouseDTO" items="${warehouseList }">
<tr><td>${WarehouseDTO.whs_num }</td><td>${WarehouseDTO.whs_name }</td>
</c:forEach>

</table>
<input type="button" value="창닫기" onclick="window.close()">

</body>
</html>