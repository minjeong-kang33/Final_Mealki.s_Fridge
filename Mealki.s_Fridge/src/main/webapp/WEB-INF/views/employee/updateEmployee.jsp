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
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/updateEmployee.css">

</head>
<body>

            <div class="insertImployeeBody" >
            	
            	<form action="${pageContext.request.contextPath}/employee/updateEmployeePro" method="post" enctype="multipart/form-data"> 
            	<!-- 사진부분 -->
            	<div class="imployeeImg"> 
            	 <div class="img"> 
            		    <c:forEach var="dto" items="${employeeDetail }">
					            <img id="preview" width="200" height="230" style="border-radius: 3px" src="${pageContext.request.contextPath}/resources/employee/upload/${dto.emp_img}">
					            <input type="hidden" name="oldfile" value="${dto.emp_img }">
					            <input type="hidden" name="emp_num" value="${dto.emp_num}">
				    	</c:forEach>
				    </div>  	
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
						 <c:forEach var="dto" items="${employeeDetail }">
							<li><label for="emp_Kname">이름</label> <input type="text" id="emp_Kname" name="emp_Kname" size="15" required value="${dto.emp_Kname }"></li>
							<li><label for="emp_birth">생년월일</label> ${dto.emp_birth}</li>
							<li><label for="emp_tel">내선번호</label> <input type="text" id="emp_tel" name="emp_tel" size="15" required value="0${dto.emp_tel }"></li>
							<li><label for="emp_classification" class="emp_classification" >직원분류</label>
									<select name="emp_classification" class="emp_classification_Option">
									
									<c:if test="${dto.emp_classification eq '3' }">
										<option value="3" selected> 현장직 </option>
										<option value="2"> 사무직 </option>
									</c:if>
									
									<c:if test="${dto.emp_classification eq '2' }">
										<option value="3"> 현장직 </option>
										<option value="2" selected> 사무직 </option>
									</c:if>

									</select>
									
							</li>
							<li><label for="dept_position" class="dept_position" >직책</label> 	
									<select name="dept_position" class="dept_position_option">

									<c:if test="${dto.dept_position eq '팀원' }">
										<option value="팀원" selected> 팀원 </option>
										<option value="파트장"> 파트장 </option>
										<option value="팀장"> 팀장 </option>
										<option value="본부장"> 본부장 </option>
									</c:if>		
									
									<c:if test="${dto.dept_position eq '파트장' }">
										<option value="팀원" > 팀원 </option>
										<option value="파트장" selected> 파트장 </option>
										<option value="팀장"> 팀장 </option>
										<option value="본부장"> 본부장 </option>
									</c:if>				
									
									<c:if test="${dto.dept_position eq '팀장' }">
										<option value="팀원" > 팀원 </option>
										<option value="파트장"> 파트장 </option>
										<option value="팀장" selected> 팀장 </option>
										<option value="본부장"> 본부장 </option>
									</c:if>		
									
									<c:if test="${dto.dept_position eq '본부장' }">
										<option value="팀원" > 팀원 </option>
										<option value="파트장"> 파트장 </option>
										<option value="팀장"> 팀장 </option>
										<option value="본부장" selected> 본부장 </option>
									</c:if>							

									</select>
														
							</li>
						   </c:forEach>
						</ul>
							
						</div>
						
						<div class="right">
							<ul>
							
							<c:forEach var="dto" items="${employeeDetail }">
							<li><label for="emp_Ename">영문이름</label> <input type="text" id="emp_Ename" name="emp_Ename" size="15" required value="${dto.emp_Ename }"></li>
							<li><label for="emp_gender">성별</label> ${dto.emp_gender }</li>
							<li><label for="emp_phone">휴대폰번호</label> <input type="text" id="emp_phone" name="emp_phone" size="15" required value="0${dto.emp_phone }"></li>
							
							<li><label for="dept_num" class="dept_num">부서</label> 
								<select name="dept_num" class="dept_num_option">
										
									<c:if test="${dto.dept_num eq '100' }">
											<option value="100" selected> 경리부 </option>
											<option value="200"> 영업부 </option>
											<option value="300"> 생산부 </option>
											<option value="400"> 자재부 </option>
											<option value="500"> 인사부 </option>
											<option value="600"> 전산부 </option>
									</c:if>
									
									<c:if test="${dto.dept_num eq '200' }">
											<option value="100"> 경리부 </option>
											<option value="200" selected> 영업부 </option>
											<option value="300"> 생산부 </option>
											<option value="400"> 자재부 </option>
											<option value="500"> 인사부 </option>
											<option value="600"> 전산부 </option>
									</c:if>
									
									
									<c:if test="${dto.dept_num eq '300' }">
											<option value="100"> 경리부 </option>
											<option value="200"> 영업부 </option>
											<option value="300" selected> 생산부 </option>
											<option value="400"> 자재부 </option>
											<option value="500"> 인사부 </option>
											<option value="600"> 전산부 </option>
									</c:if>
									
									<c:if test="${dto.dept_num eq '400' }">
											<option value="100"> 경리부 </option>
											<option value="200"> 영업부 </option>
											<option value="300"> 생산부 </option>
											<option value="400" selected> 자재부 </option>
											<option value="500"> 인사부 </option>
											<option value="600"> 전산부 </option>
									</c:if>
									
									
									<c:if test="${dto.dept_num eq '500' }">
											<option value="100"> 경리부 </option>
											<option value="200"> 영업부 </option>
											<option value="300"> 생산부 </option>
											<option value="400"> 자재부 </option>
											<option value="500" selected> 인사부 </option>
											<option value="600"> 전산부 </option>
									</c:if>
									
									<c:if test="${dto.dept_num eq '600' }">
											<option value="100"> 경리부 </option>
											<option value="200"> 영업부 </option>
											<option value="300"> 생산부 </option>
											<option value="400"> 자재부 </option>
											<option value="500"> 인사부 </option>
											<option value="600" selected> 전산부 </option>
									</c:if>

								</select>							
								</li>
								<li><label for="dept_duty">직위</label> 
									<select name="dept_duty" class="dept_duty_option">
									<c:if test="${dto.dept_duty eq '사원' }">
										<option value="사원" selected> 사원 </option>
										<option value="주임"> 주임 </option>
										<option value="대리"> 대리 </option>
										<option value="과장"> 과장 </option>
										<option value="차장"> 차장 </option>
										<option value="부장"> 부장 </option>
									</c:if>
									
									<c:if test="${dto.dept_duty eq '주임' }">
										<option value="사원"> 사원 </option>
										<option value="주임" selected> 주임 </option>
										<option value="대리"> 대리 </option>
										<option value="과장"> 과장 </option>
										<option value="차장"> 차장 </option>
										<option value="부장"> 부장 </option>
									</c:if>
									
																		
									<c:if test="${dto.dept_duty eq '대리' }">
										<option value="사원"> 사원 </option>
										<option value="주임" > 주임 </option>
										<option value="대리" selected> 대리 </option>
										<option value="과장"> 과장 </option>
										<option value="차장"> 차장 </option>
										<option value="부장"> 부장 </option>
									</c:if>
									
									<c:if test="${dto.dept_duty eq '과장' }">
										<option value="사원" > 사원 </option>
										<option value="주임"> 주임 </option>
										<option value="대리"> 대리 </option>
										<option value="과장" selected> 과장 </option>
										<option value="차장" > 차장 </option>
										<option value="부장"> 부장 </option>
									</c:if>
									
									<c:if test="${dto.dept_duty eq '차장' }">
										<option value="사원"> 사원 </option>
										<option value="주임"> 주임 </option>
										<option value="대리"> 대리 </option>
										<option value="과장"> 과장 </option>
										<option value="차장" selected> 차장 </option>
										<option value="부장"> 부장 </option>
									</c:if>
									
																		
									<c:if test="${dto.dept_duty eq '부장' }">
										<option value="사원"> 사원 </option>
										<option value="주임" > 주임 </option>
										<option value="대리"> 대리 </option>
										<option value="과장"> 과장 </option>
										<option value="차장"> 차장 </option>
										<option value="부장" selected> 부장 </option>
									</c:if>
									
									
									
									</select>							
								</li>
								</c:forEach>
								</ul>
						</div>
						
						
						<div class="mid">
						
							<ul>
							<c:forEach var="dto" items="${employeeDetail }">
							<li><label for="emp_email" style="width: 75px;">이메일</label><input type="email" id="emp_email" name="emp_email" size="20" value="${dto.emp_email }"></li>
							<li><label for="emp_addr"  style="width: 75px;">주소</label> <input type="text" name="emp_addr" id="emp_addr"  value="${dto.emp_addr }"></li>
							<li><label for="emp_addr"  style="width: 80px;"></label><input type="text" name="emp_addr2" id="emp_addr2" placeholder="상세주소를 입력하세요" value="${dto.emp_addr2 }"></li>
							</c:forEach>
							</ul>
						
						</div>
				</fieldset>
				<!-- 기타 개인정보 입력 끝 -->
					
				<!-- 전송 버튼 -->
				<fieldset>
				<div class="submit_Btn">
				<c:forEach var="dto" items="${employeeDetail }">
				

				
				<c:if test="${dto.emp_leaveDate eq ''}">	
					<c:if test="${dto.emp_absenceDate eq ''}">	  <!-- 퇴직하지않았고 휴직도하지않은경우에만 휴직버튼  -->
						<button value="${dto.emp_num }" class="btn btn-inverse-secondary btn-fw" id="absenceEmployeeBtn"  onClick="absenceEmployee(${dto.emp_num })">휴직</button>
					</c:if>
					
					<c:if test="${not empty dto.emp_absenceDate}">
						<button value="${dto.emp_num }" class="btn btn-inverse-secondary btn-fw" id="rehabilitationEmployeeBtn"  onClick="rehabilitationEmployee(${dto.emp_num })">복직</button>
					</c:if>
					
					<button value="${dto.emp_num }" class="btn btn-inverse-danger btn-fw" id="leaveEmployeeBtn" onClick="leaveEmployee(${dto.emp_num })">퇴직</button>
				</c:if>
				
					<input type="submit" value="수정" class="btn btn-primary btn-icon-text" id="insertEmployeeBtn" /> 
					<input type="reset" value="초기화" class="btn btn-dark btn-icon-text" id="insertEmployeeReset"> 
				</c:forEach>
				</div>	
				</fieldset>
				</div>
				</form>
            
            </div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">

/* 이미지 미리보기 */
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

/* 휴직 버튼*/
$('#absenceEmployeeBtn').click(function(event) {
    event.preventDefault();
    var emp_num = $(this).val();  // 버튼의 value 값 가져오기

    if(!confirm('휴직 처리를 하시겠습니까?')){
        return false;
    }

    $.ajax({
        url:'${pageContext.request.contextPath}/employee/absenceEmployee',
        type :'GET',
        data:{emp_num:emp_num},
        dataType : 'json',
        success:function(result){alert('휴직 처리 완료'); window.close();}
    });
});


/* 복직 버튼*/
$('#rehabilitationEmployeeBtn').click(function(event) {
    event.preventDefault();
    var emp_num = $(this).val();  // 버튼의 value 값 가져오기

    if(!confirm('복직 처리를 하시겠습니까?')){
        return false;
    }

    $.ajax({
        url:'${pageContext.request.contextPath}/employee/rehabilitationEmployee',
        type :'GET',
        data:{emp_num:emp_num},
        dataType : 'json',
        success:function(result){alert('복직 처리 완료'); window.close();}
    });
});


/* 퇴직 버튼*/
$('#leaveEmployeeBtn').click(function(event) {
    event.preventDefault();
    var emp_num = $(this).val();  // 버튼의 value 값 가져오기

    if(!confirm('퇴직 처리를 하시겠습니까?')){
        return false;
    }

    $.ajax({
        url:'${pageContext.request.contextPath}/employee/leaveEmployee',
        type :'GET',
        data:{emp_num:emp_num},
        dataType : 'json',
        success:function(result){alert('퇴직 처리 완료'); window.close();}
    });
});



</script>

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

</body>
</html>