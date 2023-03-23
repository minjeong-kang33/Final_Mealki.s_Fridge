<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="customer_details">
               <h4> |거래처 상세 </h4>
                  <div class="cust_infoDetails">
                     <table border="1" class="cust_details_table">
                     <tr class="tr"><th class="th">거래처구분</th><td>${CustomerDTO.cust_gubun1}</td><th class="th">거래처구분</th><td>${CustomerDTO.cust_gubun2}</td></tr>
                     <tr class="tr"><th class="th">거래처명</th><td>${CustomerDTO.cust_name}</td><th class="th">사업자번호</th><td>${CustomerDTO.cust_num}</td></tr>
                     <tr class="tr"><th class="th">대표자명</th><td>${CustomerDTO.boss_name}</td><th class="th">대표전화</th><td>${CustomerDTO.cust_tel}</td></tr>
                     <tr class="tr"><th class="th">업태</th><td>${CustomerDTO.cust_uptae}</td><th class="th">종목</th><td>${CustomerDTO.cust_jongmok}</td></tr>
                     <tr class="tr"><th class="th">담당자 이름</th><td>${CustomerDTO.man_name}</td><th class="th">담당자 전화번호</th><td>${CustomerDTO.man_tel}</td></tr>
                     <tr class="tr"><th class="th">담당자 이메일</th><td>${CustomerDTO.man_email}</td><th class="th">Fax</th><td>${CustomerDTO.fax}</td></tr>
                     <tr class="tr"><th class="th">주소</th><td colspan="3">(${CustomerDTO.cust_post_num})${CustomerDTO.cust_address}, ${CustomerDTO.cust_address2}</td></tr>
                     <tr class="tr"><th class="th">홈페이지</th><td colspan="3">${CustomerDTO.url_path}</td></tr>
                     <tr class="tr"><th class="th">적요</th><td colspan="3">${CustomerDTO.remarks}</td></tr>
                     
                     </table>
                  </div>
               </div>
</body>
</html>