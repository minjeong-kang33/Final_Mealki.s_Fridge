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
                     <form name="search" method="get" action="${pageContext.request.contextPath}/employee/employeeList" id="selectBox" name="selectBox2" onsubmit="return fun1()">
                        <select name="search_option" class="search_option">
                           <option value=""> 선택하세요 </option>
                           <option value="emp_Kname"> 이름 </option>
                           <option value="emp_num"> 사번 </option>
                           <option value="emp_tel"> 내선번호 </option>
                           <option value="emp_phone"> 휴대폰번호 </option>
                           <option value="dept_num"> 부서 </option>
                        </select>
                        <span id="text_search"><input class="input-search" type="text" name="keyword"></span>
	                  	<button class="btn btn-primary" type="button" id="IconButton6" style="margin-left: 50%; padding-top: 8px; padding-bottom: 8px; margin-top: 20px;">검색</button>
                     </form>
               </div>

             </div>
             <br>
            </div>           
           
           <div class="stock_table">
               <h4> | 재고 정보 </h4>
               <div class="scrollBar">
            <table border="1" id="stock_search_table">
            	<tr><th>품번</th><th>품명</th><th>현재고</th><th>보관창고</th><th>실사량</th></tr>

					<c:forEach var="dto" items="${employeeListMap }">
	    		
		    		<tr class="emp_search_table_tr"><td>${dto.emp_num}</td><td>${dto.emp_Kname}</td><td>${dto.dept_position}</td>
		    		<td>${dto.dept_position}</td><td>${dto.dept_duty}</td><td>${dto.emp_joinDate}</td>
		    		<td>${dto.emp_tel}</td><td>${dto.emp_email}</td></tr>
		    		
					</c:forEach>
 
            </table>
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
/* 담당자 찾기 (팝업 방법1)*/
 var openWin;

 function findEmployee()
 {
  window.name = "parentForm";
  openWin = window.open("${pageContext.request.contextPath}/wms/placeorder/findEmp_num",
           "childForm", "width=300, height=350,top=300, left=300, resizable = no, scrollbars = no");    
 }

/* 입고창고 찾기 (팝업 방법2)*/
 $('#findWarehouse').on("click",function(e){
	
	let popUrl = "${pageContext.request.contextPath}/wms/placeorder/findWarehouse";
	let popOption = "width = 300px, height=300px, top=300px, left=300px, scrollbars=no, resizable = no";
	
	window.open(popUrl,"입고 창고",popOption);
	
}); 

 /* 상품찾기 */    
 var openWin;

 function findProducts()
 {
  window.name = "parentForm";
  openWin = window.open("${pageContext.request.contextPath}/wms/placeorder/findProducts",
           "childForm", "width=500, height=400,top=300, left=300, resizable = no, scrollbars = no");    
 }

/* 금액 계산하기 */
 $("#order_qty").change(function(){
	var order_qty = document.getElementById('order_qty').value;
	var supply_price = document.getElementById('supply_price').value;
	order_sum.value = order_qty*supply_price;
	order_vat.value = (order_qty*supply_price)*0.1;
	
	});

</script>
<script type="text/javascript">
/* null값 체크 */
function check_input() {
    if (document.OFsearch.order_date.value.trim()==""){
        alert("발주일을 선택하세요");
        document.OFsearch.order_date.focus();
        return;
    }
    if (document.OFsearch.due_date.value.trim()==""){
        alert("납기 희망일을 선택하세요");
        document.OFsearch.due_date.focus();
        return;
    }
    if (document.OFsearch.emp_num.value.trim()==""){
        alert("담당자를 선택하세요");
        document.OFsearch.emp_num.focus();
        return;
    }
    if (document.OFsearch.whs_num.value.trim()==""){
        alert("상품이 입고될 창고를 선택하세요");
        document.OFsearch.whs_num.focus();
        return;
    }
    if (document.OFsearch.item_name.value.trim()==""){
        alert("발주할 상품을 선택하세요");
        document.OFsearch.item_name.focus();
        return;
    }
    if (document.OFsearch.order_qty.value.trim()==""){
        alert("물품의 수량을 선택하세요");
        document.OFsearch.order_qty.focus();
        return;
    }
    alert('발주에 성공하였습니다.');
    document.OFsearch.submit();
 }
</script>
<script> 
//검색 체크
function fun1() {
	
	if(document.search.order_num_keyword.value=="") {
		alert("order_num_keyword 선택하세요")
		document.search.search_option.focus();
		return false;
	}else if(document.search.order_date_keyword.value=="") {
		alert("order_date_keyword 입력하세요");
		document.search.keyword.focus();
		return false;
	}else if(document.search.due_date_keyword.value=="") {
		alert("due_date_keyword 입력하세요");
		document.search.keyword.focus();
		return false;
	}else if(document.search.item_name_keyword.value=="") {
		alert("item_name_keyword 입력하세요");
		document.search.keyword.focus();
		return false;
	}
	
	document.search.submit();
}
</script>
<script>
/* 오늘 날짜 구하기 (발주일 고정값) */
document.getElementById('order_date').valueAsDate = new Date();

/* 내일 날짜 구하기 (납기일 기본값)*/
var today = new Date();
var tomorrow = new Date(today.setDate(today.getDate() + 1));
document.getElementById('due_date').valueAsDate = tomorrow;

/* 납기일 체크 */
function date_check() {
	 if (document.OFsearch.due_date.value.trim() <= document.OFsearch.order_date.value.trim()){
        alert("납기일은 내일 이후로 지정 가능합니다.");
        
        document.OFsearch.due_date.focus();
        document.getElementById('due_date').valueAsDate = tomorrow;
        return;
    } 
}
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