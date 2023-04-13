<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>

<!-- <script src="/Mealki.s_Fridge/script/jquery-1.12.4.js"></script>
<script src="/Mealki.s_Fridge/script/jquery-ui.js"></script> -->
  
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
   <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/contractList.css">
	
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/contractList.css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
	<script type="text/javascript"></script>
	
	
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
                  <h3 class="font-weight-bold">목록상세</h3>
                </div>
                
          <div class="contentbody"> 
          
<!--  본문 내용 시작 -->
<div id="table_content">
<table border="1">
<!-- 수주번호,거래처코드,품목코드,품목명,수주업체,수주일자,납품예정일,담당자코드,담당자 -->
		<tr>
			<th>수주번호</th>
			<th>거래처코드</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>납품예정일</th>
			<th>담당자</th>
			<th>수주수량</th>
         </tr>
         <tr>
         	<td>${contractDTO.business_num }</td>
         	<td>${contractDTO.cust_num }</td>
         	<td>${contractDTO.item_num }</td>
         	<td>${contractDTO.item_name }</td>
         	<td>${contractDTO.cust_name }</td>
         	<td>${contractDTO.business_date}</td>
         	<td>${contractDTO.out_date}</td>
         	<td>${contractDTO.incharge_name }</td>
         	<td>${contractDTO.contract_qty }</td>
         	
         </tr>
<!--          <tr align="center"> -->
<!-- 			<th colspan="9">					 -->
<%-- 			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/contract/update?business_num=${contractDTO.business_num}'">수정</button>  --%>
<%-- 			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/contract/contractList'">글목록</button> --%>
<%-- 			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/contract/delete?business_num=${contractDTO.business_num}'">삭제</button> --%>
<!-- 			</th> -->
<!-- 		</tr>  -->
			




</table>
 

<div align="center" style="margin-top: 15px;">
<c:if test="${contractDTO.exists_in_workorder.equals('0')}">
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/contract/update?business_num=${contractDTO.business_num}'">수정</button>
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/contract/delete?business_num=${contractDTO.business_num}'">삭제</button>
</c:if>			
			<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/contract/contractList'">글목록</button>
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