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
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/wms/stockList.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/employee/empMamageTab.js"></script> --%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
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
                  <h3 class="font-weight-bold">재고 관리</h3>
                </div>
          
           <div class="contentbody"> 
<!--  본문 내용 시작 -->
            <div id="top_table" >
               <div id="table_search">
               <div id="select_search">
                     <form name="search" method="get" action="${pageContext.request.contextPath}/wms/stock/stocksearch">
                       <span>상품유형 <input type="text" name="item_type" id="finditem_type" style="margin-left: 5px;"></span>
			       	   <span style="margin-left: 10px;">품번<input type="text" name="item_num" style="margin-left: 5px;"></span>
			   		   <span style="margin-left: 10px;">품명<input type="text" name="item_name" style="margin-left: 5px;"></span>
			      	   <span style="margin-left: 10px;">보관창고<input type="text" name="whs_num" id="findWarehouse" style="margin-left: 5px;"></span>
			      <button class="btn btn-primary" type="submit" id="IconButton6" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;"><a>조회</a></button>
                     </form>
               </div>

             </div>
             <br>
            </div>           
           
           <div class="stock_table">
               <h4> | 재고 정보 </h4>
               <div class="scrollBar">
            <table border="1" id="stock_search_table">
            	<tr><th>상품유형</th><th>품번</th><th>품명</th><th>현재고</th><th>보관창고</th><th>실사량</th></tr>

					<c:forEach var="StockDTO" items="${stockList }">
	    		
		    		<tr class="emp_search_table_tr">
		    		 <td>${StockDTO.item_type}</td> <td>${StockDTO.item_num}</td><td>${StockDTO.item_name}</td>
		    		<td>${StockDTO.stk_qnt}</td><td>${StockDTO.whs_num}</td>
		    		<td><input type="text" name="new_stk_qnt"></td></tr>
		    		
					</c:forEach>
 
            </table>
            <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="${pageContext.request.contextPath}/wms/stock/stocksearch?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&item_type=${item_type }&item_num=${item_num }&item_name=${item_name }&whs_num=${whs_num}">[10페이지 이전]</a>
				</c:if>
				
				<c:if test="${pageDTO.currentPage > 0}">
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/wms/stock/stocksearch?pageNum=${i}&item_type=${item_type }&item_num=${item_num }&item_name=${item_name }&whs_num=${whs_num}">${i}</a> 
					</c:forEach>
				</c:if>

				<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
					<a href="${pageContext.request.contextPath}/wms/stock/stocksearch?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&item_type=${item_type }&item_num=${item_num }&item_name=${item_name }&whs_num=${whs_num}">[10페이지 다음]</a>
				</c:if> 
            </div>
           
           
           
           </div>     
                
                
 <!--   -->   			      
				    </div>
				  </div>
<!-- 페이징하실거면 여기서 시작 -->

<!-- 페이징 끝 -->
            </div>
            
          <!--  </div>
          
        </div> -->
        
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
<script type="text/javascript">
/* 상품유형 찾기 (팝업)*/
$('#finditem_type').on("click",function(e){
	
	let popUrl = "${pageContext.request.contextPath}/wms/stock/finditem_type";
	let popOption = "width = 300px, height=300px, top=300px, left=300px, scrollbars=no, resizable = no";
	
	window.open(popUrl,"상품 유형",popOption);
	
}); 

/* 입고창고 찾기 (팝업)*/
 $('#findWarehouse').on("click",function(e){
	
	let popUrl = "${pageContext.request.contextPath}/wms/stock/findWarehouse";
	let popOption = "width = 300px, height=300px, top=300px, left=300px, scrollbars=no, resizable = no";
	
	window.open(popUrl,"창고 목록",popOption);
	
}); 
</script>

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