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
                  <h3 class="font-weight-bold">거래처관리</h3>
                  <h6 class="font-weight-normal mb-0">메뉴설명쓰 <span class="text-primary">강조쓰</span></h6>
                </div>
                
          <div class="contentbody" > 
<!--  본문 내용 시작 -->
            <div id="table_search">
            
            	<form action="${pageContext.request.contextPath}/business/customer/customerList" name="searchCustomer" method="post" >
	            	<select name="search_option">
	            		<option value=""> 선택하세요 </option>
	            		<option value="emp_Kname"> 거래처코드 </option>
	            		<option value="emp_num"> 거래처명 </option>
	            		<option value="emp_tel"> 업태 </option>
	            	</select>
	            <input type="text" name="search" class="search" >
	            <button type="submit" >검색</button>
            	</form>
            </div>
            
			<div id="table_content">
			 <form action="${pageContext.request.contextPath}/business/customer/deleteCustomer" method="post">          
				<table border="1">
					<tr><td><input type="checkbox" name="allCustomers" value="${CustomerDTO.cust_num}" id="checkAll"></td>
					<td>거래처코드</td><td>거래처명</td><td>대표자명</td><td>대표전화번호</td>
					<td>주소</td><td>업태</td><td>종목</td><td>담당자이메일</td></tr>
				
				<c:forEach var="CustomerDTO" items="${customerList }">
				
					<tr><td><input type="checkbox" name="selectedCustomers" value="${CustomerDTO.cust_num}"></td>
					    <td><a href=# style="color: black">${CustomerDTO.cust_num}</a></td>
					    <td><a href=# style="color: black">${CustomerDTO.cust_name}</a></td>
					    <td>${CustomerDTO.boss_name}</td>
					    <td>${CustomerDTO.cust_tel}</td>
					    <td>${CustomerDTO.cust_adress}, ${CustomerDTO.cust_adress2}</td>
					    <td>${CustomerDTO.cust_uptae}</td>
					    <td>${CustomerDTO.cust_jongmok}</td>
					    <td>${CustomerDTO.man_email}</td></tr>
				    
				</c:forEach>
				
				</table>
				</form>
			</div>
				<input type="submit" value="삭제" onclick="return confirm('거래처를 삭제하시겠습니까?')">
			<div>
				
			</div>
			
 
 <!--  본문내용 끝 -->    
        
          </div>
<!-- 페이징하실거면 여기서 시작 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/business/customer/customerList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/business/customer/customerList?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/business/customer/customerList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
</c:if>

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