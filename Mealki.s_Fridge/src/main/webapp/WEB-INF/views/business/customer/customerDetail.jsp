<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
  <!-- End plugin css for this page -->
  <!-- inject:css -->
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css"> --%>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/customerList.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
  <script>
	function deleteCustomer(url) {
	  if (confirm("거래처를 삭제하시겠습니까?")) {
	    location.href = url;
	  }
	}
  </script>
  
  <script>
	function updateCustomer(url) {
	  if (confirm("거래처를 수정하시겠습니까?")) {
	    location.href = url;
	  }
	}
  </script>
 <script type="text/javascript">
/*  function getQr(business_num) {
		alert('business_num: '+business_num);
		alert(${CustomerDTO.business_num});
		let popUrl = "${pageContext.request.contextPath}/business/customer/getQr?business_num="+business_num;
		let popOption = "width = 300px, height=300px, scrollbars=no, resizable = no";
		
		let openWin = window.open(popUrl,"QR",popOption);
		
		
 }; */
 	let openWin;

 	function getQr() {
     	// window.name = "부모창 이름"; 
     	window.name = "parentForm";
     	
     	business_num = document.getElementById("business_num").innerText;
     	alert(business_num);
     	
    	 // window.open("open할 window", "자식창 이름", "팝업창 옵션");
   	  openWin = window.open("${pageContext.request.contextPath}/business/customer/getQr", "childForm", "width=300px, height=300px, resizable = no, scrollbars = no");    
   
   	function setChildText(){
   	  openWin.document.getElementById("cInput").value = business_num;
   	}
 }
 </script> 
</head>
<body>
			<div class="customer_details">
               <h4> |거래처 상세 </h4>
                  <div class="cust_infoDetails">
                     <table border="1" class="cust_details_table">
                     <tr class="tr"><th class="th">거래처구분</th><td>${customerDTO.cust_gubun1}</td><th class="th">거래처구분</th><td>${customerDTO.cust_gubun2}</td></tr>
                     <tr class="tr"><th class="th" >거래처명</th><td>${customerDTO.cust_name}</td><th class="th">사업자번호/생년월일</th><td id="business_num">${customerDTO.business_num}</td></tr>
                     <tr class="tr"><th class="th">대표자명</th><td>${customerDTO.boss_name}</td><th class="th">대표전화</th><td>${customerDTO.cust_tel}</td></tr>
                     <tr class="tr"><th class="th">업태</th><td>${customerDTO.cust_uptae}</td><th class="th">종목</th><td>${customerDTO.cust_jongmok}</td></tr>
                     <tr class="tr"><th class="th">담당자 이름</th><td>${customerDTO.man_name}</td><th class="th">담당자 전화번호</th><td>${customerDTO.man_tel}</td></tr>
                     <tr class="tr"><th class="th">담당자 이메일</th><td>${customerDTO.man_email}</td><th class="th">Fax</th><td>${customerDTO.fax}</td></tr>
                     <tr class="tr"><th class="th">주소</th><td colspan="3">(${customerDTO.cust_post_num})${customerDTO.cust_address}, ${customerDTO.cust_address2}</td></tr>
                     <tr class="tr"><th class="th">홈페이지</th><td colspan="3">${customerDTO.url_path}</td></tr>
                     <tr class="tr"><th class="th">적요</th><td colspan="3"><textarea name="remarks" rows="20" cols="120">${customerDTO.remarks}</textarea></td></tr>
                     </table>
                  </div>
               </div>
               <div id="buttons" style="text-align:center;">
						
				<input type="button" value="수정하기" class="btn btn-primary" onclick="updateCustomer('${pageContext.request.contextPath}/business/customer/updateCustomer?business_num=${customerDTO.business_num}')"> 
				<input type="button" value="삭제하기" class="btn btn-primary" onclick="deleteCustomer('${pageContext.request.contextPath}/business/customer/deleteCustomer?business_num=${customerDTO.business_num}')">
				<%-- <button type="button" onclick="getQr('${CustomerDTO.business_num}')"><img src="${pageContext.request.contextPath}/resources/business/qr_code.png" style="width: 50px;height: 50px;"></button> --%>		
			  	<img src="${pageContext.request.contextPath}/resources/business/qr_code.png" style="width: 50px;height: 50px; cursor:pointer" onclick="getQr()">
			  	<input type="button" value="전달" onclick="setChildText()">
			   </div>
</body>
</html>