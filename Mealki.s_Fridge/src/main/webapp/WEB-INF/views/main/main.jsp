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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mdm/mainBoardList.css">
  <%-- <script src="${pageContext.request.contextPath}/resources/main/todoList.js"></script> --%>
</head>
<body>
<!-- 민정: 아이디값 없으면 로그인 화면으로. 시작 -->
<c:if test="${empty sessionScope.emp_num }">
	<c:redirect url="/main/login"></c:redirect>
</c:if>
<!-- 민정: 아이디값 없으면 로그인 화면으로. 끝-->

  <div class="container-scroller">
  
<!-- 헤더, 사이드바,개인설정 시작 
	사이드바와 개인설정은 sidebar에 같이 있음-->
    <jsp:include page="top.jsp" /> 
    <jsp:include page="sidebar.jsp" /> 
<!-- 헤더, 사이드바,개인설정 끝 -->
 
      
<!-- 본문시작 -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
<!-- 날씨 시작 -->          
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card tale-bg">
                <div class="card-people mt-auto">
                  <img src="${pageContext.request.contextPath}/resources/maincss/images/dashboard/people.svg" alt="people">
                  <div class="weather-info">
                    <div class="d-flex">
                      <div>
                        <h2 class="mb-0 font-weight-normal"><span class="weather-icon mr-3" id="todaysWeather"></span><span id="todaysTemp" style="margin-right: 5px;"></span></h2>
                      </div>
                      <div class="ml-2">
                        <h4 style="margin-bottom: 5px !important; font-weight: 550 !important;">부산시</h4>
                        <h6>부산진구</h6>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
<!-- 날씨 끝 --> 
<!-- 할 일 목록 시작 -->          
             <div class="col-md-5 grid-margin stretch-card" style="height: 441px !important;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title" style="margin-top: 10px;">To Do Lists</h4>
						 <div class="list-wrapper pt-2"> 
						<form class="toDoForm">
      						<div class="add-items d-flex mb-0 mt-2">
								<input type="text" placeholder="할 일을 입력하세요" class="form-control todo-list-input" style="background-color: #ebf1ff; width: 580px; padding-left: 10px;">
							</div>
  					  	</form>
    					<ul class="toDoList" style="margin-top: 10px; width: 580px;"></ul>
    					 </div> 
						</div>
					</div>
           		</div> 
<!-- 할일목록 끝 -->             
          </div> 
          <div class="row">
<!-- 달력 시작 -->          
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
               <div id="calendar" style="width: 780px; background-color: white; padding:20px; border-radius: 25px; margin-left: 15px; height: 630px !important;"></div>
           	 </div>
            </div>
<!-- 달력 끝 -->  
<!-- 수주왕 시작-->            
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                 <div class="d-flex justify-content-between">
                  <p class="card-title" style="margin-top: 10px;">이 달의 수주왕</p>
                 </div>
                  <p class="font-weight-500">
                  이 달의 수주왕으로 뽑힌 사원에게는 보너스를 드립니다 !
                  </p>
                  <div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
                  <canvas id="myChart" height="400px" width="600px"></canvas>
                </div>
              </div>
            </div>
<!-- 수주왕 끝-->         		
          </div>
          <div class="row">
<!-- 공지사항 시작 -->          
 <div class="col-md-7 grid-margin stretch-card" style="text-align: left;">
    <div class="card">
        <div class="card-body">
            <p class="card-title">　공지사항</p>
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <!-- Add the table_content div here -->
                        <div id="table_content"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

          <div class="row">    
          </div>
           
        </div>
        <!-- content-wrapper ends -->
        
        
        
 <!-- 푸터시작 -->
     <jsp:include page="footer.jsp" /> 

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
	
  <!-- 수주왕 그래프 -->
  <script src="${pageContext.request.contextPath}/resources/main/contractchart.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

  <!-- jQuery -->  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

  <!-- 날씨 -->
  <script src="${pageContext.request.contextPath}/resources/main/weather.js"></script>

  <!-- 달력 -->
  <script src="${pageContext.request.contextPath}/resources/main/calendar.js"></script>
  <script src="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.js"></script>
  
  <!-- to do List -->
   <script src="${pageContext.request.contextPath}/resources/main/todoList.js"></script>
   <script>
 	 let empNum = ${sessionScope.emp_num };
   </script>
   
  <!-- 공지사항 -->
   <script src="${pageContext.request.contextPath}/resources/main/boardList.js"></script>
   
</body>

</html>

