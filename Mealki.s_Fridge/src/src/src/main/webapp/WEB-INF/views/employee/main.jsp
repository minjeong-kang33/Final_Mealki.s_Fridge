<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee/main.jsp</title>
</head>
<body>
<h1>employee/main.jsp</h1>

<c:if test="${empty sessionScope.emp_num }">
	<c:redirect url="/employee/login"></c:redirect>
</c:if>

</body>
</html>





