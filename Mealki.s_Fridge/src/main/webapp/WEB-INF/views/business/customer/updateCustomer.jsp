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

</head>
<body>
			<div class="customer_update">
               <h4> |거래처 수정 </h4>
                  <div class="cust_infoDetails">
                  <form action="${pageContext.request.contextPath}/business/customer/updateCustomerPro" method="post">
                     <table border="1" class="cust_update_table">
                     <tr class="tr"><th class="th">거래처구분</th><td><input type="text" name="cust_gubun1" value="${customerDTO.cust_gubun1}"></td>
                     				<th class="th">거래처구분</th><td><input type="text" name="cust_gubun2" value="${customerDTO.cust_gubun2}"></td></tr>
                     <tr class="tr"><th class="th">거래처명</th><td><input type="text" name="cust_name" value="${customerDTO.cust_name}"></td>
                     				<th class="th">사업자번호/생년월일</th><td><input type="text" name="business_num" value="${customerDTO.business_num}"></td></tr>
                     <tr class="tr"><th class="th">대표자명</th><td><input type="text" name="boss_name" value="${customerDTO.boss_name}"></td>
                     				<th class="th">대표전화</th><td><input type="text" name="cust_tel" value="${customerDTO.cust_tel}"></td></tr>
                     <tr class="tr"><th class="th">업태</th><td><input type="text" name="cust_uptae" value="${customerDTO.cust_uptae}"></td>
                     				<th class="th">종목</th><td><input type="text" name="cust_jongmok" value="${customerDTO.cust_jongmok}"></td></tr>
                     <tr class="tr"><th class="th">담당자 이름</th><td><input type="text" name="man_name" value="${customerDTO.man_name}"></td>
                     				<th class="th">담당자 전화번호</th><td><input type="text" name="man_tel" value="${customerDTO.man_tel}"></td></tr>
                     <tr class="tr"><th class="th">담당자 이메일</th><td><input type="text" name="man_email" value="${customerDTO.man_email}"></td>
                     				<th class="th">Fax</th><td><input type="text" name="fax" value="${customerDTO.fax}"></td></tr>
                     <tr class="tr"><th class="th">주소</th><td colspan="3">(<input type="text" name="cust_post_num" value="${customerDTO.cust_post_num}">)
                     														<input type="text" name="cust_address" value="${customerDTO.cust_address}">, 
                     														<input type="text" name="cust_address2" value="${customerDTO.cust_address2}"></td></tr>
                     <tr class="tr"><th class="th">홈페이지</th><td colspan="3"><input type="text" name="url_path" value="${customerDTO.url_path}"></td></tr>
                     <tr class="tr"><th class="th">적요</th><td colspan="3"><textarea name="remarks" rows="20" cols="120">${customerDTO.remarks}</textarea></td></tr>
                     </table>
                     
                     <div id="buttons" style="text-align:center;">		
						<input type="submit" value="수정하기" class="btn btn-primary" > 		
					 </div>
					 
                    </form>
                  </div>
               </div>
               
</body>
</html>