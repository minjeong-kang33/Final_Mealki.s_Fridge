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
  <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/customerList.css">
  

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
                  <h3 class="font-weight-bold">거래처 목록</h3>
                  <h6 class="font-weight-normal mb-0">&nbsp;&nbsp;&nbsp;<span class="text-primary">* 거래처를 클릭하시면 상세 정보 조회가 가능합니다</span></h6>
                </div>
                
          <div class="contentbody" > 
<!--  본문 내용 시작 -->
            <div id="table_search">
            	<div id="select_search"> 
	            	<form action="${pageContext.request.contextPath}/business/customer/customerList" id="selectBox" name="search" method="get">
		            	<select name="search_option" class="search_option">
		            		<option value=""> 선택하세요 </option>
		            		<option value="cust_num"> 거래처코드 </option>
		            		<option value="cust_name"> 거래처명 </option>
		            		<option value="cust_uptae"> 업태 </option>
		            	</select>
		            <input type="text" name="keyword" class="input-search" >
		            <input type="image" name="button" class="search_icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25">
	            	</form>
            	</div>
            	
            	<div id="table_write">
            	<c:choose>
				    <c:when test="${sessionScope.dept_num == 200}">
				        <input type="button" class="btn btn-primary" id="new_customer" value="신규등록" onclick="insertCust()">
				    </c:when>
				    <c:otherwise>
				        <input type="button" class="btn btn-primary" id="new_customer" value="신규등록" onclick="alert('권한이 없습니다.')">
				    </c:otherwise>
				</c:choose>
				</div>
            </div>
            
			<div id="table_content">
				<form id="tableForm" method="post">
				<table border="1">
					<tr>
					<th><input type="checkbox" id="checkAll" name="checkAll" value="${CustomerDTO.business_num }"></th>
					<th>거래처코드</th><th>거래처구분</th><th>거래처명</th><th>대표자명</td><th>대표전화번호</th>
					<th>주소</th><th>업태</th><th>종목</th><th>담당자이메일</th></tr>
				
				<c:forEach var="CustomerDTO" items="${customerList }">
					<c:if test="${CustomerDTO.cust_status == 1}">
						<tr>
							<td><input type="checkbox" id="rowCheck" name="rowCheck" value="${CustomerDTO.business_num }"></td>
							<td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.cust_num}</td>
							<td onclick="openDetail('${CustomerDTO.business_num}')">
							    <c:choose>
							        <c:when test="${CustomerDTO.cust_gubun1 eq '납입처'}">
							            납입처
							        </c:when>
							        <c:when test="${CustomerDTO.cust_gubun1 eq '납품처'}">
							            납품처
							        </c:when>
							        <c:otherwise>
							            기타
							        </c:otherwise>
							    </c:choose>
							</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.cust_name}</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.boss_name}</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.cust_tel}</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.cust_address}, ${CustomerDTO.cust_address2}</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.cust_uptae}</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.cust_jongmok}</td>
						    <td onclick="openDetail('${CustomerDTO.business_num}')">${CustomerDTO.man_email}</td>
						</tr>
				   </c:if> 
				</c:forEach>
				
				</table>
				</form>
				
			</div>
			<div id="button2">
				<c:choose>
				    <c:when test="${sessionScope.dept_num == 200}">
				        <button class="btn btn-primary" type="button" id="deleteCustButton" >선택삭제</button>
				    </c:when>
				    <c:otherwise>
				        <button class="btn btn-primary" type="button" onclick="alert('권한이 없습니다.')">선택삭제</button>
				    </c:otherwise>
				</c:choose>
			</div>
			<!-- 페이징 시작 -->
			<div style="text-align: center;">
				<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="${pageContext.request.contextPath}/business/customer/customerList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search_option=${pageDTO.search_option}&keyword=${pageDTO.keyword}">[이전]</a>
					</c:if>
					
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
					<a href="${pageContext.request.contextPath}/business/customer/customerList?pageNum=${i}&search_option=${pageDTO.search_option}&keyword=${pageDTO.keyword}">${i}</a> 
					</c:forEach>
					
					<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
					<a href="${pageContext.request.contextPath}/business/customer/customerList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search_option=${pageDTO.search_option}&keyword=${pageDTO.keyword}">[다음]</a>
				</c:if>
			</div>
			<!-- 페이징 끝 -->
			
				
					
 
 <!--  본문내용 끝 -->    
        
          </div >
 <!-- 페이징 시작 --> 

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
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
  
  <script type="text/javascript">
	  function openDetail(business_num) {
		    window.open("${pageContext.request.contextPath}/business/customer/customerDetail?business_num="+business_num, "popup", "width=1500, height=907,top=100, left=200,scrollbars=yes");
		}
  </script>
 
   <script type="text/javascript">	   
 	  function insertCust() 
 	  { 
 	   window.name = "insertCust"; 
 	   openWin = window.open("${pageContext.request.contextPath}/business/customer/insertCustomer", 
 	            "childForm", "width=600, height=1000,top=300, left=300, resizable = no, scrollbars = no");   
 	  }
   </script>
  
  <script>
  <!-- 			체크박스 all선택 -->
  document.addEventListener("DOMContentLoaded", function() {
    let checkAll = document.querySelector("#checkAll");
    let checkboxes = document.querySelectorAll("input[name='rowCheck']");

    checkAll.addEventListener("change", function() {
      for (let checkbox of checkboxes) {
        checkbox.checked = checkAll.checked;
      }
    });
  });
  
  // 삭제 버튼
 window.onload = function() {
  document.getElementById("deleteCustButton").addEventListener("click", function() {
	  let elements = document.getElementById("tableForm").querySelectorAll('input[name="rowCheck"]:checked');
	  if(elements.length === 0){
	      alert("선택된 거래처가 없습니다");
	      return;
	  }
	  
	  if(confirm("삭제하시겠습니까?")){
      let formData = new FormData();
      for(let i = 0; i< elements.length; i++){
        formData.append("selectId",elements[i].value);
      }

      let request = new XMLHttpRequest();
      request.open("POST","${pageContext.request.contextPath}/business/customer/deleteCustList");
      request.send(formData);

      request.onreadystatechange = function() {
          if (request.readyState == 4 && request.status == 200) {
            location.reload();
          }
    };
    }
  })
 };
  </script>

</body>
</html>