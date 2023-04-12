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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/productionupdate.css">
<!--   Jquery -->
<script type="text/javascript">
function click1(){
    var QWForm = document.insertProduct;
    var manu_fail = insertProduct.manu_fail.value;
    var manu_tocount = insertProduct.manu_tocount.value;
    var lineselect = insertProduct.lineselect.value;
    var unsto_qty = insertProduct.unsto_qty.value;
    
    let check = /^[0-9]+$/; 
    if (!check.test(manu_fail)) {
   	alert("숫자만 입력가능 합니다.");
   	console.log("숫자만 입력 가능합니다.");
    }else if(!check.test(manu_tocount)){
    	alert("숫자만 입력가능 합니다.");
    }else if( lineselect == "" || lineselect == null){
    	alert("라인을 선택해 주세요");
    	insertProduct.lineselect.focus();
    }else if( manu_tocount == "0" || manu_tocount == null){
        alert("수량이 0이거나 값이 없습니다.");
        insertProduct.manu_tocount.focus();
    }else if(manu_tocount > manu_fail){
    	alert("불량이 생산량보다 많습니다.");
    	insertProduct.manu_fail.focus();
    }else if(unsto_qty < manu_tocount){
    	alert("생산량이 수주량 보다 많습니다.");
    	insertProduct.manu_tocount.focus();
    }else if(unsto_qty > manu_fail){
    	alert("불량이 수주량 보다 많습니다.");
    	insertProduct.manu_fail.focus();
    }else {
    	$("#updateProduct").attr("action","${pageContext.request.contextPath}/mps/production/writePro").submit();
    }
}
</script>
</head>
<body>

<!--  본문 내용 시작 -->

			<div id="writebody">
				<form id="updateProduct" method="POST" >
					<div id="line1">
					<span>작업지시번호 :</span>
					<input type="text" name = "item_num" value="${updateProduct.item_num}" readonly="readonly">
					<span>라인명 :</span>
					<input type="text" name = "wo_num" value="${updateProduct.wo_num}" readonly="readonly">
					<span>품명 :</span>
					<input type="text" name = "manu_code" value="${updateProduct.manu_code}" readonly="readonly">
					<c:choose>
						<c:when test="${sessionScope.emp_num == '323040801'}">
							<span>생산량 :</span>
							<input type="text" name = "manu_tocount" value="${updateProduct.manu_tocount}">
						</c:when>
						<c:otherwise>
							<span>생산량 :</span>
							<input type="text" name = "manu_tocount" value="${updateProduct.manu_tocount}" readonly="readonly">
						</c:otherwise>
					</c:choose>
					</div>
					<div id="line2">
					<span>라인코드 :</span>
					<input type="text" name = "manu_name" value="${updateProduct.manu_name}" readonly="readonly">
					<span>아이템코드 :</span>
					<input type="text" name = "item_name" value="${updateProduct.item_name}" readonly="readonly">
					<span>작업자 : </span>
					<input type="text" name = "emp_Kname" value="${updateProduct.emp_Kname}" readonly="readonly">
					<c:choose>
						<c:when test="${sessionScope.emp_num == '323040801'}">
							<span>불량 :</span>
							<input type="text" name = "manu_fail" value="${updateProduct.manu_fail}">
					</c:when>
					<c:otherwise>
							<span>불량 :</span>
							<input type="text" name = "manu_fail" value="${updateProduct.manu_fail}" readonly="readonly">
					</c:otherwise>
					</c:choose>
					
					<input type="hidden" name = "manu_date" value="${updateProduct.manu_date}">
					</div>
				<c:if test="${sessionScope.emp_num == '323040801'}">	
            	<button class="btn btn-primary" type="submit" id="IconButton2" formaction="${pageContext.request.contextPath}/mps/production/writePro">
				수정
				</button>
				</c:if>			
<!-- 				reset -->
				<button class="btn btn-primary" type="reset" id="IconButton3" onclick="window.close()">
				<a>닫기</a>
				</button>
				
				</form>
			</div>
 <!--  본문내용 끝 -->    

</body>
</html>