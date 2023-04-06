<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/empManagment.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/employee/empManageTab.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>

 
<script> //검색어
function fun1() {
	
	if(document.search.search_option.value=="") {
		alert("검색 조건을 선택하세요")
		document.search.search_option.focus();
		return false;
	}
	if(document.search.keyword.value==0) {
		alert("검색어를 입력하세요");
		document.search.keyword.focus();
		return false;
		}
	
		document.search.submit();
}
</script>




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
                  <h3 class="font-weight-bold">인사정보</h3>
                  <h6 class="font-weight-normal mb-0">메뉴설명쓰 <span class="text-primary">강조쓰</span></h6>
                </div>
                
          <div class="contentbody"> 
          
<!--  본문 내용 시작 -->
            <div id="top_table" >
               <div id="table_search">
               <div id="select_search">
                     <form name="search" method="get" action="${pageContext.request.contextPath}/employee/employeeList" id="selectBox" name="selectBox2" onsubmit="return fun1()">
                        <div style="float: left;">
                        <select name="search_option" class="search_option">
                           <option value=""> 선택하세요 </option>
                           <option value="emp_Kname"> 이름 </option>
                           <option value="emp_num"> 사번 </option>
                           <option value="emp_tel"> 내선번호 </option>
                           <option value="emp_phone"> 휴대폰번호 </option>
                           <option value="dept_num"> 부서 </option>
                        </select>
                        </div>
                        <div style="float: left;"><span id="text_search"><input class="input-search" type="text" name="keyword" style="height: 30px;"></span></div>
	                    <div style="float: left; magin-top: 3px;"><span id="icon_search"><input type="image" name="button" class="search-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25"></span></div>
	                  	<div style="float: left;"><span id="checkbox_search"><input type="checkbox" name="check" name="search_check" style="margin-top: 7px;"> 퇴사자 포함</span></div>
                     </form>
               </div>
              
             <div id="insertEmployee">
                       <div class="dropdown">
                          <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuIconButton6" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="ti-user"><a>직원등록</a></i>
                          </button>
                          <div class="dropdown-menu" aria-labelledby="dropdownMenuIconButton6">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/employee/insertEmployee">개별등록</a>
                          </div>
                        </div>
             </div>

             </div>
             <br>
            </div>
            <div class="emp_table">
               <h4> | 기본 정보 </h4>
               <div class="scrollBar">
            <table border="1" id="emp_search_table">
                <tr><th>사번</th><th>성명</th><th>직급</td>
                <th>직위</th><th>부서</th><th>입사일자</th>
                <th>내선번호</th><th>이메일</th></tr>

					<c:forEach var="dto" items="${employeeListMap }">
	    		
		    		<tr class="emp_search_table_tr"><td>${dto.emp_num}</td><td>${dto.emp_Kname}</td><td>${dto.dept_position}</td>
		    		<td>${dto.dept_duty}</td><td>${dto.dept_deptName}</td><td>${dto.emp_joinDate}</td>
		    		<td>${dto.emp_tel}</td><td>${dto.emp_email}</td></tr>
		    		
					</c:forEach>

            </table>
            </div>
            <hr>
            
            <div class="emp_details">
               <h4> | 상세 정보 </h4>
               
               <div class="emp_info">
 
	                  <div class="emp_img" id="employee_default"></div>
	                  <div class="emp_infoDetails">
	                     <table border="1" class="emp_details_table" >
			                 
			                 
	                     </table>
	                  </div>
  

                  
               </div>
 
             <div class="emp_infoDetails" style="width: 100%;">
                  <table border="1" class="emp_details_table2" >
	  
	  
                  </table>
              </div>
     
               <div class="updateBtn">
               		
               		
               </div>
               
            </div>
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
	// 테이블의 Row 클릭시 값 가져오기
	$(function () {
		$(".emp_search_table_tr").click(function(){ 	
			
			var str = ""
			
			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();
		
			// td.eq(index)를 통해 값을 가져올 수도 있다.
			var emp_num = td.eq(0).text(); 
			
			$.ajax({
				url:'${pageContext.request.contextPath}/employee/employeeDetail',
				type :'GET',
				data:{emp_num:emp_num},
				dataType : 'json',
				success:function(result){
					
				alert("사원 조회 완료");
				
				$.each(result, function(index,item) {
					
					$('#employee_default').html('<img src="${pageContext.request.contextPath}/resources/employee/upload/'+item.emp_img+'" style="width: 200px; height: 230px; border-radius:10px;">');
				//	$('#employee_default').attr('src',"${pageContext.request.contextPath}/resources/employee/upload/"+item.emp_img);
				
					
					$('.emp_details_table').html(' <tr class="tr"><th class="th">사번</th><td>'+item.emp_num+'</td><th class="th">이름</th><td>'+item.emp_Kname+'</td></tr><tr class="tr"><th class="th">영문이름</th><td>'+item.emp_Ename+'</td><th class="th">이메일주소</th><td>'+item.emp_email+'</td></tr>'
		                    +'<tr class="tr"><th class="th">생년월일</th><td>'+item.emp_birth+'</td><th class="th">성별</th><td>'+item.emp_gender+'</td></tr>'
		                     +'<tr class="tr"><th class="th">휴대폰번호</th><td>'+0+item.emp_phone+'</td><th class="th">내선번호</th><td>'+0+item.emp_tel+'</td></tr>'
		                     +'<tr class="tr"><th class="th">자택주소</th><td colspan="3">'+item.emp_addr+item.emp_addr2+'</td></tr>'
					);
					
					$('.emp_details_table2').html(' <tr class="tr"><th class="th">부서</th><td>'+item.dept_deptName+'</td><th class="th">팀</th><td>'+item.dept_teamName+'</td><th class="th">직급</th><td>'+item.dept_position+'</td><th class="th">직위</th><td>'+item.dept_duty+'</td></tr>'
		                    +'<tr class="tr"><th class="th">재직구분</th><td>'+item.emp_status+'</td><th class="th">입사일자</th><td>'+item.emp_joinDate+'</td><th class="th">퇴사일자</th><td>'+item.emp_leaveDate+' </td><th class="th">휴직일자</th><td>'+item.emp_absenceDate+'</td></tr>'
			                  
					);
					
					$('.updateBtn').html(' <button type="button" class="btn btn-outline-primary btn-fw" onClick="updateEmployee('+item.emp_num+')" >수정하기</button>'
					);

					
					$('.updateBtn button').click(function(emp_number) {
						
					    var emp_num = item.emp_num;
					    var _width = '1000';
					    var _height = '510';
		
					    var _left = Math.ceil((window.screen.width - _width) / 2);
					    var _top = Math.ceil((window.screen.height - _height) / 2);
					    let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
					    window.open('${pageContext.request.contextPath}/employee/updateEmployee?emp_num='+emp_num, "밀키의 냉장고", popOption);
					});
				});

				
				
				}
			}); 
			
		});
	});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>

</body>
</html>