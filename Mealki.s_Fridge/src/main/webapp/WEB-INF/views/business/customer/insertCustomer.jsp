<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/feather/feather.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/js/select.dataTables.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vert	ical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/customerList.css">
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
	<script>
		function updateCustNum() {
		  // business_num 요소를 가져옴
		  var businessNum = document.querySelector('.business_num');
		  // cust_num 요소를 가져옴
		  var custNum = document.querySelector('.cust_num');
		  // business_num의 값을 cust_num에 복사
		  custNum.value = businessNum.value;
		}
	</script>
   <!-- 주소값 api -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

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
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
    
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
	
</head>
<body>

  <div class="container-scroller">
  
<!-- 헤더, 사이드바,개인설정 시작 
	사이드바와 개인설정은 sidebar에 같이 있음-->
    <jsp:include page="../../main/top.jsp" /> 
    <jsp:include page="../../main/sidebar.jsp" /> 
<!-- 헤더, 사이드바,개인설정 끝 -->
 
      
<!-- 본문시작 -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
<!--  제목을 적어주세요 -->
                  <h3 class="font-weight-bold">거래처 등록</h3>
                  <h6 class="font-weight-normal mb-0">메뉴설명쓰 <span class="text-primary">강조쓰</span></h6>
                </div>
                
          <div class="contentbody" > 
<!--  본문 내용 시작 -->

			<div id="wrap">
				<form action="${pageContext.request.contextPath}/business/customer/insertCustomerPro" method="post">
				<input type="hidden" name="no" value="{sessionScope.emp_num }">
					<fieldset>
						<div class="radio-wrap">
							<label>거래처구분(필수)</label>	
								<input type="radio" name="cust_gubun2" value="사업자(개인)" checked>사업자(개인)
								<input type="radio" name="cust_gubun2" value="사업자(해외)" >사업자(해외)	 
							  	<input type="radio" name="cust_gubun2" value="개인">개인<br>	
					  	</div>
					  	<div class="radio-wrap">
					  		<label>거래처구분(필수)</label>		
								<input type="radio" name="cust_gubun1" value="납품처" checked>납품처	 
							  	<input type="radio" name="cust_gubun1" value="납입처">납입처<br>
					  	</div>
					  	<div class="form-group">
							<label>사업자번호(필수)</label> 
								<input type="text" name="business_num" class="business_num" onkeyup="updateCustNum()"><br>
							<label>거래처코드</label> 
								<input type="text" name="cust_num" class="cust_num" ><br>
							<label>거래처명(필수)</label> 
								<input type="text" name="cust_name" class="cust_name"><br>
							<label>대표자명(필수)</label> 
								<input type="text" name="boss_name" class="boss_name"><br>
							<label>대표전화</label> 
								<input type="text" name="cust_tel" class="cust_tel"><br>
							<label>업태</label> 
								<select name="cust_uptae">
									<option value=""> 선택하세요 </option>
									<option value="도매 및 소매업">도매 및 소매업</option>
									<option value="숙박 및 음식점업">숙박 및 음식점업</option>
									<option value="그 외(개인)">그 외(개인)</option>
								</select><br>
							<label>종목</label> 
								<select name="cust_jongmok">
									<option value=""> 선택하세요 </option>
									<option value="과실류 도/소매업">과실류 도/소매업</option>
									<option value="채소류, 서류 및 향신작물류 도매업">채소류, 서류 및 향신작물류 도매업</option>
									<option value="신선, 냉동 및 기타 수산물 도/소매업">신선, 냉동 및 기타 수산물 도/소매업</option>
									<option value="건어물 및 젓갈류 도/소매업">건어물 및 젓갈류 도/소매업</option>
									<option value="빵류,과자류,당류,초콜릿 도/소매업">빵류,과자류,당류,초콜릿 도/소매업</option>
									<option value="육류 가공식품 도매업">육류 가공식품 도매업</option>
									<option value="조미료 도매업">조미료 도매업</option>
									<option value="기타 식료품 소매업">기타 식료품 소매업</option>
									<option value="기타 가공식품 도매업">기타 가공식품 도매업</option>
									<option value="낙농품 및 동ㆍ식물성 유지 도매업">낙농품 및 동ㆍ식물성 유지 도매업</option>
									<option value="수산물 가공식품 도매업">수산물 가공식품 도매업</option>
									<option value="음료 소매업">음료 소매업</option>
									<option value="기타 음ㆍ식료품 위주 종합 소매업">기타 음ㆍ식료품 위주 종합 소매업</option>
									<option value="생활용 포장 및 위생용품, 봉투 및 유사 제품 도매업 ">생활용 포장 및 위생용품, 봉투 및 유사 제품 도매업</option>
									<option value="종이 원지, 판지, 종이상자 도매업">종이 원지, 판지, 종이상자 도매업</option>
									<option value="간이 음식 포장 판매 전문점">간이 음식 포장 판매 전문점</option>
									<option value="그 외(개인)">그 외(개인)</option>
								</select><br>
							<label>담당자 이름</label> 
								<input type="text" name="man_name" class="man_num"><br>
							<label>담당자 전화번호</label> 
								<input type="text" name="man_tel" class="man_tel"><br>
							<label>담당자 이메일</label> 
								<input type="email" name="man_email" class="man_email"><br>
							<label>FAX</label> 
								<input type="text" name="fax" class="fax"><br>
							<label>주소</label>
						<div>
								<input type="text" id="sample4_postcode" name="cust_post_num" style="float:left;" class="cust_post_num" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
						</div>
								<input type="text" id="sample4_roadAddress" class="cust_address" placeholder="도로명주소" name="cust_address" style="width:530px;">				
								<span id="guide" style="color:#999;display:none"></span><br>
								<input type="text" id="sample4_detailAddress" class="cust_address2" placeholder="상세주소" name="cust_address2"><br>
						<label>홈페이지</label> 
								<input type="text" name="url_path" class="business_num"><br>
						<label>적요</label>
								<textarea type="text" name="remarks" class="remarks" style="height: 300px;" rows="3" placeholder="글 내용을 작성하세요"></textarea><br>
						</div>
					</fieldset>
						<div class="clear"></div>
						<div id="buttons" style="text-align:center;">
						
							<input type="submit" value="등록하기" class="submit"> 
							<input type="reset" value="초기화하기" class="cancel">
							
						</div>
				</form>
			</div>

 <!--  본문내용 끝 -->
  
          </div>
<!-- 페이징하실거면 여기서 시작 -->

<!-- 페이징 끝 -->
            </div>
            
          </div>
          
        </div>
        
<!-- 이 밑으로 무언가 쓰지 마세요 페이징도 이 위에서 처리되야함. -->
        
        
<!-- 푸터시작 -->
     <jsp:include page="../../main/footer.jsp" /> 
<!--  푸터 끝 -->

<!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/resources/maincss/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="${pageContext.request.contextPath}/resources/maincss/vendors/chart.js/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/maincss/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/js/hoverable-collapse.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/js/template.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/js/settings.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/maincss/js/dashboard.js"></script>
  <script src="${pageContext.request.contextPath}/resources/maincss/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->

</body>
</html>