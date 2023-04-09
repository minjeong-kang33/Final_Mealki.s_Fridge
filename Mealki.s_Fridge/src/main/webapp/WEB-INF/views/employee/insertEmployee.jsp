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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css">
  <!-- endinject -->
   <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-16x16.png" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/insertEmployee.css">
  
  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>


</head>
<body>

  <div class="container-scroller">
  
<!-- 헤더, 사이드바,개인설정 시작 
	사이드바와 개인설정은 sidebar에 같이 있음-->
        <jsp:include page="../main/top.jsp" /> 
    <jsp:include page="../main/sidebar.jsp" /> 
<!-- 헤더, 사이드바,개인설정 끝 -->
 
      
<!-- 본문시작 -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
<!--  제목을 적어주세요 -->
                  <h3 class="font-weight-bold">직원등록</h3>
                </div>
                
          <div class="contentbody"> 
          
<!--  본문 내용 시작 -->
              <div class="insertImployeeBody" >
            	<form action="${pageContext.request.contextPath}/employee/insertEmployeePro" method="post" enctype="multipart/form-data"> 
            	<!-- 사진부분 -->
            	<div class="imployeeImg"> 
            		<div class="img"><img id="preview" width="200" height="230" style="border-radius: 3px")/></div>
            		<div class="imgbtn">
					<label for="file">
					  <span class="btn btn-outline-danger btn-icon-text" style="width: 200px;"><i class="ti-upload btn-icon-prepend"></i>사진 업로드하기</span>
					</label>
            		<input type="file" name="file" id="file" accept="image/*" onchange="setThumbnail(event);"></div>
            	</div>
            	
            	
            	<!-- 사원 정보부분 -->
            	<div class="employeeInfo" > 
            	
            	<fieldset>
						<div class="left">
						<ul>
							<li><label for="emp_Kname">이름</label> <input type="text" id="emp_Kname" name="emp_Kname" size="15" required onkeyup="this.value=this.value.replace(/[^가-힣ㄱ-ㅎㅏ-ㅣ\\s]/g,'')"></li>
							<li><label for="emp_birth">생년월일</label> <input type="text" id="emp_birth" name="emp_birth" size="15" required placeholder="6자리 (901123)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></li>
							<li><label for="emp_tel">내선번호</label> <input type="text" id="emp_tel" name="emp_tel" size="15" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></li>
							<li><label for="emp_classification" class="emp_classification">직원분류</label>
									<select name="emp_classification" class="emp_classification_Option">
										<option value=""> 직원분류 선택 </option>
										<option value="3"> 현장직 </option>
										<option value="2"> 사무직 </option>
									</select>
									
							</li>
							<li><label for="dept_position" class="dept_position" >직책</label> 	
									<select name="dept_position" class="dept_position_option">
										<option value=""> 직책 선택 </option>
										<option value="팀원"> 팀원 </option>
										<option value="파트장"> 파트장 </option>
										<option value="팀장"> 팀장 </option>
										<option value="본부장"> 본부장 </option>
									</select>
														
							</li>
							</ul>
						</div>
						
						<div class="right">
							<ul>
							<li><label for="emp_Ename">영문이름</label> <input type="text" id="emp_Ename" name="emp_Ename" size="15" required onKeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');"></li>
							<li><label for="emp_gender">성별</label> <input type="radio" name="emp_gender" id="남" value="남"> 남 
																	<input type="radio" name="emp_gender" id="여" value="여"> 여</li>
							<li><label for="emp_phone">휴대폰번호</label> <input type="text" id="emp_phone" name="emp_phone" size="15" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></li>
							
							<li><label for="dept_num" class="dept_num">부서</label> 
										<select name="dept_num" class="dept_num_option">
											<option value=""> 부서 선택 </option>
											<option value="100"> R&D </option>
											<option value="200"> 영업부 </option>
											<option value="300"> 생산부 </option>
											<option value="400"> 자재부 </option>
											<option value="500"> 인사부 </option>
											<option value="600"> 전산부 </option>
										</select>							
								</li>
								<li><label for="dept_duty">직위</label> 
									<select name="dept_duty" class="dept_duty_option">
										<option value=""> 직위 선택 </option>
										<option value="사원"> 사원 </option>
										<option value="주임"> 주임 </option>
										<option value="대리"> 대리 </option>
										<option value="과장"> 과장 </option>
										<option value="차장"> 차장 </option>
										<option value="부장"> 부장 </option>
									</select>							
								</li>
								</ul>
						</div>
						
						
						<div class="mid">
							<ul>
							<li><label for="emp_email" style="width: 100px;">이메일</label><input type="email" id="emp_email" name="emp_email" size="20" ></li>
							<li><label for="emp_addr"  style="width: 100px;">주소</label> <input type="text" name="emp_addr" id="emp_addr" placeholder="클릭하여 주소를 입력하세요" readonly ></li>
							<li><label for="emp_addr"  style="width: 104px;"></label><input type="text" name="emp_addr2" id="emp_addr2" placeholder="상세주소를 입력하세요"></li>
							</ul>
						</div>
				</fieldset>
				<!-- 기타 개인정보 입력 끝 -->
					
				<!-- 전송 버튼 -->
				<fieldset>
				<div class="submit_Btn">
					<input type="submit" value="직원등록" class="btn btn-primary btn-icon-text" id="insertEmployeeBtn" /> 
					<input type="reset" value="초기화" class="btn btn-dark btn-icon-text" id="insertEmployeeReset">
				</div>	
				</fieldset>
				</div>
				</form>
            
            </div>
            
 <!--  본문내용 끝 -->    
        
          </div>
            </div>
            
          </div>
          
        </div>
        
<!-- 이 밑으로 무언가 쓰지 마세요 페이징도 이 위에서 처리되야함. -->
        
        
<!-- 푸터시작 -->
     <jsp:include page="../main/footer.jsp" /> 
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


<script type="text/javascript">

function setThumbnail(event) {
  // 선택된 파일 정보 가져오기
  var input = event.target;
  var file = input.files[0];
  
  // FileReader 객체 사용하여 파일 읽기
  var reader = new FileReader();
  reader.onload = function(e) {
    // 읽은 파일을 이미지로 변환하여 미리보기
    var img = document.getElementById("preview");
    img.src = e.target.result;
  }
  reader.readAsDataURL(file);
}

</script>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("emp_addr").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("emp_addr").value = data.address; // 주소 넣기
                document.querySelector("input[name=emp_addr2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>