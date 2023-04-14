<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/maincss/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/maincss/css/vert	ical-layout-light/style.css">
<!-- endinject -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/failwrite.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
    <script type="text/javascript">
        function click1(){
            var QWForm = document.getFailWrite;
            var fail_reson = getFailWrite.fail_reson.value;
            
            if( fail_reson == ""){
                alert("사유를 적어주세요");
                history.back();
            }else{
            	$("#getFailWrite").attr("action","${pageContext.request.contextPath}/quality/failWritePro").submit();
            }
        }
        
        function click2(){
            var QWForm = document.getFailWrite;
            var fail_reson = getFailWrite.fail_reson.value;
            
            if( fail_reson == ""){
                alert("사유를 적어주세요");
                history.back();
            }else{
            	$("#getFailWrite").attr("action","${pageContext.request.contextPath}/quality/failUpdate").submit();
            }
        }
        
    </script>
</head>
<body>
	<div id="writebody">
		<form id="getFailWrite" name="getFailWrite" method="POST">

			<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
			<div id="line1">
			<span>수주번호 : </span> 
			<input type="text" name="wo_num" value="${qualityDTO.wo_num}" readonly="readonly">
			
			<span>라인명 : </span>
			<input type="text" name="manu_name" value="${qualityDTO.manu_name}" readonly="readonly"> 

			<span>아이템명 : </span> 
			<input type="text" name="item_name" value="${qualityDTO.item_name}" readonly="readonly"> 
			
			<c:if test="${qualityDTO.emp_Kname eq null }">
			<span>검수자 : </span> 
			<input type="text" name="emp_Kname" value="${qualitySession.emp_Kname}" readonly="readonly">
			</c:if>
			<c:if test="${qualityDTO.emp_Kname ne null }">
			<span>검수자 : </span> 
			<input type="text" name="emp_Kname" value="${qualityDTO.emp_Kname}" readonly="readonly">
			</c:if>
			</div>
			
			<div id="line2">
			<span>라인코드 : </span> 
			<input type="text" name="manu_code"	value="${qualityDTO.manu_code}" readonly="readonly">

			<span>아이템코드 : </span> 
			<input type="text" name="item_num" value="${qualityDTO.item_num}" readonly="readonly"> 

			<span>불량 : </span> 
			<input type="text" name="fail_qty" value="${qualityDTO.fail_qty}" readonly="readonly"> 

			<span>불량번호 : </span>
			<input type="text" name="fail_num" value="${qualityDTO.fail_num}" readonly="readonly">
			</div>
			
			<p>
			<c:if test="${sessionScope.dept_num eq '300'  || sessionScope.dept_num == 600}">
			<span id="reason">사유 : </span> 
			<textarea name="fail_reson" class="reason"cols="30" rows="5">${qualityDTO.fail_reson}</textarea><br>
			</c:if>
			<c:if test="${sessionScope.dept_num ne '300'  || sessionScope.dept_num == 600}">
			<span id="reason">사유 : </span> 
			<textarea name="fail_reson" class="reason"cols="30" rows="5" readonly="readonly">${qualityDTO.fail_reson}</textarea><br>
			</c:if>
			
			<c:choose>
				<c:when test="${qualityDTO.fail_reson eq null || qualityDTO.fail_reson eq '0'}">
				<button class="btn btn-primary" type="button" id="IconButton2" onclick="click1()">
				저장</button>
				</c:when>
				<c:otherwise>
				<button class="btn btn-primary" type="button" id="IconButton3" onclick="click2()">
				수정</button>
				</c:otherwise>
			</c:choose>
			<button class="btn btn-primary" type="reset" id="IconButton4" onclick="window.close();">
			닫기</button>
		</form>
</body>
</html>