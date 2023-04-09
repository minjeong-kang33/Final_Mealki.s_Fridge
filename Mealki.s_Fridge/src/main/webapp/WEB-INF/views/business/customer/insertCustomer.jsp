<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
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
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-16x16.png" /> 

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/insertCustomer.css">
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>


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
	
</head>
<body>
                
<div class="contentbody" >
<!--  본문 내용 시작 -->

			<div id="wrap">
			<h3>| 거래처 등록 </h3>
				<form action="${pageContext.request.contextPath}/business/customer/insertCustomerPro" id="insertCust" method="post" >
				<input type="hidden" name="no" value="{sessionScope.emp_num }">
					<fieldset>
					
						<div class="insert">
							<label>거래처구분<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label>	
								<input type="radio" name="cust_gubun2" value="사업자(국내)" checked>사업자(국내)
								<input type="radio" name="cust_gubun2" value="사업자(해외)" >사업자(해외)	 
								<input type="radio" name="cust_gubun2" value="개인">개인<br>
							

					  		<label>거래처구분<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label>		
								<input type="radio" name="cust_gubun1" value="납품처" checked>납품처	 
							  	<input type="radio" name="cust_gubun1" value="납입처">납입처<br>
							

							<label style="width:260px;">정보 입력(사업자번호or생년월일)<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label><br>
  								<input type="text" name="business_num" class="business_num" size="27" placeholder="ex. 123-45-67890 or 19930825">
  								<input type="button" value="중복확인" class="dup">
  								<input type="hidden" name="businessNumcheck" value="" id="businessNumcheck">
  								<div class="divresult"> </div><br>
							<label>거래처명<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<input type="text" name="cust_name" class="cust_name" placeholder="개인일 경우 이름을 입력"><br>
							<label>대표자명<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<input type="text" name="boss_name" class="boss_name"><br>
							<label>대표전화<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<input type="text" name="cust_tel" class="cust_tel" placeholder="ex. 02)111-2222"><br>
							<label>업태<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<select name="cust_uptae" class="cust_uptae" style="width:193px">
									<option value=""> 선택하세요 </option>
									<option value="도매 및 소매업">도매 및 소매업</option>
									<option value="도매 및 상품 중개업">도매 및 상품 중개업</option>
									<option value="숙박 및 음식점업">숙박 및 음식점업</option>									
									<option value="그 외(개인)">그 외(개인)</option>
									<option value="그 외(단체)">그 외(단체)</option>
								</select><br>
							<label>종목<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<select name="cust_jongmok" class="cust_jongmok">
									<option value=""> 선택하세요 </option>
									<option value="상품 종합 중개업">상품 종합 중개업</option>
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
									<option value="그 외(단체)">그 외(단체)</option>
								</select><br>
							<label>담당자 이름<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<input type="text" name="man_name" class="man_name"><br>
							<label >담당자 전화번호<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label>
								<input type="text" name="man_tel" class="man_tel" placeholder="ex. 010)111-2222"><br>
							<label>담당자 이메일<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
								<input type="email" name="man_email" class="man_email" placeholder="ex. happy@gmail.com"><br>
							<label>FAX</label> 
								<input type="text" name="fax" class="fax" placeholder="ex. 02)111-2223"><br>
							<label>주소<img src="${pageContext.request.contextPath}/resources/business/star.png" width="15" height="15"></label> 
						<div>
								<input type="text" id="sample4_postcode" name="cust_post_num" style="float:left;" class="cust_post_num" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
						</div>
								<input type="text" id="sample4_roadAddress" class="cust_address" placeholder="도로명주소" name="cust_address" style="width:530px;">				
								<span id="guide" style="color:#999;display:none"></span><br>
								<input type="text" id="sample4_detailAddress" class="cust_address2" size="60" placeholder="상세주소" name="cust_address2"><br>
						<label>홈페이지</label><br> 
								<input type="text" name="url_path" size="60" class="url_path" placeholder="ex. https://www.naver.com/"><br>
						<label>적요</label><br>
								<textarea type="text" name="remarks" class="remarks" style="height: 200px; width:525px;"  rows="3" placeholder="글 내용을 작성하세요"></textarea><br>
						
						</div>
					</fieldset>
						<div class="clear"></div>
						<div id="buttons" style="text-align:center;">
						
							<input type="submit" value="등록하기" class="btn btn-primary"> 
							<input type="reset" value="초기화하기" class="btn btn-primary">
							
						</div>
				</form>
			</div>

 <!--  본문내용 끝 -->
  </div>


  
 <script type="text/javascript">

 	$(document).ready(function(){
		$('#insertCust').submit(function(){
// 			alert("전송");
          // class="id" 표시  대상.함수()
			if($('.business_num').val()==""){
				alert("사업자번호or생년월일을 입력하세요");
				$('.business_num').focus();
				return false;
			}
          	
			if($('#businessNumcheck').val()==""){
				alert("중복 확인을 해주세요.");
				$('.business_num').focus();
				return false;		
			}
			if($('#businessNumcheck').val()=="n"){
				alert("아이디가 중복입니다. 다른 아이디로 다시시도 하세요.");
				$('.business_num').focus();
				return false;		
			}
          
            if($('.cust_name').val()==""){
            	alert("거래처명을 입력하세요");
				$('.cust_name').focus();
				return false;
            }
          
            if($('.boss_name').val()==""){
            	alert("대표자명을 입력하세요");
				$('.boss_name').focus();
				return false;
            }
            
            if($('.cust_tel').val()==""){
            	alert("대표전화를 입력하세요");
				$('.cust_tel').focus();
				return false;
            }
            
            if($('.cust_uptae').val()==""){
            	alert("업태를 선택하세요");
				$('.cust_uptae').focus();
				return false;
            }
            
            if($('.cust_jongmok').val()==""){
            	alert("종목을 선택하세요");
				$('.cust_jongmok').focus();
				return false;
            }
            
            if($('.man_name').val()==""){
            	alert("담당자 이름을 입력하세요");
				$('.man_name').focus();
				return false;
            }
            
            if($('.man_tel').val()==""){
            	alert("담당자 전화번호를 입력하세요");
				$('.man_tel').focus();
				return false;
            }
            
            if($('.man_email').val()==""){
            	alert("담당자 이메일을 입력하세요");
				$('.man_email').focus();
				return false;
            }
            
            if($('.cust_jongmok').val()==""){
            	alert("종목을 선택하세요");
				$('.cust_jongmok').focus();
				return false;
            }
            
            if($('.cust_post_num').val()==""){
            	alert("우편번호를 입력 하세요");
				$('.cust_post_num').focus();
				return false;
            }
            
            if($('.cust_address').val()==""){
            	alert("주소를 입력하세요");
				$('.cust_address').focus();
				return false;
            }
          
		});//
		
// 		class="dup" 클릭했을때
		$('.dup').click(function(){
// 			alert("클릭");
			if($('.business_num').val()==""){
				alert("사업자번호or생년월일을 입력하세요");
				$('.business_num').focus();
				return false;
			}
			
			$.ajax({
				url:'${pageContext.request.contextPath}/business/customer/businessNumcheck',
				data:{'business_num':$('.business_num').val()},
				success:function(result){
					if(result.trim()=="iddup"){
						result="이미 등록된 거래처입니다.";
						$('.divresult').html(result).css("color","red");
						$('#businessNumcheck').val('n');
					}else{
						result="등록 가능합니다.";
						$('.divresult').html(result).css("color","green");
						$('#businessNumcheck').val('y');
					}			
				}
			
			});
			
		});
	
 	});//준비
 </script>
 
 
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
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>   
</body>
</html>