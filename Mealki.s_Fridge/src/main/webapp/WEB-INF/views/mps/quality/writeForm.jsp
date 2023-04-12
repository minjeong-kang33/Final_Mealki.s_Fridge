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
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/qcwrite.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
    <script type="text/javascript">
        function click1(){
            var QWForm = document.getQualityWrite;
            var qc_qty = parseInt(getQualityWrite.qc_qty.value);
            var wo_qty = getQualityWrite.wo_qty.value;
            var manu_tocount = parseInt(getQualityWrite.manu_tocount.value);
            var manu_fail = parseInt(getQualityWrite.manu_fail.value);
            
            let check = /^[0-9]+$/; 
            if (!check.test(qc_qty)) {
           	alert("숫자만 입력가능 합니다.");
           	console.log("숫자만 입력 가능합니다.");
            }else if(!check.test(manu_fail)){
            	alert("숫자만 입력가능 합니다.");
            }else if( qc_qty == "" || qc_qty == "0"){
                alert("수량을 확인 하세요");
                history.back();
            }else if(qc_qty > wo_qty){
            	alert("수주량보다 검수량이 많습니다.")
            	history.back();
            	console.log(wo_qty);
            	console.log(qc_qty);
            	console.log(manu_tocount);
            	console.log(manu_fail);
            }else if(qc_qty > manu_tocount){
            	alert("생산량보다 검수량이 많습니다.")
            	history.back();
            	console.log(wo_qty);
            	console.log(qc_qty);
            	console.log(manu_tocount);
            	console.log(manu_fail);
            }else if(manu_fail > manu_tocount){
            	alert("생산량보다 불량이 많습니다.")
            	history.back();
            	console.log(wo_qty);
            	console.log(qc_qty);
            	console.log(manu_tocount);
            	console.log(manu_fail);
            }else if(manu_fail > qc_qty){
            	alert("검수량보다 불량이 많습니다.")
            	history.back();
            	console.log(wo_qty);
            	console.log(qc_qty);
            	console.log(manu_tocount);
            	console.log(manu_fail);
            }else {
            	$("#getQualityWrite").attr("action","${pageContext.request.contextPath}/quality/writePro").submit();
            }
        }
        
        function click2(){
        	 var QWForm = document.getQualityWrite;
             var qc_qty = getQualityWrite.qc_qty.value;
             var wo_qty = getQualityWrite.wo_qty.value;
             var manu_tocount = getQualityWrite.manu_tocount.value;
             var manu_fail = getQualityWrite.manu_fail.value;
             
             let check = /^[0-9]+$/; 
             if (!check.test(qc_qty)) {
            	alert("숫자만 입력가능 합니다.");
            	console.log("숫자만 입력 가능합니다.");
             }else if(!check.test(manu_fail)){
             	alert("숫자만 입력가능 합니다.");
             }else if( qc_qty == "" || qc_qty == "0"){
                 alert("수량을 확인 하세요");
                 history.back();
             }else if(qc_qty > wo_qty){
             	alert("수주량보다 검수량이 많습니다.")
             	history.back();
             	console.log(wo_qty);
             	console.log(qc_qty);
             	console.log(manu_tocount);
             	console.log(manu_fail);
             }else if(manu_tocount < qc_qty){
             	alert("생산량보다 검수량이 많습니다.")
             	history.back();
             	console.log(wo_qty);
             	console.log(qc_qty);
             	console.log(manu_tocount);
             	console.log(manu_fail);
             }else if(manu_fail > manu_tocount){
             	alert("생산량보다 불량이 많습니다.")
             	history.back();
             	console.log(wo_qty);
             	console.log(qc_qty);
             	console.log(manu_tocount);
             	console.log(manu_fail);
             }else if(wo_qty < manu_fail){
             	alert("검수량보다 불량이 많습니다.")
             	history.back();
             	console.log(wo_qty);
             	console.log(qc_qty);
             	console.log(manu_tocount);
             	console.log(manu_fail);
             }else {
            	$("#getQualityWrite").attr("action","${pageContext.request.contextPath}/quality/qcUpdate").submit();
            }
        }
        

    </script>
</head>
<body>
	<div id="writebody">
		<form id="getQualityWrite" name="getQualityWrite" method="POST">
			<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
			<div id="line1">
			<input type="hidden" name="qc_num" value="${qualityDTO.qc_num}">
				
			<span>작업지시번호 : </span> 
			<input type="text" name="wo_num" value="${qualityDTO.wo_num}" readonly="readonly">
			
			<span>라인명 : </span>
			<input type="text" name="manu_name" value="${qualityDTO.manu_name}" readonly="readonly">
			
			<span>아이템명 : </span> 
			<input type="text" name="item_name" value="${qualityDTO.item_name}" readonly="readonly"> 
			
			<span>생산량 : </span> 
			<input type="text" name="manu_tocount" class="manu_tocount" value="${qualityDTO.manu_tocount}" readonly="readonly">
			<c:if test="${sessionScope.dept_num eq '300' }">
				<span>검수량 : </span>
				<input type="text" name="qc_qty" class="qc_qty" value="${qualityDTO.qc_qty}" > 
			</c:if>
				<c:if test="${sessionScope.dept_num ne '300' }">
				<span>검수량 : </span>
				<input type="text" name="qc_qty" class="qc_qty" value="${qualityDTO.qc_qty}" readonly="readonly"> 
			</c:if> 
			
			</div>
			<div id="line2">
			<c:if test="${qualityDTO.emp_Kname eq null }">
			<span>검수자 : </span> 
			<input type="text" name="emp_Kname" value="${qualitySession.emp_Kname}" readonly="readonly">
			</c:if>
			<c:if test="${qualityDTO.emp_Kname ne null }">
			<span>검수자 : </span> 
			<input type="text" name="emp_Kname" value="${qualityDTO.emp_Kname}" readonly="readonly">
			</c:if>
			
			<span>라인코드 : </span> 
			<input type="text" name="manu_code"	value="${qualityDTO.manu_code}" readonly="readonly">
			
			<span>아이템코드 : </span> 
			<input type="text" name="item_num" value="${qualityDTO.item_num}" readonly="readonly"> 

			<span>수주량 : </span> 
			<input type="text" name="wo_qty" class="wo_qty" value="${qualityDTO.wo_qty}" readonly="readonly">
			
			
			<c:if test="${sessionScope.dept_num eq '300' }">
				<span>불량 : </span> 
				<input type="text" name="manu_fail" class="manu_fail" value="0"> 
			</c:if>
			<c:if test="${sessionScope.dept_num ne '300' }">
				<span>불량 : </span> 
				<input type="text" name="manu_fail" class="manu_fail" value="${qualityDTO.manu_fail}" readonly="readonly">  
			</c:if> 
			</div>
			<c:if test="${sessionScope.dept_num eq '300' }">
				<c:choose>
					<c:when test="${qualityDTO.qc_qty eq null || qualityDTO.qc_qty eq '0'}">
					<button class="btn btn-primary" type="button" id="IconButton2" onclick="click1()">
					저장</button>
					</c:when>
					
					<c:otherwise>
					<button class="btn btn-primary" type="button" id="IconButton3" onclick="click2();">
					수정</button>
					</c:otherwise>
				</c:choose>
			</c:if>
			<button class="btn btn-primary" type="reset" id="IconButton4" onclick="window.close();">
			닫기</button>
		</form>	
	</div>
</body>
</html>