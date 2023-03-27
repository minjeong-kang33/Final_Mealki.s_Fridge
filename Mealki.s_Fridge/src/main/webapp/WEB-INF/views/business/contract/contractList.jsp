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

</script>

<script>
var openWin;

function findContract()
{
	window.name="parentForm";
	openWin=window.open("${pageContext.request.contextPath}/business/contract/findContract",
		"childForm", "width=500, height=400, top=300, left=300, resizable=no, scrollbars=no"	)
	}
</script>

<script>


document.getElementById("addContractButton").addEventListener("click", function() {
	let contractTable = document.getElementById("contractTable");	
	let newRow = contractTable.insertRow(-1);
	
	newRow.innerHTML = '
		<td><input type="text" name="business_num" placeholder="수주번호"></td>
		<td><input type="text" name="cust_num"></td>
		<td><input type="text" name="item_num"></td>
		<td><input type="text" name="item_name"></td>
		<td><input type="text" name="business_name" ></td>
		<td><input type="text" name="business_date"></td>
		<td><input type="text" name="out_date"></td>
		<td><input type="text" name="incharge_code"></td>
		<td><input type="text" name="incharge_name"></td>
		<td><input type="text" name="contract_qty"></td>';

});

</script>

</head>
<style>
body{
	font-size:10pt;
}
button{
	font-size:9pt;
}
table{
	width:1100px;
	border-collapse: collapse;
}
 th,td{ 
 	border:1px solid #cccccc; 
 	padding:3px; 
 } 
.div1{
	width:600px;
	text-align:center;
	font-size:15pt;
}
.div2{
	width:600px;
	text-align:Left;
	font-size:12pt;
}

</style>
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
                  <h3 class="font-weight-bold">수주관리</h3>
                  <h6 class="font-weight-normal mb-0">메뉴설명 <span class="text-primary">강조</span></h6>
                </div>
                
<!--           <div class="contentbody" style="background: pink;">  -->
          
<!--  본문 내용 시작 -->
        <div class="div1">수주관리현황</div>
        <div class="div2">Total: ${total }</div>
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
        
       		
<table id="contractTable">

<!-- 수주번호,거래처코드,품목코드,품목명,수주업체,수주일자,납품예정일,담당자코드,담당자 -->
      
		<tr align="center">
			
			
			<th>수주번호</th> <!-- th width="15%" -->
			
			<th>품목명</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>납품예정일</th>
			<th>담당자코드</th>
			<th>담당자</th>
			
         </tr>
         
         <c:set var="cnt" value="1"/>
         
         <c:forEach var="ContractDTO" items="${resultList}">
         
         <tr align="center">
         
         	
         	<td name="business_num" id="business_num" onclick="findContract()">${ContractDTO.business_num }</td>
         	
         	<td>${ContractDTO.item_name }</td>
         	<td>${ContractDTO.business_name }</td>
         	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ContractDTO.business_date}"/></td>
         	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ContractDTO.out_date}"/></td>
         	<td>${ContractDTO.incharge_code }</td>
         	<td>${ContractDTO.incharge_name }</td>
         	
         </tr>	
         
         <c:set var="cnt" value="${cnt+1}" />
         
         </c:forEach>
         
      	 <tr align="center">
			<th colspan="10"> <!-- return false? -->
			<button type="submit" >저장</button><!-- onclick="fn_submit();return false;" -->
			<button type="reset">취소</button>
			<button type="button" id="addContractButton">신규</button>
			<button type="submit">삭제</button>
			</th>
		</tr> 

		
</table>


 <!--  본문내용 끝 -->    
        
<!--           </div> -->
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
</div>
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