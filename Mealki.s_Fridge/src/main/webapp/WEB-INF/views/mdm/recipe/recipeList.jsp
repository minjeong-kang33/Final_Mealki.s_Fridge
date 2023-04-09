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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon.png" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/maincss/css/blank.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mdm/recipeList.css">	

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
                  <h3 class="font-weight-bold">소요량리스트</h3>
                  <h6 class="font-weight-normal mb-0"> <span class="text-primary"></span></h6>
                </div>
                
          <div class="contentbody" > 
<!--  본문 내용 시작 -->

<!-- 		레시피검색버튼, 항목선택 -->
            <div id="table_search">

            	<form name="search" action="${pageContext.request.contextPath}/mdm/recipe/recipeList" method="get" onsubmit="return fun1()" >
	            	<select name="search_option">
	            		<option value="r_name"> 레시피이름 </option>
	            		<option value="r_code"> 레시피코드 </option>
	            	</select>
	            <input type="text" name="search" class="input-search" >
	            <input type="image"  class="itemsearch-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="27">

            	</form>
            </div>
            
<!-- 		레시피추가 및 레시피저장 버튼 -->
			<div id="item_buttons">
    <c:choose>
        <c:when test="${sessionScope.dept_num == 100}">
          	    <button class="btn btn-primary" type="button" id="addRecipeButton">추가</button>
                <button class="btn btn-primary" type="button" id="updateRecipeButton">수정</button>
  				<button class="btn btn-primary" type="button" id="saveRecipeButton">레시피저장</button>
                <button class="btn btn-primary" type="button" id="deleteRecipeButton">삭제</button>
        </c:when>
        <c:otherwise>
            <!-- 권한이 없는 경우 버튼x -->
        </c:otherwise>
    </c:choose>
</div>
            
<!--        레시피리스트 -->
			<div id="table_content">
			 <form id="tableForm" action="${pageContext.request.contextPath}/mdm/recipe/save" method="post" enctype="multipart/form-data">
				<table border="1" id="itemTable" style="width: 93%;" >
					<tr><th><input type="checkbox" name="itemCheckAll" value="${RecipeDTO.r_num}" id="checkAll"></th>
				 	<th>레시피번호</th>
            	 	<th>레시피코드</th>
 		    	 	<th>레시피이름</th>
           		 	<th>품목코드</th>
           	 	 	<th>식자재이름</th>
           		 	<th>소요량(g)</th>
           		 	<th>등록일</th>
           		 	<th>비고</th></tr>
				
				<c:forEach var="RecipeDTO" items="${recipeList }">
				
					<tr><td><input type="checkbox" name="selectItem" value="${RecipeDTO.r_num}"></td>
					    <td>${RecipeDTO.r_num}</td>
					    <td>${RecipeDTO.r_code}</td>
					    <td>${RecipeDTO.r_name}</td>
					    <td>${RecipeDTO.item_num}</td>
					    <td>${RecipeDTO.item_name}</td>
					    <td>${RecipeDTO.r_qty}</td>
					    <td><fmt:formatDate value="${RecipeDTO.r_date}" pattern="yyyy.MM.dd"/></td>
					    <td>${RecipeDTO.r_etc}</td></tr>
				    
				</c:forEach>
				
				</table>
				</form>
			</div>
				
			<div>

			</div>


<!--           </div> -->
<!-- 페이징하실거면 여기서 시작 -->
<div id="paging">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/mdm/recipe/recipeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/mdm/recipe/recipeList?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/mdm/recipe/recipeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
</c:if>
</div>

*품목코드는 식자재코드입니다. 
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

  
<!-- 	검색어 제어 -->
function fun1() {
  var searchInput = document.forms["search"]["search"].value;
  if (searchInput == "") {
    alert("검색어를 입력하세요");
    return false;
  }
  return true;
}
 
 
  <!-- 			체크박스 all선택 -->
    document.addEventListener("DOMContentLoaded", function() {
      let checkAll = document.querySelector("#checkAll");
      let checkboxes = document.querySelectorAll("input[name='selectItem']");

      checkAll.addEventListener("change", function() {
        for (let checkbox of checkboxes) {
          checkbox.checked = checkAll.checked;
        }
      });
    });
    
    //팝업창에서 전달받은 정보 -> 입력란 업데이트하는 함수추가
    function updateItemInfo(itemNum, itemName) {
    	  let focusedInput = document.activeElement;
    	  if (focusedInput && focusedInput.name === 'item_num') {
    	    focusedInput.value = itemNum;
    	    focusedInput.parentNode.nextElementSibling.querySelector("input[name='item_name']").value = itemName;
    	  }
    	}
    
    
    // 레시피추가 버튼 이벤트
    document.getElementById("addRecipeButton").addEventListener("click", function() {
      let itemTable = document.getElementById("itemTable");
      let newRow = itemTable.insertRow(-1);

      newRow.innerHTML = `
			    <td><input type="checkbox" name="selectItem"></td>
			    <td><input type="text" name="r_num" placeholder="레시피번호" readonly></td>
			    <td><input type="text" name="r_code" placeholder="레시피코드"></td>
			    <td><input type="text" name="r_name" placeholder="레시피이름"></td>
			    <td><input type="text" name="item_num" placeholder="품목코드" readonly ></td>
			    <td><input type="text" name="item_name" placeholder="식자재이름" readonly ></td>
			    <td><input type="text" name="r_qty" placeholder="소요량(g)"></td>
			    <td><input type="text" name="r_date" placeholder="등록일" readonly></td>
			    <td><input type="text" name="r_etc" placeholder="비고"></td>`;
			    
			    let currentDate = new Date();

			    // 날짜를 "yyyy.MM.dd" 형식의 문자열로 변환
			    let formattedDate = currentDate.getFullYear() + "." + ("0" + (currentDate.getMonth() + 1)).slice(-2) + "." + ("0" + currentDate.getDate()).slice(-2);

			    // "등록일" 입력란에 현재날짜 미리넣기
			    newRow.querySelector("input[name='r_date']").value = formattedDate;

			    
			newRow.querySelector("input[name='item_num']").addEventListener("click", function() {
				let focusedInput = this;
   			window.open("../../mdm/recipe/getItemList", "itemListPopup", "width=300, height=500");
    		this.focus();
			});

		let inputItemNum = newRow.querySelector("input[name='r_num']");

  		// 아이템 번호 생성
  		inputItemNum.addEventListener("focus", function() {
    	let prefix = "A"; 
    	let itemNum = "";


      });
    });

    // 레시피수정 버튼 이벤트
    document.getElementById("updateRecipeButton").addEventListener("click", function() {
      // let itemTable = document.getElementById("itemTable");
      let element = document.getElementById("itemTable").querySelector('tr td input[name="selectItem"]:checked').parentNode.parentNode;


      let recipeNum = element.querySelector('td:nth-child(2)').textContent;
      let r_code = element.querySelector('td:nth-child(3)').textContent;
      let r_name = element.querySelector('td:nth-child(4)').textContent;
      let item_num = element.querySelector('td:nth-child(5)').textContent;
      let item_name = element.querySelector('td:nth-child(6)').textContent;
      let r_qty = element.querySelector('td:nth-child(7)').textContent;
      let r_date = element.querySelector('td:nth-child(8)').textContent;
      let r_etc = element.querySelector('td:nth-child(9)').textContent;


      element.innerHTML = `
    	  <td><input type="checkbox" name="selectItem"></td>
    	  	<td><input type="text" name="r_num" value="\${recipeNum}" placeholder="레시피번호" readonly></td>
		    <td><input type="text" name="r_code" value="\${r_code}" placeholder="레시피코드"></td>
		    <td><input type="text" name="r_name" value="\${r_name}" placeholder="레시피이름"></td>
		    <td><input type="text" name="item_num" value="\${item_num}" placeholder="품목코드"></td>
		    <td><input type="text" name="item_name" value="\${item_name}" placeholder="식자재이름"></td>
		    <td><input type="text" name="r_qty" value="\${r_qty}" placeholder="소요량(g)"></td>
		    <td><input type="text" name="r_date" value="\${r_date}" placeholder="등록일" readonly></td>
		    <td><input type="text" name="r_etc" value="\${r_etc}" placeholder="비고"></td>`;

      let selectItemPrefix = element.querySelector("select[name='item_prefix']");
      let inputRecipeNum = element.querySelector("input[name='r_num']");

      selectItemPrefix.addEventListener("change", function() {
        let prefix = selectItemPrefix.value;
        let recipeNum = "";

       

        inputRecipeNum.value = recipeNum;
      });
    });

    // 삭제 버튼 추가
    
    document.getElementById("deleteRecipeButton").addEventListener("click", function() {
      if(confirm("삭제하시겠습니까?")){
        let elements = document.getElementById("tableForm").querySelectorAll('input[name="selectItem"]:checked');
        let formData = new FormData();
        for(let i = 0; i< elements.length; i++){
          formData.append("selectId",elements[i].value);
        }

        let request = new XMLHttpRequest();
        request.open("POST","${pageContext.request.contextPath}/mdm/recipe/delete");
        request.send(formData);

        request.onreadystatechange = function() {
            if (request.readyState == 4 && request.status == 200) {
              location.reload();
            }
      };
      }
    })


    // 품목저장 버튼 이벤트
    document.getElementById("saveRecipeButton").addEventListener("click", function() {
      let form = document.getElementById("tableForm");
      form.submit();
    });

    
    </script>
  <!--  본문내용 끝 -->
  
</body>
</html>