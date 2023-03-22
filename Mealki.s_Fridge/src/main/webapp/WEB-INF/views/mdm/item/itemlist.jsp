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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vert	ical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mdm/item.css">	

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
                  <h3 class="font-weight-bold">품목리스트</h3>
                  <h6 class="font-weight-normal mb-0">메뉴 <span class="text-primary">강조쓰</span></h6>
                </div>
                
          <div class="contentbody" > 
<!--  본문 내용 시작 -->
<style>

#table_content {
  overflow-x: auto;
}
</style>

<!-- 		품목검색버튼, 항목선택 -->
            <div id="table_search">

            	<form action="${pageContext.request.contextPath}/mdm/item/serchItem" name="searchCustomer" method="post" >
	            	<select name="search_option">
	            		<option value="item_name"> 품목명 </option>
	            		<option value="item_num"> 품목코드 </option>
	            	</select>
	            <input type="text" name="search" class="search" >
	            <input type="image" name="button" class="search-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25">

            	</form>
            </div>
            
<!-- 		상품추가 및 상품저장 버튼 -->
			<div id="item_buttons">
  				<button type="button" id="addItemButton">품목추가</button>
  				<button type="button" id="saveItemButton">품목저장</button>
			</div>
            
<!--        품목리스트 -->
			<div id="table_content">
			 <form action="${pageContext.request.contextPath}/mdm/item/uploadImage" method="post" enctype="multipart/form-data">          
				<table border="1" id="itemTable" >
					<tr><td><input type="checkbox" name="itemCheckAll" value="${ItemDTO.item_num}" id="checkAll"></td>
				 	<td>품목 코드</td>
            	 	<td>품목 유형</td>
           		 	<td>품목명</td>
 		    	 	<td>중량(g)</td>
           	 	 	<td>납입처</td>
           		 	<td>납입 단가(원)</td>
           		 	<td>출고 단가(원)</td>
           		 	<td>이미지</td></tr>
				
				<c:forEach var="ItemDTO" items="${itemlist }">
				
					<tr><td><input type="checkbox" name="selectItem" value="${ItemDTO.item_num}"></td>
					    <td>${ItemDTO.item_num}</td>
					    <td>${ItemDTO.item_type}</td>
					    <td>${ItemDTO.item_name}</td>
					    <td>${ItemDTO.weight}</td>
					    <td>${ItemDTO.supplier}</td>
					    <td>${ItemDTO.supply_price}</td>
					    <td>${ItemDTO.sales_price}</td>
					    <td>${ItemDTO.item_image}</td></tr>
				    
				</c:forEach>
				
				</table>
				</form>
			</div>
				
			<div>

			</div>

<!-- 			체크박스 all선택 -->
		<script>
			document.addEventListener("DOMContentLoaded", function() {
  			let checkAll = document.querySelector("#checkAll");
  			let checkboxes = document.querySelectorAll("input[name='selectItem']");

  			checkAll.addEventListener("change", function() {
   			 for (let checkbox of checkboxes) {
  		 	   checkbox.checked = checkAll.checked;
  			  }
 			 });
			});
		
			// 상품추가 버튼 이벤트
			document.getElementById("addItemButton").addEventListener("click", function() {
			  let itemTable = document.getElementById("itemTable");
			  let newRow = itemTable.insertRow(-1);

			  newRow.innerHTML = `
			    <td><input type="checkbox" name="selectItem"></td>
			    <td>
		        <select name="item_prefix">
		          <option value="P">P</option>
		          <option value="I">I</option>
		        </select>
			    <input type="text" name="item_num" placeholder="품목 코드"></td>
			    </td>
			    <td>
			      <select name="item_type">
			        <option value="냉동완제품">냉동완제품</option>
			        <option value="냉장완제품">냉장완제품</option>
			        <option value="냉동식자재">냉동식자재</option>
			        <option value="냉장식자재">냉장식자재</option>
			      </select>
			    </td>
			    <td><input type="text" name="item_name" placeholder="품목명"></td>
			    <td><input type="text" name="weight" placeholder="중량(g)"></td>
			    <td><input type="text" name="supplier" placeholder="납입처"></td>
			    <td><input type="text" name="supply_price" placeholder="납입 단가(원)"></td>
			    <td><input type="text" name="sales_price" placeholder="출고 단가(원)"></td>
			    <td><input type="file" name="item_image" accept="image/*" onchange="previewImage(this)" placeholder="이미지"></td>`;

			    let selectItemPrefix = newRow.querySelector("select[name='item_prefix']");
			    let inputItemNum = newRow.querySelector("input[name='item_num']");

			    selectItemPrefix.addEventListener("change", function() {
			      let prefix = selectItemPrefix.value;
			      let itemNum = "";

			      if (prefix === "P") {
			        itemNum = "P001";
			      } else if (prefix === "I") {
			        itemNum = "I001";
			      }

			      inputItemNum.value = itemNum;
			    });
			});
			
			

			// 상품저장 버튼 이벤트
			  document.getElementById("saveItemButton").addEventListener("click", function() {
			  let form = document.querySelector("form");
			  form.submit();
			});
			
			// 상품저장 
			
			// 이미지 미리보기 기능
			  function previewImage(input) {
				  if (input.files && input.files[0]) {
				    let reader = new FileReader();

				    reader.onload = function (e) {
				      let imgPreview = document.createElement("img");
				      imgPreview.src = e.target.result;
				      imgPreview.width = 100; // 이미지 미리보기 크기 조절
				      imgPreview.height = 100;
				      
				      let td = input.parentNode;
				      td.innerHTML = "";
				      td.appendChild(imgPreview);
				      td.appendChild(input);
				    };

				    reader.readAsDataURL(input.files[0]);
				  }
				}
			
 		</script>
 
 <!--  본문내용 끝 -->    
        
          </div>
<!-- 페이징하실거면 여기서 시작 -->
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/mdm/item/itemlist?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/mdm/item/itemlist?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/mdm/item/itemlist?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
</c:if>


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