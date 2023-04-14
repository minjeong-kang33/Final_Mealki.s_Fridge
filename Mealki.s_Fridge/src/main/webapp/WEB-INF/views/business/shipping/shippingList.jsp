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
  <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/shipping/shippingList.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript"></script>

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

$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	  });


</script>
<style>
.btn btn-primary{
	 width: 50px;
	 height: 30px;
}
#table_write{
   float: right;
   margin-right: 5px;
   margin-bottom: 30px;
   width: 7%;
}
</style>
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
                  <h3 class="font-weight-bold">출하현황 </h3>
                  <h6 class="font-weight-normal mb-0"> <span class="text-primary"></span></h6>
                </div>
                
          <div class="contentbody"> 
          
<!--  본문 내용 시작 -->
	<div>Total: ${total}</div>
		<div id="table_search">
			<div id="select_search">
				<form name="search" action="${pageContext.request.contextPath}/business/shipping/shippingList" method="get" onsubmit="fun1()">
					<select name="search_option" class="search_option">
						<option value="">선택하세요</option>
						<option value="product_name">품명</option>
						<option value="item_num">품목코드</option>
					</select>
						<input type="text" name="search" class="input_box">
						<input type="submit" value="search">		
		  		</form>
		   </div>
				
			<div id="table_write" >
				<c:choose>
				 <c:when test="${sessionScope.dept_num == 200 || sessionScope.dept_num == 600}">
					<button type="submit"  class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/business/shipping/shippingWrite'" >신규</button>
				</c:when>
				</c:choose>
			</div> 	
		</div>	


           <div class="tab">
           	<ul class="tabnav">
           		<li><a href="#tab01">전체</a></li>
           		<li><a href="#tab02">대기</a></li>
           		<li><a href="#tab03">완료</a></li>
           	</ul>	
			
           	<div class="tabcontent">
           		
           		<div id="tab01" style="width: 100%"> <!-- tab 3내용 -->
				        <div class="store_total_div" style="width: 100%;">
		       				<form name="" method="get">
		       				
           		<table border="1" class="shipping_total_table" style="width: 100%;">
           		
           		<tr align="center"> 
           			<th>작업지시번호</th>
           			<th>품목코드</th>
           			<th>품명</th>
           			<th>출하일자</th>
           			<th>납품예정일</th>
           			<th>출하량</th>
<!--            			<th>재고수량</th> -->
           			<th>담당자</th>
           			<th>수주업체</th>
           			<th>출하상태</th>
           			<th>출하현황</th>
           		</tr>
           		
           		<c:forEach var="ShippingDTO" items="${resultList}">	
           			<tr align="center">
           			<td>${ShippingDTO.wo_num}</td>
           			<td>${ShippingDTO.item_num}</td>
           			<td>${ShippingDTO.item_name}</td>
           			<td>${ShippingDTO.delivery_date}</td>
           			<td>${ShippingDTO.out_date}</td>
<%--            			<td>${ShippingDTO.out_qty}</td> --%>
           			<td>${ShippingDTO.qc_qty}</td>
           			<td>${ShippingDTO.incharge_name}</td>
           			<td>${ShippingDTO.cust_name}</td>
           			<td>
           			${ShippingDTO.out_progress}</td>
           			<td>
           				<c:choose>
           				<c:when test="${sessionScope.dept_num == 200 || sessionScope.dept_num == 600}">
           				<c:if test="${ShippingDTO.out_progress eq '대기'}">
           					<input type="button" value="출하처리" class="shipping_submit_button" onclick="location.href='${pageContext.request.contextPath}/business/shipping/addShipping?shipping_num=${ShippingDTO.shipping_num}'">
           				</c:if>
           				</c:when>
           				</c:choose>
           			</td>
           			</tr>
           		</c:forEach>
           		
           		</table>
           			
           		</form>
           		<div id="page_control">
				<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
				<a href="${pageContext.request.contextPath}/business/shipping/shippingList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}">Prev</a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
				<a href="${pageContext.request.contextPath}/business/shipping/shippingList?pageNum=${i}&search=${pageDTO.search}">${i}</a> 
				</c:forEach>
				
				
				<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
				<a href="${pageContext.request.contextPath}/business/shipping/shippingList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}">Next</a>
				</c:if>
				
				</div>
           		
           		</div>
           		
           		</div>
           		
<!-- 대기 -->
				<div id="tab02" style="width: 100%"> <!-- tab 3내용 -->
				        <div class="store_total_div" style="width: 100%;">
		       				<form name="" method="get">
           		
           		<table border="1" class="shipping_total_table" style="width: 100%;">
           		<tr align="center">
           			<th>작업지시번호</th>
           			<th>품목코드</th>
           			<th>품명</th>
           			<th>출하일자</th>
           			<th>납품예정일</th>
           			<th>출하량</th>
<!--            			<th>재고수량</th> -->
           			<th>담당자</th>
           			<th>수주업체</th>
           			<th>출하상태</th>
           			<th>출하현황</th>
           		</tr>
           		
          		<c:forEach var="ShippingDTO" items="${resultList}">	
           		<c:if test="${ShippingDTO.out_progress eq '대기'}">
           			<tr align="center">
           			<td>${ShippingDTO.wo_num}</td>
           			<td>${ShippingDTO.item_num}</td>
           			<td>${ShippingDTO.item_name}</td>
           			<td>${ShippingDTO.delivery_date}</td>
           			<td>${ShippingDTO.out_date}</td>
<%--            			<td>${ShippingDTO.out_qty}</td> --%>
           			<td>${ShippingDTO.qc_qty}</td>
           			<td>${ShippingDTO.incharge_name}</td>
           			<td>${ShippingDTO.cust_name}</td>
           			<td>
           			${ShippingDTO.out_progress}</td>
           			<td>
           				<c:choose>
           				<c:when test="${sessionScope.dept_num == 200 || sessionScope.dept_num == 600}">
           				<c:if test="${ShippingDTO.out_progress eq '대기'}">
           					<input type="button" value="출하처리" class="shipping_submit_button" onclick="location.href='${pageContext.request.contextPath}/business/shipping/addShipping?shipping_num=${ShippingDTO.shipping_num}'">
           				</c:if>
           				</c:when>
           				</c:choose>
           			</td>
           			</tr>
           			</c:if>
           		</c:forEach>
           		</table>
           		</form>
           		
           		</div>
           		</div>
           		
<!--  완료 -->
				<div id="tab03" style="width: 100%"> <!-- tab 3내용 -->
				        <div class="store_total_div" style="width: 100%;">
		       				<form name="" method="get">
           		
           		<table border="1" class="shipping_total_table" style="width: 100%;">
           		<tr align="center">
           			<th>작업지시번호</th>
           			<th>품목코드</th>
           			<th>품명</th>
           			<th>출하일자</th>
           			<th>납품예정일</th>
           			<th>출하량</th>
<!--            			<th>재고수량</th> -->
           			<th>담당자</th>
           			<th>수주업체</th>
           			<th>출하상태</th>
           			<th>출하현황</th>
           		</tr>
           		
           		<c:forEach var="ShippingDTO" items="${resultList}">	
           			<c:if test="${ShippingDTO.out_progress eq '출하완료'}">
           			<tr align="center">
           			<td>${ShippingDTO.wo_num}</td>
           			<td>${ShippingDTO.item_num}</td>
           			<td>${ShippingDTO.item_name}</td>
           			<td>${ShippingDTO.delivery_date}</td>
           			<td>${ShippingDTO.out_date}</td>
<%--            			<td>${ShippingDTO.out_qty}</td> --%>
           			<td>${ShippingDTO.qc_qty}</td>
           			<td>${ShippingDTO.incharge_name}</td>
           			<td>${ShippingDTO.cust_name}</td>
           			<td>
           			${ShippingDTO.out_progress}</td>         				          				          				
           			<td>
           				<c:if test="${ShippingDTO.out_progress eq '대기'}">
           				<input type="button" value="출하처리" class="shipping_submit_button">
           				</c:if>
           			</td>
           			
           			</tr>
           			</c:if>
           		</c:forEach>
           		</table>
           		</form>
           			
           		</div>
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