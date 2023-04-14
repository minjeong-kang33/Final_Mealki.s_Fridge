<%@page import="java.util.ArrayList"%>
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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mps/workorder.css">
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                  <h3 class="font-weight-bold">작업지시관리</h3>
                  <h6 class="font-weight-normal mb-0"><span class="text-primary"></span></h6>
                </div>
                
          <div class="contentbody" style="background:;"> 
          
<!--  본문 내용 시작 -->

		
		
		<!-- 검색 -->
		<h4> | 작업지시서 검색 </h4><br>
		<div id="table_search">
			<table>
				<form action="${pageContext.request.contextPath}/mps/workorder/list" method="get">
  					<tr>
    					<td>
    					<span>작업지시번호<input type="text" value="${param.wo_num}" name="wo_num"  style="margin-left: 25px; width:200px;" class="input_box" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력"></span>
						<span style="margin-left: 10px;">작업지시일<input type="date" value="${param.order_date}" name="order_date" style="margin-left: 25px;"> ~ <input type="date" value="${param.dorder_date}" name="dorder_date"></span>
						</td>
   						<td rowspan="2"> 
   						<button class="btn btn-primary" type="submit" id="IconButton6" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;"><a>조회</a></button>
   						</td>
  					</tr>
  					<tr>
    					<td>
    					<span style="margin-left: 10px;">수주번호<input type="text" value="${param.business_num}" name="business_num" style="margin-left: 47px; width:200px; " class="input_box" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력"></span>
						<span style="margin-left: 10px;">납품예정일<input type="date" value="${param.out_date}" name="out_date" style="margin-left: 25px;"> ~ <input type="date" value="${param.dout_date}" name="dout_date"></span>
						</td>
  					</tr>
  				</form>
			</table>
		</div>
		<h4> | 작업지시현황 </h4>
				<!-- 작업지시등록버튼 -->
				
				
				
				<c:choose>
				    <c:when test="${sessionScope.dept_num == 300 || sessionScope.dept_num == 600}">
				        <a href=# onclick="return ContractList();" class="btn btn-primary" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;">
						작업지시서 등록
						</a> 
				    </c:when>
				    <c:otherwise>
				    	<a href=# onclick="alert('권한이 없습니다.')" class="btn btn-primary" style="margin-left: 20px; padding-top: 8px; padding-bottom: 8px;">
						작업지시서 등록
						</a>
				    </c:otherwise>
				</c:choose>
				
				<div class="tab">
				    <ul class="tabnav">
				      <li><a href="#tab01">전체</a></li>
				      <li><a href="#tab02">대기</a></li>
				      <li><a href="#tab03">진행중</a></li>
				      <li><a href="#tab04">완료</a></li>
				    </ul>
				    
				    <div class="tabcontent">
				      <div id="tab01">
				      	<table border="1" id="orderlist_table">
						<tr>
							<th>작업지시번호</th>
							<th>수주번호</th>
							<th>작업지시자</th>
							<th>작업지시일자</th>
							<th>납품예정일</th>
							<th>라인명</th>
							<th>품목명</th>
							<th>지시수량</th>
							<th>생산수량</th>
							<th>작업상태</th>
						</tr>
						<c:forEach var="WorkorderDTO" items="${workorderList}">
								<tr onClick="WoUpdate('${WorkorderDTO.wo_num}');">
									<td>${WorkorderDTO.wo_num}</td>
									<td>${WorkorderDTO.business_num}</td>
									<td>${WorkorderDTO.wo_empname}</td>
									<td>${WorkorderDTO.wo_date}</td>
									<td>${WorkorderDTO.out_date}</td>
									<td>${WorkorderDTO.manu_name}</td>
									<td>${WorkorderDTO.item_name}</td>
									<td>${WorkorderDTO.wo_qty}</td>
									<td>${WorkorderDTO.pr_sum}</td>
							        <td>
										<c:if test="${WorkorderDTO.wo_state == '대기'}">
											<div class="btn btn-secondary btn-rounded" id="IconButton6" style="padding-left:8px;  padding-right:8px; padding-top: 6px; padding-bottom: 6px;">대기</div>
										</c:if>
										<c:if test="${WorkorderDTO.wo_state == '진행중'}">
											<div class="btn btn-danger btn-rounded" id="IconButton6" style="padding-left:8px;  padding-right:8px; padding-top: 6px; padding-bottom: 6px;">진행중</div>
										</c:if>
										<c:if test="${WorkorderDTO.wo_state == '완료'}">
											<div class="btn btn-success btn-rounded" id="IconButton6" style="padding-left:8px;  padding-right:8px; padding-top: 6px; padding-bottom: 6px;">완료</div>
										</c:if>
									</td>
								</tr>
						</c:forEach>
					
					</table>
					<!-- 탭 페이징처리 -->
					<div style="text-align: center;">
						<c:if test="${pageDTO.startPage>pageDTO.pageBlock} ">
							<a href="${pageContext.request.contextPath}/mps/workorder/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">◀</a>
						</c:if>
					
						<c:forEach var="i" begin="${pageDTO.startPage}"
							end="${pageDTO.endPage}" step="1">
							<a href="${pageContext.request.contextPath}/mps/workorder/list?pageNum=${i}&wo_num=${pageDTO.wo_num}&order_date=${pageDTO.order_date}&dorder_date=${pageDTO.dorder_date}&business_num=${pageDTO.business_num}&out_date=${pageDTO.out_date}&dout_date=${pageDTO.dout_date}">${i}</a>
						</c:forEach>
					
						<c:if test="${pageDTO.startPage>pageDTO.pageBlock} ">
							<a href="${pageContext.request.contextPath}/mps/workorder/list?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">▶</a>
						</c:if>
					</div>
				      </div>
				     
				      <div id="tab02">
				      	<jsp:include page="workordertable2.jsp" >
				      	<jsp:param value="대기" name="state"/>
				      	</jsp:include>
				      </div>
				      
				      <div id="tab03">
				      	<jsp:include page="workordertable.jsp" >
				      	<jsp:param value="진행중" name="state"/>
				      	</jsp:include>
				      </div>
				      
				      <div id="tab04">
				      	<jsp:include page="workordertable.jsp" >
				      	<jsp:param value="완료" name="state"/>
				      	</jsp:include>
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
        
        			<div id="myModal" class="modal">
					  <div class="modal-content">
					    <div class="modal-body">
					      <p></p>
					    </div>
					  </div>
					</div>
						
					<script type="text/javascript">
						function WoUpdate(wo_num) {
							 var url = "${pageContext.request.contextPath}/workorder/WoUpdate?wo_num="+wo_num
							    $.ajax({
							      type: "GET",
							      url: url,
							      success: function(data) {
							    	  console.log("작업지시서 모달창 Ajax");
							        // 불러온 JSP 파일의 내용을 모달 창에 삽입
							        $("#myModal .modal-body").html(data);
							        $('#myModal').modal('show');
							        console.log("show");
							      }
							    });
						};


						function closeModal() {
						    var modal = document.getElementById("myModal");
						    modal.style.display = "none";
						}

							// 모달창 외부를 클릭하면 모달창이 닫히도록 설정
							window.onclick = function (event) {
							  var modal = document.getElementById("myModal");
							  if (event.target == modal) {
							    closeModal();
							  }
							};
							
 					</script>


        			 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js">
					 </script>
       				 <script type="text/javascript">
		       				  const orderDateInput = document.querySelector('input[name="order_date"]');
			       			  const dorderDateInput = document.querySelector('input[name="dorder_date"]');
			       			  const outDateInput = document.getElementsByName('out_date')[0];
			       		      const doutDateInput = document.getElementsByName('dout_date')[0];
			       		  
				       		  outDateInput.addEventListener('change', () => {
				       		    doutDateInput.min = outDateInput.value;
				       		  });
			       			  orderDateInput.addEventListener('change', () => {
			       			    dorderDateInput.min = orderDateInput.value;
			       			  });
			       			  
			       			  
			       			  
						function ContractList() {
							var _width = '630';
							var _height = '350';
							var _left = Math.ceil((window.screen.width - _width) / 2);
							var _top = Math.ceil((window.screen.height - _height) / 2);
							let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
							window.name = "wo_insert";
							window.open(
							"${pageContext.request.contextPath}/workorder/ContractList",
							"작업지시등록",popOption);}
				
						$(function() {
							  $('.tabcontent > div').hide();
							  $('.tabnav a').click(function() {
							    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
							    $('.tabnav a').removeClass('active');
							    $(this).addClass('active');
							    return false;
							  }).filter(':eq(0)').click();

							  if (window.location.hash === '#tab02') {
							    $('ul.tabnav li:nth-child(2) a').click();
							    window.scrollTo(0, 0);
							  }
							});
  					</script>
  					
	
<!-- 이 밑으로 무언가 쓰지 마세요 페이징도 이 위에서 처리되야함. 그렇다면 여기를 스크립트자리로 쓰겠습니다 -->
					
        
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>