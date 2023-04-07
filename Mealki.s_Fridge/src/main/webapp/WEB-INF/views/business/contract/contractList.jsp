<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/contractList.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript"></script>

<!-- 검색어 -->
<script> 
function fun1() {
	
	if(document.search.search_option.value=="") {
		alert("검색 조건을 선택하세요")
		document.search.search_option.focus();
		return false;
	}
	if(document.search.search_option.value==0) {
		alert("검색어를 입력하세요");
		document.search.search_option.focus();
		return false;
		}
	
		document.search.submit();
}

function fun1(){
	console
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
                  <h3 class="font-weight-bold">출하관리</h3>
                  <h6 class="font-weight-normal mb-0"> <span class="text-primary">목록클릭시 수정삭제가능</span></h6>
                </div>
                
          <div class="contentbody"> 
          
<!--  본문 내용 시작 -->
		
        <div>Total: ${total }</div>
        	<div id="table_search">
        		
        			<form name="search" action="${pageContext.request.contextPath}/business/contract/contractList" method="get" onsubmit="fun1()">
						<select name="search_option" class="search_option">
							 <option value=""> 선택하세요 </option>
			         		 <option value="item_name"> 품목명 </option>
			        		 <option value="business_name"> 수주업체 </option>
						</select>
						<input type="text" name="search" class="input_box">
						<input type="submit" value="search">
 					</form>
 				
			        
        	</div>
        
		<div id="table_content">
			<form name="store_form" method="get">       		  
			<table border="1">

<!-- 수주번호,거래처코드,품목코드,품목명,수주업체,수주일자,납품예정일,담당자코드,담당자 -->
      
		<tr align="center">
			
			
			<th>품목명</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>납품예정일</th>
			<th>담당자</th>
			<th>수주수량</th>
         </tr>
         
         
         <c:forEach var="ContractDTO" items="${resultList}">
         
         <tr align="center" onclick="location.href='${pageContext.request.contextPath}/business/contract/content?business_num=${ContractDTO.business_num}'">
         
         	
         	<td>${ContractDTO.item_name }</td>
         	<td>${ContractDTO.business_name }</td>
			<td>${ContractDTO.business_date }</td>
			<td>${ContractDTO.out_date }</td>
         	<td>${ContractDTO.incharge_name }</td>
         	<td>${ContractDTO.contract_qty }</td>
         </tr>	
         
         
         </c:forEach>
         
	
	</table>
		<div align="center">
        <input type="button" class="btn btn-primary" value="신규" onclick="location.href='${pageContext.request.contextPath}/business/contract/contractWrite'" >
        </div>
     </form>
    
     </div>
     
     </div>
<!-- 페이징하실거면 여기서 시작 -->
<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/business/contract/contractList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">Prev</a>
</c:if>


<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/business/contract/contractList?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
</c:forEach>


<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/business/contract/contractList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">Next</a>
</c:if>
</div>
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