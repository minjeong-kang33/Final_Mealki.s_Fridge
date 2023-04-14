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
  <link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/wms/orderForm.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/employee/empMamageTab.js"></script> --%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">
/* 탭 전환 */
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

<script type="text/javascript">
/* 탭1에서 검색후 탭2 클릭시 검색결과가 url 창에 그대로 남아있으므로 페이지 갱신없이 url만 변경 */
function fun2() {
	history.pushState(null, null, 'insertOrder');
}
function fun3(event) {
	  event.preventDefault();
	  alert('권한이 없습니다.');
	  location.reload();
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
                  <h3 class="font-weight-bold">발주 관리</h3>
                </div>
                
                <div class="tab">
				    <ul class="tabnav">
				      <li><a href="#tab01">발주 현황</a></li>
				      <c:choose>
     					 <c:when test="${sessionScope.dept_num == 400 || sessionScope.dept_num == 600}">
       						 <li><a href="#tab02" onclick="fun2()">발주 등록</a></li>
     					 </c:when>
      					<c:otherwise>
       						 <li><a onclick="fun3(event)">발주 등록</a></li>
      					</c:otherwise>
    				</c:choose>
				    </ul>
				    
				    <div class="tabcontent">
				      <div id="tab01">
<!--  발주 현황 시작 -->	
			<div class="contentbody">       
			<div id="top_table" >
            	<div id="table_search">
            	<form name="search" method="get" action="${pageContext.request.contextPath}/wms/placeorder/insertOrder">
            	<span id="select_search">
			        <span>발주번호<input type="text" name="order_num" style="margin-left: 5px; width: 180px;"></span>
			        <span style="margin-left: 10px;">발주일<input type="date" name="order_date" style="margin-left: 5px;"></span>
			   		<span style="margin-left: 10px;">납기일<input type="date" name="due_date" style="margin-left: 5px;"></span>
			        <span style="margin-left: 10px;">품명<input type="text" name="item_name" style="margin-left: 5px;"></span>
			      <button class="btn btn-primary" type="submit" id="IconButton6" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;"><a>조회</a></button>
			       </span>
			      </form>
	          </div> 
	          
 				<br>
            
            	<h4> | 발주 내역 목록 </h4>
				<table border="1" id="orderlist_table">
					 <tr><th>발주번호</th><th>품번</th><th>품명</th><th>발주수량</th><th>발주일</th><th>납기일</th><th>입고창고</th><th>단가총계</th><th>부가세</th><th>담당자</th></tr>
					 <c:forEach var="PlaceOrderDTO" items="${orderList }">
						<tr>
							<td style="width: 250px;">${PlaceOrderDTO.order_num }</td>
							<td style="width: 100px;">${PlaceOrderDTO.item_num }</td>
							<td>${PlaceOrderDTO.item_name }</td>
							<td style="width: 100px;">${PlaceOrderDTO.order_qty }</td>
							<td style="width: 150px;">${PlaceOrderDTO.order_date }</td>
							<td style="width: 150px;">${PlaceOrderDTO.due_date }</td>
							<td>${PlaceOrderDTO.whs_num }</td>
							<td>${PlaceOrderDTO.order_sum }</td>
							<td>${PlaceOrderDTO.order_vat }</td>
							<td style="width: 150px;">${PlaceOrderDTO.emp_num }</td>
							</tr>
				 	</c:forEach>
				</table>
				<div style="text-align: center; margin-top: 10px;">
				 <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
					<a href="${pageContext.request.contextPath}/wms/placeorder/insertOrder?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&order_num=${order_num }&order_date=${order_date }&due_date=${due_date }&item_name=${item_name}">[10페이지 이전]</a>
				</c:if>
				
				<c:if test="${pageDTO.currentPage > 0}">
					<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<a href="${pageContext.request.contextPath}/wms/placeorder/insertOrder?pageNum=${i}&order_num=${order_num }&order_date=${order_date }&due_date=${due_date }&item_name=${item_name}">${i}</a> 
					</c:forEach>
				</c:if>

				<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
					<a href="${pageContext.request.contextPath}/wms/placeorder/insertOrder?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&order_num=${order_num }&order_date=${order_date }&due_date=${due_date }&item_name=${item_name}">[10페이지 다음]</a>
				</c:if> 
				</div>
				<hr>
	   		
            </div>

				      
				      
				      </div>
				      </div>
				      
<!--  발주 현황 끝 -->  	
				      <div id="tab02">
<!--  발주 등록 시작 -->
            <div id="top_table" >
            	<form name="OFsearch" method="post" action="${pageContext.request.contextPath}/wms/placeorder/insertOrderPro" id="form-id">
            	<div id="table_search2">
            	<span id="select_search">
			        <span id="order_date_search">발주일<input type="date" id="order_date" class="input-search" name="order_date" readonly style="margin-left: 5px;"></span>
			        <span id="due_date_search" style="margin-left: 10px; font-weight: 300;">납기일<input type="date" id="due_date" class="input-search" name="due_date" onchange="date_check()" style="margin-left: 5px;"></span>
			   		<span id="emp_num_search" style="margin-left: 10px;">담당자<input class="input-search" type="text" name=emp_num id="findEmp_num" value="${sessionScope.emp_num }" onclick="findEmployee()" style="margin-left: 5px;"></span>
			        <span id="whs_num_search" style="margin-left: 10px;">입고창고<input class="input-search" id="findWarehouse" type="text" name="whs_num" style="margin-left: 5px;"></span>
	            </span>
				</div>

 				<br>
            
            	<h4 style="margin-left: 15px;"> | 발주 항목 등록 </h4>
				<table border="1" id="dynamicTable" style="margin-left: 15px;">
					 <tr><th>품번</th><th>품명</th><th>거래처명</th><th>단위</th><th>창고수량</th><th>발주수량</th><th>납입단가</th><th>단가총계</th><th>부가세</th><th></th></tr>
					 <tr>
					 	 <td style="width: 100px;"><input type="text" name="item_num" id="item_num_1" onclick="findProducts(this)" ></td>
					 	 <td style="width: 150px;"><input type="text" name="item_name" id="item_name_1" readonly onfocus="this.blur();" onclick="findProducts(this)" ></td>
					 	 <td style="width: 150px; background-color: #dee2e6;"><input type="text" name="supplier" id="supplier_1" readonly onfocus="this.blur();"></td>
					 	 <td style="width: 100px; background-color: #dee2e6;"><input type="text" name="weight" id="weight_1" readonly onfocus="this.blur();"></td>
					 	 <td style="width: 100px; background-color: #dee2e6;"><input type="text" name="stk_qnt" id="stk_qnt_1" readonly onfocus="this.blur();"></td>
					 	 <td style="width: 100px;"><input type="text" name="order_qty" id="order_qty_1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
					 	 <td style="width: 100px; background-color: #dee2e6;"><input type="text" name="supply_price" id="supply_price_1" readonly onfocus="this.blur();"></td>
					 	 <td style="width: 130px; background-color: #dee2e6;"><input type="text" name="order_sum" id="order_sum_1" readonly onfocus="this.blur();"></td>
					 	 <td style="width: 130px; background-color: #dee2e6;"><input type="text" name="order_vat" id="order_vat_1" readonly onfocus="this.blur();">
					 	 <td style="width: 130px;"></td>
					 </tr>
				</table>
				<button class="btn btn-primary" type="button" onclick="check_input()" id="IconButton6" style="margin-left: 45%; padding-top: 8px; padding-bottom: 8px; margin-top: 20px;">전송</button>
				<button class="btn btn-primary" type="button" onclick="add_column()" id="IconButton6" style="margin-left: 10px; padding-top: 8px; padding-bottom: 8px; margin-top: 20px;">항목 추가</button>
				<hr>
	   		
	   			</form>
            </div>

				      </div>
				      </div>
 <!--  발주 등록 끝 -->   			      
				      </div>
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

	function findEmployee(){
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
 /* 상품선택은 창고선택보다 선행되어서는 안됨 */
 var openWin;

	function findProducts(clickedInput){
		var whs_num = document.getElementsByName("whs_num")[0].value;
		window.clickedInput = clickedInput;
		if (whs_num === "") {
			alert("입고 창고를 먼저 선택하세요");
		} else {
			window.name = "parentForm";
			openWin = window.open("${pageContext.request.contextPath}/wms/placeorder/findProducts",
           							"childForm", "width=500, height=400,top=300, left=300, resizable = no, scrollbars = no");   
 }}
 
// 상품찾기 창에서 메시지를 받는 이벤트 리스너
 window.addEventListener('message', function(event) {
   // 받은 데이터
   var data = event.data;
   // 받은 데이터를 부모 창의 테이블에 채우는 로직
   if (data) {
     // 부모 창의 테이블의 행(row)을 선택
     var row =  clickedInput.closest('tr');
     row.querySelector('input[name="item_num"]').value = data.item_num;
     var get_item_num = row.querySelector('input[name="item_num"]');
     /* 가지고 온 item_num이 이미 입력되어 있지 않은 지 확인 */
     var item_num_inputs = document.querySelectorAll('input[name^="item_num"]');
     var duplicated = false;
     for (var i = 0; i < item_num_inputs.length; i++) {
         if (item_num_inputs[i] !== get_item_num && item_num_inputs[i].value === get_item_num.value) {
           alert('이미 입력된 상품입니다.');
           get_item_num.value = '';
           duplicated = true;
           break;
         }
     }
     if (!duplicated) {
         row.querySelector('input[name="item_name"]').value = data.item_name;
         row.querySelector('input[name="supplier"]').value = data.supplier;
         row.querySelector('input[name="weight"]').value = data.weight;
         row.querySelector('input[name="stk_qnt"]').value = data.stk_qnt;
         /* 받아온 현재고량을 확인 후 10미만일 경우 빨간 글씨로 표시 */
         var stk_qnt_input = row.querySelector('input[name="stk_qnt"]');
         stk_qnt_input.value = data.stk_qnt;
         if (stk_qnt_input.value < 10) {
           stk_qnt_input.style.color = "red";
         }
         row.querySelector('input[name="supply_price"]').value = data.supply_price;
     }
     // 메시지 수신이 완료되었음을 자식창에게 알림
     event.source.postMessage('received', event.origin);
   }
 });
 
 
/* 금액 계산하기 */
/* 주문량이 상품명 선택보다 선행되면 안됨 */
$(document).on('change', '[id^="order_qty"]', function(){
	var row = $(this).closest('tr'); // 현재 input 요소가 속한 tr 요소를 찾음
	var itemNameInput = row.find('[id^="item_name"]').val(); // 같은 행에 있는 item_name으로 시작하는 id를 갖는 요소의 값을 가져옴
	var order_qty = this.value;
	
	if (itemNameInput === "") {
		alert("상품을 먼저 선택하세요");
		$(this).val("");	
	} else {
		var supply_price = row.find('[id^="supply_price"]').val();
		var order_sum = row.find('[id^="order_sum"]'); // 같은 행에 있는 order_sum으로 시작하는 id를 갖는 요소
        var order_vat = row.find('[id^="order_vat"]'); // 같은 행에 있는 order_vat으로 시작하는 id를 갖는 요소
        
        order_sum.val(order_qty * supply_price); // order_sum의 값을 계산하여 설정
        order_vat.val((order_qty * supply_price) * 0.1); // order_vat의 값을 계산하여 설정
	}
	}); 


</script>
<script type="text/javascript">
/* null값 체크 */
function check_input() {
	var table = document.getElementById("dynamicTable"); 
	var rowCount = table.rows.length-1;
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

	 for (var i = 1; i <= rowCount; i++) {
	    if(document.getElementById('item_name_' + i).value.trim() === "" && document.getElementById('order_qty_' + i).value.trim() === ""){
	    	alert("사용하지 않는 행이 있다면 삭제 후 다시 시도해주세요.");
	    	document.getElementById('item_name_' + i).focus();
	        return;
	    }
		 if (document.getElementById('item_name_' + i).value.trim() === ""){
	        alert("발주할 상품을 선택하세요");
	        document.getElementById('item_name_' + i).focus();
	        return;
	    }
	    if (document.getElementById('order_qty_' + i).value.trim() === ""){
	        alert("물품의 수량을 선택하세요");
	        document.getElementById('order_qty_' + i).focus();
	        return;
	    }
	 }
	// 테이블에서 데이터 추출하기 후 배열에 담아 넘기기
	  var data = [];
	  var table = document.getElementById("dynamicTable");
	  var order_date = document.OFsearch.order_date.value.trim();
	  var due_date = document.OFsearch.due_date.value.trim();
	  var whs_num = document.OFsearch.whs_num.value.trim();
	  var emp_num = document.OFsearch.emp_num.value.trim();
	  
	  for (var i = 1; i < rowCount+1; i++) {
		  var row = table.rows[i];
		  var item_num = row.querySelector('input[name="item_num"]').value;
		  var item_name = row.querySelector('input[name="item_name"]').value;
		  var order_qty = row.querySelector('input[name="order_qty"]').value;
		  var order_sum = row.querySelector('input[name="order_sum"]').value;
		  var order_vat = row.querySelector('input[name="order_vat"]').value;
		  
		  data.push({
		    "item_num": item_num,
		    "item_name": item_name,
		    "order_qty": order_qty,
		    "order_sum": order_sum,
		    "order_vat": order_vat
		  });	    
	  }
	  
	  var orderData = {
			  "order_date": order_date,
			  "due_date": due_date,
			  "whs_num": whs_num,
			  "emp_num": emp_num,
			  "dto": data
			};
		
		// AJAX를 이용하여 컨트롤러로 전송하기
		 $.ajax({
			  type: "POST",
			  url: "${pageContext.request.contextPath}/wms/placeorder/insertOrderPro",
			  contentType: "application/json",
			  data: JSON.stringify(orderData),
			  traditional : true,
			  success: function (data) {
			      alert("발주에 성공하였습니다.");

			      /* var style = document.createElement('style');
			      style.innerHTML = '@media print { body { margin: 0; padding: 0; width: auto; height: auto;} @page { size: landscape; margin: 0; } }';
			      document.head.appendChild(style);

			      window.print();  */
			      
			      document.OFsearch.submit();
			      window.location.href = "${pageContext.request.contextPath}/wms/placeorder/insertOrder";
			      
			  },
			  error: function (xhr, status, error) {
				  alert("발주에 실패했습니다.");
			  },
			}); 
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
<script type="text/javascript">
/* 행 삭제 */
function delete_column(button) {
	var row = button.parentNode.parentNode;
	row.parentNode.removeChild(row);
}

/* 행 추가 */
var columnCounter = 1; // 카운터 변수 초기화
function add_column() {
	var table = document.getElementById("dynamicTable");
	var rowCount = table.rows.length; // 현재 행 수 확인
	
	 if (rowCount < 11) { // 최대 9개의 행까지만 추가 가능하도록 설정
    	var table = document.getElementById("dynamicTable");
    	var row = table.insertRow();
    	var cells = [];
    	for (var i = 0; i < 10; i++) {
      		cells[i] = row.insertCell();
   		 }
    
    	var suffix = "_" + (columnCounter + 1); // 카운터 변수를 이용하여 접미사 생성
    	cells[0].innerHTML = '<input type="text" name="item_num" id="item_num' + suffix + '" onclick="findProducts(this)">';
    	cells[1].innerHTML = '<input type="text" name="item_name" id="item_name' + suffix + '" readonly onfocus="this.blur();" onclick="findProducts(this)">';
    	cells[2].innerHTML = '<input type="text" name="supplier" id="supplier' + suffix + '" readonly onfocus="this.blur();">';
    	cells[3].innerHTML = '<input type="text" name="weight" id="weight' + suffix + '" readonly onfocus="this.blur();">';
    	cells[4].innerHTML = '<input type="text" name="stk_qnt" id="stk_qnt' + suffix + '" readonly onfocus="this.blur();">';
    	cells[5].innerHTML = '<input type="text" name="order_qty" id="order_qty' + suffix + '" onKeyup="this.value=this.value.replace(/[^0-9]/g,\'\');">';
    	cells[6].innerHTML = '<input type="text" name="supply_price" id="supply_price' + suffix + '" readonly onfocus="this.blur();">';
    	cells[7].innerHTML = '<input type="text" name="order_sum" id="order_sum' + suffix + '" readonly onfocus="this.blur();">';
    	cells[8].innerHTML = '<input type="text" name="order_vat" id="order_vat' + suffix + '" readonly onfocus="this.blur();">';
    	cells[9].innerHTML = '<button type="button" name="del_column" id="IconButton6' + suffix + '" onclick="delete_column(this)" class="btn btn-primary" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px; background-color: #D3D5EE; border: none; padding: 5px; margin: 2px; width: 70px; border-radius: 13px; color: white; background-color: #bec1eb !important;"">행 삭제</button>';
    
   		columnCounter++; // 카운터 변수 증가
    
 		// 생성된 td 안에 있는 input 요소에 스타일 적용
    	cells[2].style.backgroundColor = "#dee2e6";
   	 	cells[3].style.backgroundColor = "#dee2e6";
   	 	cells[4].style.backgroundColor = "#dee2e6";
    	cells[6].style.backgroundColor = "#dee2e6";
    	cells[7].style.backgroundColor = "#dee2e6";
    	cells[8].style.backgroundColor = "#dee2e6";
    	var btn = document.getElementById('IconButton6' + suffix);
    	btn.style.paddingTop = "3px";
    	btn.style.paddingBottom = "3px";
    	btn.addEventListener('mouseover', function() {
    		this.style.backgroundColor = '#4B49AC';
  	   });
    	btn.addEventListener('mouseout', function() {
    		this.style.backgroundColor = '#bec1eb';
 	   });
	}else{
		alert('최대 10개의 상품까지만 발주할 수 있습니다.');
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
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
</body>
</html>