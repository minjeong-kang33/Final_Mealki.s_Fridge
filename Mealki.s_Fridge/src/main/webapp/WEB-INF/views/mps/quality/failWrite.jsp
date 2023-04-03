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
		<form
			action="${pageContext.request.contextPath}/quality/failWritePro"
			id="getFailWrite" method="POST">

			<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
			<input type="hidden" name="fail_num" value="${qualityDTO.fail_num}">

			<label>수주번호 : </label> 
			<input type="text" name="wo_num" value="${qualityDTO.wo_num}" readonly="readonly">
			
			<label>라인명 : </label>
			<input type="text" name="manu_name" value="${qualityDTO.manu_name}" readonly="readonly"> 
			<p>
			<label>라인코드 : </label> 
			<input type="text" name="manu_code"	value="${qualityDTO.manu_code}" readonly="readonly">
			
			<label>아이템명 : </label> 
			<input type="text" name="item_name" value="${qualityDTO.item_name}" readonly="readonly"> 
			<p>
			<label>아이템코드 : </label> 
			<input type="text" name="item_num" value="${qualityDTO.item_num}" readonly="readonly"> 
			
			<label>검수자 : </label> 
			<input type="text" name="emp_Kname" value="${qualitySession.emp_Kname}">
			<p>
			<label>불량 : </label> 
			<input type="text" name="fail_qty" value="${qualityDTO.fail_qty}"> 
			<p>
			<label>사유 : </label> 
<%-- 			<input type="text" name="manu_fail" value="${qualityDTO.manu_fail}">  --%>
			<textarea name="fail_reson" cols="30" rows="5">${qualityDTO.fail_reson}</textarea><br>
			<button type="submit" value="저장">저장</button>
			<button type='text' value="수정" formaction="${pageContext.request.contextPath}/quality/failUpdate">수정</button> 
			<button type="reset" value="취소">취소</button>
		</form>
</body>
</html>