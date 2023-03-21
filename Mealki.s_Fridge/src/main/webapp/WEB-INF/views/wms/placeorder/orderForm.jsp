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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/wms/orderForm.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/employee/empMamageTab.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">
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
                  <h3 class="font-weight-bold">발주 관리</h3>
                </div>
                
                <div class="tab">
				    <ul class="tabnav">
				      <li><a href="#tab01">발주 등록</a></li>
				      <li><a href="#tab02">발주 현황</a></li>
				    </ul>
				    
				    <div class="tabcontent">
				      <div id="tab01">
				      <h4> | 필수 입력 사항 </h4>
<!--  발주 등록 시작 -->

            <div id="top_table" >
            	<div id="table_search">
            	<form name="OFsearch" method="post" action="${pageContext.request.contextPath}/wms/placeorder/insertOrderPro">
            	<span id="select_search">
			        <span id="order_date_search">발주일<input type="date" id="currentDate" readonly class="input-search"></span>
			        <span id="due_date_search">납기일<input type="date" class="input-search"></span>
			   		<span id="emp_num_search">담당자<input class="input-search" type="text" name="search" id="findEmp_num"></span>
			        <span id="whs_num_search">입고창고<input class="input-search" id="findWarehouse" type="text" name="search"></span>
	            </span>

 				<br>
            
            	<h4> | 발주 항목 등록 </h4>
				<table border="1" id="dynamicTable">
					 <tr><th>품번</th><th>품명</th><th>거래처명</th><th>단위</th><th>창고수량</th><th>발주수량</th><th>납입단가</th><th>단가총계</th><th>부가세</th></tr>
					 <tr><td><input type="text" name="item_num" id="findProducts" value=""></td>
					 	 <td><input type="text" name="item_name" value="" readonly onfocus="this.blur();"></td>
					 	 <td><input type="text" name="supplier" readonly onfocus="this.blur();" value=""></td>
					 	 <td><input type="text" name="weight" readonly onfocus="this.blur();" value=""></td>
					 	 <td><input type="text" name="stk_qnt" readonly onfocus="this.blur();" value=""></td>
					 	 <td><input type="number" name=""></td>
					 	 <td><input type="text" name="" readonly onfocus="this.blur();" value=""></td>
					 	 <td><input type="text" name="" readonly onfocus="this.blur();" value=""></td>
					 	 <td><input type="text" name="" readonly onfocus="this.blur();" value=""></td></tr>
				</table>
				<button type="submit">저장</button>
				<hr>
	   		
	   		</form>
            </div>

				      
				      
				      </div>
				      </div>
 <!--  발주 등록 끝 -->   				     
				      <div id="tab02">
<!--  발주 현황 시작 -->				      
				      <h4> | 검색 </h4>
				      <div id="top_table" >
            	<div id="table_search">
            	<span id="select_search">
			        <span>발주번호<input type="text" id="order_num_search2"></span>
			        <span>발주일<input type="date" id="order_date_search2"></span>
			   		<span>납기일<input type="date" id="due_date_search2"></span>
			        <span>품명<input type="text" id="pd_num_search2"></span>
	            </span>

 				<br>
            
            	<h4> | 발주 내역 목록 </h4>
				<table border="1">
					 <tr><th>발주번호</th><th>품명</th><th>발주수량</th><th>단위</th><th>거래처명</th><th>발주일</th><th>납기일</th><th>입고창고</th><th>단가총계</th><th>부가세</th><th>담당자</th></tr>
					 <tr><td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td>
					 	 <td></td></tr>
				</table>
				<hr>
	   		
            </div>

				      
				      
				      </div>
				      </div>
				      
<!--  발주 현황 끝 -->  				      
				      </div>
				    </div>
				  </div>
          <div class="contentbody"> 
          
 
        
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
<script type="text/javascript">
/* 입고창고 찾기 */
 $('#findWarehouse').on("click",function(e){
	
	e.preventDefault();
	
	let popUrl = "${pageContext.request.contextPath}/wms/placeorder/findWarehouse";
	let popOption = "width = 300px, height=300px, top=300px, left=300px, scrollbars=no, resizable = no";
	
	window.open(popUrl,"입고 창고",popOption);	
	
}); 
</script>
<script type="text/javascript">
/* 담당자 찾기 */
$('#findEmp_num').on("click",function(e){
	
	e.preventDefault();
	
	let popUrl = "${pageContext.request.contextPath}/wms/placeorder/findEmp_num";
	let popOption = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes, resizable = no";
	
	window.open(popUrl,"담당자 찾기",popOption);	
	
});

/* 상품찾기 */
$('#findProducts').on("click",function(e){
	
	e.preventDefault();
	
	let popUrl = "${pageContext.request.contextPath}/wms/placeorder/findProducts";
	let popOption = "width = 650px, height=600px, top=300px, left=300px, scrollbars=yes, resizable = no";
	
	window.open(popUrl,"상품 찾기",popOption);	
	
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