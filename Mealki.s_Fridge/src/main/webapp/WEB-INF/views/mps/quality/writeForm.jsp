<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
</head>
<body>
			<div id="writebody">
				<form action="${pageContext.request.contextPath}/mps/production/writePro" id="getQualityWrite" method="POST">
<!-- 				<label>라인명 : </label> -->
<!-- 				<select name="lineselect" id="lineselect" > -->
<!--             		<option value="" selected="selected">라인을 선택하세요</option> -->
<%--             			<c:forEach var="sel" items="${selectList}"> --%>
<%--             				<option value="${sel.manu_name}" data-wonum="${sel.wo_num}" data-itemname="${sel.item_name}"  --%>
<%--             						data-manucode="${sel.manu_code}" data-itemnum="${sel.item_num}">${sel.manu_name}</option> --%>
<%--             			</c:forEach> --%>
<!--           		</select> -->

<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
          		<input type="hidden" name="qc_num" value="${qualityDTO.qc_num}">
          		
          		<label>수주번호 : </label>
          		<input type="text" name="wo_num" value="${qualityDTO.wo_num}" readonly="readonly"><p>
          		
          		<label>라인명 : </label>
				<input type="text" name="manu_name" value="${qualityDTO.manu_name}" readonly="readonly">
				
          		<label>라인코드 : </label>
          		<input type="text" name="manu_code" value="${qualityDTO.manu_code}" readonly="readonly"><p>
          		
				<label>아이템명 : </label>
				<input type="text" name="item_name" value="${qualityDTO.item_name}" readonly="readonly">
				
				<label>아이템코드 : </label>
				<input type="text" name="item_num" value="${qualityDTO.item_num}" readonly="readonly">
				
				<label>검수번호 : </label>
				<input type="text" name="qc_code" value="${qualityDTO.qc_code}">

				<label>검수자 : </label>
				<input type="text" name="emp_kname" value="">
				
				<label>상태 : </label>
				<input type="text" name="qc_status" value="${qualityDTO.qc_status}">
				
				<label>검수량 : </label>
				<input type="text" name="qc_qty" value="${qualityDTO.qc_qty}">
				
				<label>불량 : </label>
				<input type="text" name="manu_fail" value="${qualityDTO.manu_fail}">
				
				<label>생산량 : </label>
				<input type="text" name="manu_tocount" value="${qualityDTO.manu_tocount}">
				
				<label>수주량 : </label>
				<input type="text" name="wo_qty" value="">
				
				<label>날짜 : </label>
				<input type="text" name="qc_date" value="${qualityDTO.qc_date}">

</body>
</html>