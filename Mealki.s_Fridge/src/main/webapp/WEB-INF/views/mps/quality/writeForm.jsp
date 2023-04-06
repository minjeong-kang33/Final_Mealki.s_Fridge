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
			action="${pageContext.request.contextPath}/quality/writePro"
			id="getQualityWrite" method="POST">

			<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
			<input type="hidden" name="qc_num" value="${qualityDTO.qc_num}">
			
			<input type="text" name="qc_code" value="${qualityDTO.qc_code}">
			
			<label>작업지시번호 : </label> 
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
			
			<label>검수번호 : </label> 
			<input type="hidden" name="qc_code" value="${qualityCode.qc_code}">
			<p>
			<label>검수자 : </label> 
			<input type="text" name="emp_Kname" value="${qualitySession.emp_Kname}">

			<label>상태 : </label> 
			<select name="qc_status">
				<option value="">선택하세요</option>
				<option value="완료">완료</option>
				<option value="검사중">검사중</option>
			</select>
			<p>
			<label>생산량 : </label> 
			<input type="text" name="manu_tocount" value="${qualityDTO.manu_tocount}">

			<label>수주량 : </label> 
			<input type="text" name="wo_qty" value="${qualityDTO.wo_qty}">
			<p>
			<label>검수량 : </label> 
			<input type="text" name="qc_qty" value="${qualityDTO.qc_qty}"> 
			
			<label>불량 : </label> 
			<input type="text" name="manu_fail" value="${qualityDTO.manu_fail}"> 
			<p>
			<button type="submit" value="저장">저장</button>
			<button type='text' value="수정" formaction="${pageContext.request.contextPath}/quality/qcUpdate">수정</button> 
			<button type="reset" value="취소">취소</button> 
		</form>
</body>
</html>