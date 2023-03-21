<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>

<script src="/Mealki.s_Fridge/script/jquery-1.12.4.js"></script>
<script src="/Mealki.s_Fridge/script/jquery-ui.js"></script>
  
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
</head>
<!-- 
<script>

 //초기값설정
  $(function(){
  	$("#business_num").val("수주번호"); 
  });

function fn_submit(){
	
	//trim () 앞뒤공백제거
	
	//ajax
	if( $.trim( $("#business_num").val() ) == ""){
		alert("수주번호를 입력해주세요.");
		$("#business_num").focus();
		return false;
	}
	//공백제거 후 값 입력
	$("#business_num").val($.trim($("#business_num").val()) );
	
	var formData = $("#frm").serialize();
	
	//ajax: 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
	$.ajax({ 
		type:"POST",
		data:formData,
		url:"/contract/WriteSave",
		dataType:"text", // 리턴타입
		success: function(data){ //controller -> "ok", "fail"
			if(data == "ok"){
				alert("저장완료");
// 				location="business/contract/contractList"
			}else{
				alert("저장실패");
			}
		},
		error: function(){ //시스템에러
			alert("오류발생"); 
		}
		
		
	});
}

 </script> 
 -->
<style>
body{
	font-size:3pt;
}
button{
	font-size:9pt;
}
table{
	width:500px;
	border-collapse: collapse;
}
th,td{
	border:1px solid #cccccc;
	padding:3px; 
}

</style>

<!-- ajax -->

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
                  <h3 class="font-weight-bold">메뉴명</h3>
                  <h6 class="font-weight-normal mb-0">메뉴설명쓰 <span class="text-primary">강조쓰</span></h6>
                </div>
                
          <div class="contentbody" style="background: pink;"> 
          
<!--  본문 내용 시작 -->
<form  id="frm" name="frm" method="post" action="${pageContext.request.contextPath}/contract/WriteSave" >        
<table>
<!-- 수주번호,거래처코드,품목코드,품목명,수주업체,수주일자,납품예정일,담당자코드,담당자 -->
		<tr>
			<th><label for="business_num">수주번호</label></th>
			<th>거래처코드</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>납품예정일</th>
			<th>담당자코드</th>
			<th>담당자</th>
         </tr>
         <tr>
         	<td><input type="text" name="business_num" id="business_num"></td>
         	<td><input type="text" name="cust_num" id="cust_num"></td>
         	<td><input type="text" name="item_num" id="item_num"></td>
         	<td><input type="text" name="item_name" id="item_name"></td>
         	<td><input type="text" name="business_name" id="business_name"></td>
         	<td><input type="date"  id="business_date"></td>
         	<td><input type="date"  id="out_date"></td>
         	<td><input type="text" name="incharge_code" id="incharge_code"></td>
         	<td><input type="text" name="incharge_name" id="incharge_name"></td>
         </tr>	
         <tr align="center">
			<th colspan="9">					<!-- Ajax -->
			<button type="submit">저장</button> <!-- onclick="fn_submit();return false;" -->
			<button type="reset">취소</button>
			<button type="submit">신규</button>
			<button type="submit">삭제</button>
			</th>
		</tr> 





</table>
</form>          
          
          
          
          
          
          
          
          
          
          
            
 <!--  본문내용 끝 -->    
        
          </div>
<!-- 페이징하실거면 여기서 시작 -->
     페이징
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