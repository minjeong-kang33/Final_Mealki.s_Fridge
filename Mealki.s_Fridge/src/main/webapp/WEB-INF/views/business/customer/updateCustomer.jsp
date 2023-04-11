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
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-16x16.png" />
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/customerDetail.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>

</head>
<body>
			<div class="customer_update">
               <h4> |거래처 수정 </h4>
                  <div class="cust_infoDetails">
                  <form action="${pageContext.request.contextPath}/business/customer/updateCustomerPro" method="post">
                     <table border="1" class="cust_update_table">
                     <tr class="tr"><th class="th">거래처구분</th><td><input type="text" name="cust_gubun1" value="${customerDTO.cust_gubun1}" readonly></td>
                     				<th class="th">거래처구분</th><td><input type="text" name="cust_gubun2" value="${customerDTO.cust_gubun2}" readonly></td></tr>
                     <tr class="tr"><th class="th">거래처명</th><td><input type="text" name="cust_name" value="${customerDTO.cust_name}" readonly></td>
                     				<th class="th">사업자번호/생년월일</th><td><input type="text" name="business_num" value="${customerDTO.business_num}" readonly></td></tr>
                     <tr class="tr"><th class="th">대표자명</th><td><input type="text" name="boss_name" value="${customerDTO.boss_name}"></td>
                     				<th class="th">대표전화</th><td><input type="text" name="cust_tel" value="${customerDTO.cust_tel}"></td></tr>
                     <tr class="tr"><th class="th" >업태</th>
                     				<td><select name="cust_uptae" class="cust_uptae" >
											<option value=""> 선택하세요 </option>
											<option value="도매 및 소매업" <c:if test="${customerDTO.cust_uptae eq '도매 및 소매업' }"> selected</c:if>>도매 및 소매업</option>
											<option value="도매 및 상품 중개업" <c:if test="${customerDTO.cust_uptae eq '도매 및 상품 중개업' }"> selected</c:if>>도매 및 상품 중개업</option>
											<option value="숙박 및 음식점업" <c:if test="${customerDTO.cust_uptae eq '숙박 및 음식점업' }"> selected</c:if>>숙박 및 음식점업</option>									
											<option value="그 외(개인)" <c:if test="${customerDTO.cust_uptae eq '그 외(개인)' }"> selected</c:if>>그 외(개인)</option>
											<option value="그 외(단체)" <c:if test="${customerDTO.cust_uptae eq '그 외(단체)' }"> selected</c:if>>그 외(단체)</option>
										</select></td>
                     				<th class="th">종목</th>
                     				<td><select name="cust_jongmok" class="cust_jongmok">
											<option value=""> 선택하세요 </option>
											<option value="상품 종합 중개업"<c:if test="${customerDTO.cust_jongmok eq '상품 종합 중개업' }"> selected</c:if>>상품 종합 중개업</option>
											<option value="과실류 도/소매업" <c:if test="${customerDTO.cust_jongmok eq '과실류 도/소매업' }"> selected</c:if>>과실류 도/소매업</option>
											<option value="채소류, 서류 및 향신작물류 도매업" <c:if test="${customerDTO.cust_jongmok eq '채소류, 서류 및 향신작물류 도매업' }"> selected</c:if>>채소류, 서류 및 향신작물류 도매업</option>
											<option value="신선, 냉동 및 기타 수산물 도/소매업" <c:if test="${customerDTO.cust_jongmok eq '신선, 냉동 및 기타 수산물 도/소매업' }"> selected</c:if>>신선, 냉동 및 기타 수산물 도/소매업</option>
											<option value="건어물 및 젓갈류 도/소매업" <c:if test="${customerDTO.cust_jongmok eq '건어물 및 젓갈류 도/소매업' }"> selected</c:if>>건어물 및 젓갈류 도/소매업</option>
											<option value="빵류,과자류,당류,초콜릿 도/소매업" <c:if test="${customerDTO.cust_jongmok eq '빵류,과자류,당류,초콜릿 도/소매업' }"> selected</c:if>>빵류,과자류,당류,초콜릿 도/소매업</option>
											<option value="육류 가공식품 도매업" <c:if test="${customerDTO.cust_jongmok eq '육류 가공식품 도매업' }"> selected</c:if>>육류 가공식품 도매업</option>
											<option value="조미료 도매업" <c:if test="${customerDTO.cust_jongmok eq '조미료 도매업' }"> selected</c:if>>조미료 도매업</option>
											<option value="기타 식료품 소매업" <c:if test="${customerDTO.cust_jongmok eq '기타 식료품 소매업' }"> selected</c:if>>기타 식료품 소매업</option>
											<option value="기타 가공식품 도매업" <c:if test="${customerDTO.cust_jongmok eq '도매 및 소매업' }"> selected</c:if>>기타 가공식품 도매업</option>
											<option value="낙농품 및 동ㆍ식물성 유지 도매업" <c:if test="${customerDTO.cust_jongmok eq '기타 가공식품 도매업' }"> selected</c:if>>낙농품 및 동ㆍ식물성 유지 도매업</option>
											<option value="수산물 가공식품 도매업" <c:if test="${customerDTO.cust_jongmok eq '수산물 가공식품 도매업' }"> selected</c:if>>수산물 가공식품 도매업</option>
											<option value="음료 소매업" <c:if test="${customerDTO.cust_jongmok eq '음료 소매업' }"> selected</c:if>>음료 소매업</option>
											<option value="기타 음ㆍ식료품 위주 종합 소매업" <c:if test="${customerDTO.cust_jongmok eq '기타 음ㆍ식료품 위주 종합 소매업' }"> selected</c:if>>기타 음ㆍ식료품 위주 종합 소매업</option>
											<option value="생활용 포장 및 위생용품, 봉투 및 유사 제품 도매업 " <c:if test="${customerDTO.cust_jongmok eq '생활용 포장 및 위생용품, 봉투 및 유사 제품 도매업' }"> selected</c:if>>생활용 포장 및 위생용품, 봉투 및 유사 제품 도매업</option>
											<option value="종이 원지, 판지, 종이상자 도매업" <c:if test="${customerDTO.cust_jongmok eq '종이 원지, 판지, 종이상자 도매업' }"> selected</c:if>>종이 원지, 판지, 종이상자 도매업</option>
											<option value="간이 음식 포장 판매 전문점" <c:if test="${customerDTO.cust_jongmok eq '간이 음식 포장 판매 전문점' }"> selected</c:if>>간이 음식 포장 판매 전문점</option>
											<option value="그 외(개인)" <c:if test="${customerDTO.cust_jongmok eq '그 외(개인)' }"> selected</c:if>>그 외(개인)</option>
											<option value="그 외(단체)" <c:if test="${customerDTO.cust_jongmok eq '그 외(단체)' }"> selected</c:if>>그 외(단체)</option>
										</select></td></tr>
                     <tr class="tr"><th class="th">담당자 이름</th><td><input type="text" name="man_name" value="${customerDTO.man_name}"></td>
                     				<th class="th">담당자 전화번호</th><td><input type="text" name="man_tel" value="${customerDTO.man_tel}"></td></tr>
                     <tr class="tr"><th class="th">담당자 이메일</th><td><input type="text" name="man_email" value="${customerDTO.man_email}"></td>
                     				<th class="th">Fax</th><td><input type="text" name="fax" value="${customerDTO.fax}"></td></tr>
                     <tr class="tr"><th class="th">주소</th><td colspan="3">(<input type="text" name="cust_post_num" id="sample4_postcode" style="width:150px;" value="${customerDTO.cust_post_num}" onclick="sample4_execDaumPostcode()">)
                     														<input type="text" name="cust_address" id="sample4_roadAddress" style="width:400px;"value="${customerDTO.cust_address}" onclick="sample4_execDaumPostcode()">, 
                     														<input type="text" name="cust_address2" id="sample4_detailAddress" style="width:300px;"value="${customerDTO.cust_address2}"></td></tr>
                     <tr class="tr"><th class="th">홈페이지</th><td colspan="3"><input type="text" name="url_path" value="${customerDTO.url_path}"></td></tr>
                     <tr class="tr"><th class="th">적요</th><td colspan="3"><textarea name="remarks" rows="10" cols="145">${customerDTO.remarks}</textarea></td></tr>
                     </table>
                     
                     <div id="buttons" style="text-align:center;">		
						<input type="submit" value="수정하기" class="btn btn-primary" > 		
					 </div>
					 
                    </form>
                  </div>
               </div>


 <!-- 주소값 api -->
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					var fullRoadAddr = data.roadAddress; 
					var extraRoadAddr = ''; 

					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						extraRoadAddr += data.bname;
					}

					if(data.buildingName !== '' && data.apartment === 'Y'){
					   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}

					if(extraRoadAddr !== ''){
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById('sample4_roadAddress').value = fullRoadAddr;
					document.getElementById('guide').innerHTML = '';
					document.getElementById('sample4_detailAddress').focus();
				}
			}).open();
		}
	</script>               
</body>
</html>