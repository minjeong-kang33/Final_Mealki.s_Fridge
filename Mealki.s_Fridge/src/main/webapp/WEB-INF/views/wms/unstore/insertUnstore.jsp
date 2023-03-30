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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/empManagment.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/wms/insertUnStore.css">
 
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>

<script type="text/javascript">  
//탭 관련 
	
	  $(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	  });
	  


//재고확인
$(document).ready(function() {
  $.ajax({
    url: "/stockCheck",
    data:{'wo_num':$('.wo_num')},
    method: "GET",
    success: function(result) {
      
    if(result){
    	result="재고부족";
		$('.divresult').html(result).css("color","red");
    }else {
    	result="출고가능";
		$('.divresult').html(result).css("color","blue");
    }

    }
 
  });
});


//submit
	$(function(){
	$(".unstore_submit_button").click(function(){ 
	
		var str = "";
		var tdArr = new Array();	// 배열 선언
		var unstore_submit_button = $(this);
		
		var tr = unstore_submit_button.parent().parent();
		var td = tr.children();
		
		td.each(function(i) {
			  var text = td.eq(i).text().trim(); // i번째 td의 텍스트를 가져와 공백 제거
			  if (text !== "" && text !== null) { // 텍스트가 빈 값이나 null이 아니면 배열에 추가
				  var selectValue = $(this).find('select').val();
				  tdArr.push(selectValue || text);
			  }
			});
		
		console.log("배열에 담긴 값1 : "+tdArr);
		//WO2303290813,풀무원,야끼소바,200,재고확인,2023-03-29,2023-03-03,미출고,323031501
		
	
		var wo_num = tdArr[0]; //작업지시번호
		var business_name = tdArr[1]; //납품처명
		var item_name = tdArr[2]; // 품명
		var wo_qty = tdArr[3]; //주문수량
	//	var sto_progress = tdArr[4]; //재고확인상태
		var wo_date = tdArr[5]; //작업지시일자
		var out_date = tdArr[6]; //납기일자
	//	var unsto_progress = tdArr[7]; //진행현황
		var emp_num =tdArr[8]; //출고담당자번호
		var item_num =tdArr[9]; //품목번호
	
		console.log("배열에 담긴 값2 : "+tdArr);
		//배열에 담긴 값2 : WO2303290813,풀무원,야끼소바,200,재고확인,2023-03-29,2023-03-03,미출고,323031501,P001
		alert(tdArr);

		$.ajax({
				url:'addUntore',
				type :'GET',
				data:{wo_num:wo_num,business_name:business_name,item_name:item_name,wo_qty:wo_qty,wo_date:wo_date,out_date:out_date,emp_num:emp_num,item_num:item_num},
				success:function(result){
				
				alert("발주번호 "+wo_num +"번이 출고처리 되었습니다.");
				location.reload();
				},
			}); 
		
		
	});	
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
                  <h3 class="font-weight-bold">출고관리</h3>
                  <h6 class="font-weight-normal mb-0">메뉴설명쓰 <span class="text-primary">강조쓰</span></h6>
                </div>
                
          <div class="contentbody"> 
          
<!--  본문 내용 시작 -->
					<div id="search_div" >
		               <div id="table_search" >
		               <div id="search_select_div">
		                     <form name="search" method="post">
		                       <span id="store_date"> 출고일자 <input type="date" id="startDate" name="startDate">  ~ <input type="date" id="endDate" name="endDate"></span>
		                       <span id="emp_num_search">담당자<input class="input-search" type="text" name="emp_num" id="findEmp_num" value="${sessionScope.emp_num }" onclick="findEmployee()"></span>
		                       <span id="products_search"> 품명 <input type="text" name="item_name" id="item_name" onclick="findProduct()" ></span>
		                    <!-- <select name="search_option" class="search_option">
		                           <option value=""> 선택하세요 </option>
		                           <option value="emp_Kname"> 이름 </option>
		                       </select>
		                        <span id="text_search"><input class="input-search" type="text" name="keyword"></span>
			                    <s pan id="icon_search"><input type="image" name="button" class="search-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25"></span>
			                  	 <span id="checkbox_search"><input type="checkbox" name="check" name="search_check"> 퇴사자 포함</span>--> 
		                     </form>
		               </div>
		              
		             </div>
		            </div>

           <div class="tab">
	       	<ul class="tabnav">
	         <li><a href="#tab01">미출고</a></li>
	         <li><a href="#tab02">출고완료</a></li>
	         <li><a href="#tab03">전체</a></li>
	        </ul>
	        <div class="tabcontent" >
		        <div id="tab01" width: 100%;"> <!-- tab 1내용 -->
		        
				        <div class="store_total_div" style="width: 100%;">
				        <form name="store_form" method="get">
					        <table border="1" class="unstore_total_table" style="width: 100%;">
								</th><th>출고관리번호</th><th>작업지시번호</th><th>상세</th>
									 <th>납품처명</th><th>품명</th><th>주문수량</th>
									 <th>재고확인</th><th>작업지시일자</th><th>납기일자</th>
									 <th>진행현황</th><th>담당자</th><th>출고일자</th><th>출고처리</th></tr>
								<c:forEach var="unstoreDTO" items="${unstoreListUnreleased }">
								<tr>	 
									<td>${unstoreDTO.unsto_num }</td> <!-- 출고관리번호 -->
									<td class="wo_num">${unstoreDTO.wo_num }</td> <!-- 작업지시번호 -->
									<td><input type="button"></td> <!-- 상세 -->
									<td>${unstoreDTO.business_name }</td><!-- 납품처명 -->
									<td>${unstoreDTO.item_name }</td><!-- 품명 -->
									<td>${unstoreDTO.wo_qty }</td><!-- 주문수량 -->
									<td class="divresult">재고확인</td> <!-- 재고확인결과 -->
									<td>${unstoreDTO.wo_date } </td><!-- 작업지시일자 -->
									<td>${unstoreDTO.out_date }</td><!-- 납기일자 -->
									<td>${unstoreDTO.unsto_progress }</td><!-- 진행현황 -->
									<td>${unstoreDTO.emp_num }</td><!-- 담당자 -->
									<td style="display: none;">${sessionScope.emp_num }</td><!-- 담당자 -->
									<td style="display: none;">${unstoreDTO.item_num }</td> 
									<td>${unstoreDTO.unsto_date }</td> <!-- 출고일자 -->
									<td><input type="button" value="출고처리" class="unstore_submit_button"></td><!--출고처리 -->
								</tr>
								</c:forEach>
									 
					        </table>
					      </form>  
	<!-- 페이징 -->
	
	<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
	<a href="${pageContext.request.contextPath}/wms/store/insertStore?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지 이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath}/wms/store/insertStore?pageNum=${i}">${i}</a> 
	</c:forEach>
	
	<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
	<a href="${pageContext.request.contextPath}/wms/store/insertStore?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지 다음]</a>
	</c:if>
					        
			       		 </div>
		        </div>
		       	<div id="tab02">
		       	
		       	
		       	 <table border="1" class="unstore_total_table" style="width: 100%;">
								</th><th>출고관리번호</th><th>작업지시번호</th><th>상세</th>
									 <th>납품처명</th><th>품명</th><th>주문수량</th>
									 <th>재고확인</th><th>작업지시일자</th><th>납기일자</th>
									 <th>진행현황</th><th>담당자</th><th>출고일자</th><th>출고처리</th></tr>
								<c:forEach var="unstoreDTO" items="${unstoreListSuccess }">
								<tr>	 
									<td>${unstoreDTO.unsto_num }</td> <!-- 출고관리번호 -->
									<td class="wo_num">${unstoreDTO.wo_num }</td> <!-- 작업지시번호 -->
									<td><input type="button"></td> <!-- 상세 -->
									<td>${unstoreDTO.business_name }</td><!-- 납품처명 -->
									<td>${unstoreDTO.item_name }</td><!-- 품명 -->
									<td>${unstoreDTO.wo_qty }</td><!-- 주문수량 -->
									<td class="divresult">재고확인</td> <!-- 재고확인결과 -->
									<td>${unstoreDTO.wo_date } </td><!-- 작업지시일자 -->
									<td>${unstoreDTO.out_date }</td><!-- 납기일자 -->
									<td>${unstoreDTO.unsto_progress }</td><!-- 진행현황 -->
									<td>${unstoreDTO.emp_num }</td><!-- 담당자 -->
									<td style="display: none;">${sessionScope.emp_num }</td><!-- 담당자 -->
									<td style="display: none;">${unstoreDTO.item_num }</td> 
									<td>${unstoreDTO.unsto_date }</td> <!-- 출고일자 -->
									<td><input type="button" value="출고처리" class="unstore_submit_button"></td><!--출고처리 -->
								</tr>
								</c:forEach>
									 
					        </table>
		       	
		       	
		       	
		       	</div>
		       	
		       	<div id="tab03">
		       		<form name="store_form" method="get">
					        <table border="1" class="unstore_total_table" style="width: 100%;">
								</th><th>출고관리번호</th><th>작업지시번호</th><th>상세</th>
									 <th>납품처명</th><th>품명</th><th>주문수량</th>
									 <th>재고확인</th><th>작업지시일자</th><th>납기일자</th>
									 <th>진행현황</th><th>담당자</th><th>출고일자</th><th>출고처리</th></tr>
								<c:forEach var="unstoreDTO" items="${unstoreList }">
								<tr>	 
									<td>${unstoreDTO.unsto_num }</td> <!-- 출고관리번호 -->
									<td class="wo_num">${unstoreDTO.wo_num }</td> <!-- 작업지시번호 -->
									<td><input type="button"></td> <!-- 상세 -->
									<td>${unstoreDTO.business_name }</td><!-- 납품처명 -->
									<td>${unstoreDTO.item_name }</td><!-- 품명 -->
									<td>${unstoreDTO.wo_qty }</td><!-- 주문수량 -->
									<td class="divresult">
										<c:if test="${unstoreDTO.unsto_progress eq '미출고' }">
											재고확인
										</c:if>	
									</td> <!-- 재고확인결과 -->
									<td>${unstoreDTO.wo_date } </td><!-- 작업지시일자 -->
									<td>${unstoreDTO.out_date }</td><!-- 납기일자 -->
									<td>${unstoreDTO.unsto_progress }</td><!-- 진행현황 -->
									<td>${unstoreDTO.emp_num }</td><!-- 담당자 -->
									<td style="display: none;">${sessionScope.emp_num }</td><!-- 담당자 -->
									<td style="display: none;">${unstoreDTO.item_num }</td> 
									<td>${unstoreDTO.unsto_date }</td> <!-- 출고일자 -->
									<td>
										<c:if test="${unstoreDTO.unsto_progress eq '미출고' }">
											<input type="button" value="출고처리" class="unstore_submit_button">
										</c:if>	
									</td><!--출고처리 -->
									
								</tr>
								</c:forEach>
									 
					        </table>
					      </form>  
		       	
		       	
		       	
		       	</div>
	       </div>
            </div>
            
 <!--  본문내용 끝 -->    
        
          </div>
<!-- 페이징하실거면 여기서 시작 -->
     페이징
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


  <script>
  <!--  입고날짜 시작일 기본값 오늘 날짜로  -->
	document.getElementById('startDate').valueAsDate = new Date();

  <!--  입고날짜 종료일 기본값 일주일 뒤로  -->
	var today = new Date();
	var Oneweek = new Date(today.setDate(today.getDate() + 6));
	document.getElementById('endDate').valueAsDate = Oneweek;


  </script>

<script type="text/javascript">
/* 담당자 찾기 (팝업 방법1)*/
 var openWin;

 function findEmployee()
 {
  window.name = "parentForm";
  openWin = window.open("${pageContext.request.contextPath}/wms/placeorder/findEmp_num",
           "childForm", "width=650, height=600,top=300, left=300, resizable = no, scrollbars = no");    
 }

 /* 상품찾기 */    
 var openWin;

 function findProduct()
 {
  window.name = "parentForm";
  openWin = window.open("${pageContext.request.contextPath}/wms/store/findProduct",
           "childForm", "width=650, height=600,top=300, left=300, resizable = no, scrollbars = no");    
 }
 
 </script>

</body>
</html>