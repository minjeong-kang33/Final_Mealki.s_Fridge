<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/yellowPage.css">
</head>
<body>

<div id="top_table" >
	<div id="table_search">
		<div id="select_search">
			<form name="search" method="get" action="${pageContext.request.contextPath}/employee/employeeList" id="selectBox" name="selectBox2" onsubmit="return fun1()">
				<select name="search_option" class="search_option">
					<option value=""> 선택하세요 </option>
			        <option value="emp_Kname"> 이름 </option>
			        <option value="emp_num"> 사번 </option>
			        <option value="emp_tel"> 내선번호 </option>
			        <option value="emp_phone"> 휴대폰번호 </option>
			        <option value="dept_num"> 부서 </option>
	   			</select>
			</form>
			 <span id="text_search"><input class="input-search" type="text" name="keyword"></span>
	         <span id="icon_search"><input type="image" name="button" class="search-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25"></span>
		</div>
	</div>
</div>


어쩌구 저쩌구 
</body>
</html>