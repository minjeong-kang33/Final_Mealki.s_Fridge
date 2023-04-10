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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mdm/itemList.css">	

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
                  <h6 class="font-weight-normal mb-0"> <span class="text-primary"></span></h6>
                </div>
                
          <div class="contentbody" > 
<!--  본문 내용 시작 -->

<!-- 		품목검색버튼, 항목선택 -->
            <div id="table_search">

            	<form name="search" action="${pageContext.request.contextPath}/mdm/item/itemlist" method="get" onsubmit="return fun1()" >
	            	<select name="search_option">
	            		<option value="item_name"> 품목명 </option>
	            		<option value="item_num"> 품목코드 </option>
	            	</select>
	            <input type="text" name="search" class="input-search" >
	            <input type="image"  class="itemsearch-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="27">

            	</form>
            </div>
            
<!-- 		상품추가 및 상품저장 버튼 -->
	<div id="item_buttons">
    <c:choose>
        <c:when test="${sessionScope.dept_num == 100}">
            <button class="btn btn-primary" type="button" id="addItemButton">＋품목추가</button>
            <button class="btn btn-primary" type="button" id="updateItemButton">✎품목수정</button>
            <button class="btn btn-primary" type="button" id="saveItemButton">✓품목저장</button>
            <button class="btn btn-primary" type="button" id="deleteItemButton">✂품목삭제</button>
        </c:when>
        <c:otherwise>
            <!-- 권한이 없는 경우 버튼x -->
        </c:otherwise>
    </c:choose>
</div>
            
<!--        품목리스트 -->
			<div id="table_content">
			 <form id="tableForm" action="${pageContext.request.contextPath}/mdm/item/save" method="post" enctype="multipart/form-data">
				<table border="1" id="itemTable" style="width: 93%;" >
					<tr><th><input type="checkbox" name="itemCheckAll" value="${ItemDTO.item_num}" id="checkAll"></th>
				 	<th>품목 코드</th>
            	 	<th>품목 유형</th>
           		 	<th>품목명</th>
 		    	 	<th>중량(g)</th>
           	 	 	<th>납입처</th>
           		 	<th>납입 단가(원)</th>
           		 	<th>출고 단가(원)</th>
           		 	<th>이미지</th></tr>
				
				<c:forEach var="ItemDTO" items="${itemlist }">
				
					<tr><td><input type="checkbox" name="selectItem" value="${ItemDTO.item_num}"></td>
					    <td>${ItemDTO.item_num}</td>
					    <td>${ItemDTO.item_type}</td>
					    <td>${ItemDTO.item_name}</td>
					    <td>${ItemDTO.weight}</td>
					    <td>${ItemDTO.supplier}</td>
					    <td>${ItemDTO.supply_price}</td>
					    <td>${ItemDTO.sales_price}</td>
					    <td><img src="${pageContext.request.contextPath}/resources/mdm/upload/${(ItemDTO.item_image == null) ? 'default_image.png' : ItemDTO.item_image}" width="70" height="70"></td>

					    </tr>
				    
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
<a href="${pageContext.request.contextPath}/mdm/item/itemlist?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
<a href="${pageContext.request.contextPath}/mdm/item/itemlist?pageNum=${i}">${i}</a> 
</c:forEach>

<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/mdm/item/itemlist?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[다음]</a>
</c:if>
</div>
                <br>* 품목코드의 P는 완제품, I는 식자재입니다.
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
			    <input type="text" name="item_num" placeholder="완제품 : P , 식자재 : I 선택" readonly ></td>
			    </td>
			    <td>
			      <select name="item_type">
			      	<option value="상온완제품">상온완제품</option>
			        <option value="냉장완제품">냉장완제품</option>
			        <option value="냉동완제품">냉동완제품</option>
			        <option value="상온식자재">상온식자재</option>
			        <option value="냉장식자재">냉장식자재</option>
			        <option value="냉동식자재">냉동식자재</option>

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
      let selectItemType = newRow.querySelector("select[name='item_type']");

      // 초기 필터링 상태 설정
      filterItemTypeOptions(selectItemPrefix.value);

      selectItemPrefix.addEventListener("change", function() {
        let prefix = selectItemPrefix.value;
        let itemNum = "";

        filterItemTypeOptions(prefix);
      });

      
      newRow.querySelector("input[name='supply_price']").addEventListener("click", function() {
    	  if (selectItemPrefix.value === 'P') {
    	    alert('완제품(P)은 납입단가 입력이 불가합니다');
    	  }
    	});

    	newRow.querySelector("input[name='sales_price']").addEventListener("click", function() {
    	  if (selectItemPrefix.value === 'I') {
    	    alert('식자재(I)는 출고단가 입력이 불가합니다');
    	  }
    	});
      
      
      
      
      function filterItemTypeOptions(prefix) {
        if (prefix === 'P') {
          selectItemType.innerHTML = `
            <option value="상온완제품">상온완제품</option>
            <option value="냉장완제품">냉장완제품</option>
            <option value="냉동완제품">냉동완제품</option>
          `;
        } else if (prefix === 'I') {
          selectItemType.innerHTML = `
            <option value="상온식자재">상온식자재</option>
            <option value="냉장식자재">냉장식자재</option>
            <option value="냉동식자재">냉동식자재</option>
          `;
        }
      }
    });
    

    // 품목수정 버튼 이벤트
    document.getElementById("updateItemButton").addEventListener("click", function() {
      // let itemTable = document.getElementById("itemTable");
      let element = document.getElementById("itemTable").querySelector('tr td input[name="selectItem"]:checked').parentNode.parentNode;


      let itemNum = element.querySelector('td:nth-child(2)').textContent;
      let itemType = element.querySelector('td:nth-child(3)').textContent;
      let item_name = element.querySelector('td:nth-child(4)').textContent;
      let weight = element.querySelector('td:nth-child(5)').textContent;
      let supplier = element.querySelector('td:nth-child(6)').textContent;
      let supply_price = element.querySelector('td:nth-child(7)').textContent;
      let sales_price = element.querySelector('td:nth-child(8)').textContent;
      let item_image = element.querySelector('td:nth-child(9)').textContent;


      element.innerHTML = `
			    <td><input type="checkbox" name="selectItem"></td>
			    <td>
			    <input type="hidden" name="item_prefix" value="\${itemNum.charAt(0)}">
			    <input type="text" name="item_num" placeholder="품목 코드" value=\${itemNum} readonly></td>
			    </td>
			    <td>
			      <select name="item_type" value=\${itemType}>
			      	<option value="상온완제품">상온완제품</option>
			        <option value="냉장완제품">냉장완제품</option>
			        <option value="냉동완제품">냉동완제품</option>
			        <option value="상온식자재">상온식자재</option>
			        <option value="냉장식자재">냉장식자재</option>
			        <option value="냉동식자재">냉동식자재</option>
			      </select>
			    </td>
			    <td><input type="text" name="item_name" value="\${item_name}" placeholder="품목명"></td>
			    <td><input type="text" name="weight" value="\${weight}" placeholder="중량(g)"></td>
			    <td><input type="text" name="supplier" value="\${supplier}" placeholder="납입처"></td>
			    <td><input type="text" name="supply_price" value="\${supply_price}" placeholder="납입 단가(원)"></td>
			    <td><input type="text" name="sales_price" value="\${sales_price}" placeholder="출고 단가(원)"></td>
			    <td><input type="file" name="item_image" value="\${item_image}" accept="image/*" onchange="previewImage(this)" placeholder="이미지"
			    <input type="hidden" name="oldfile" value"\${item_image}">
			    </td>`;

			    let selectItemType = element.querySelector("select[name='item_type']");
			    filterItemTypeOptions(itemNum.charAt(0), itemType);

			    element.querySelector("input[name='supply_price']").addEventListener("click", function() {
			        if (element.querySelector("input[name='item_prefix']").value === 'P') {
			          alert('완제품(P)은 납입단가 입력이 불가합니다');
			        }
			      });

			      element.querySelector("input[name='sales_price']").addEventListener("click", function() {
			        if (element.querySelector("input[name='item_prefix']").value === 'I') {
			          alert('식자재(I)는 출고단가 입력이 불가합니다');
			        }
			      });
			    
			    function filterItemTypeOptions(prefix, selectedItemType) {
			      let itemTypeOptions = '';

			      if (prefix === 'P') {
			        itemTypeOptions = `
			          <option value="상온완제품">상온완제품</option>
			          <option value="냉장완제품">냉장완제품</option>
			          <option value="냉동완제품">냉동완제품</option>
			        `;
			      } else if (prefix === 'I') {
			        itemTypeOptions = `
			          <option value="상온식자재">상온식자재</option>
			          <option value="냉장식자재">냉장식자재</option>
			          <option value="냉동식자재">냉동식자재</option>
			          `;
			          }
			          selectItemType.innerHTML = itemTypeOptions;
			          selectItemType.value = selectedItemType;
			          }
			          });
//     });

    // 삭제 버튼 추가
    document.getElementById("deleteItemButton").addEventListener("click", function() {
      if(confirm("삭제하시겠습니까?")){
        let elements = document.getElementById("tableForm").querySelectorAll('input[name="selectItem"]:checked');
        let formData = new FormData();
        for(let i = 0; i< elements.length; i++){
          formData.append("selectId",elements[i].value);
        }

        let request = new XMLHttpRequest();
        request.open("POST","${pageContext.request.contextPath}/mdm/item/delete");
        request.send(formData);

        request.onreadystatechange = function() {
            if (request.readyState == 4 && request.status == 200) {
              location.reload();
            }
      };
      }
    })


    // 품목저장 버튼 이벤트
    document.getElementById("saveItemButton").addEventListener("click", function() {
      let form = document.getElementById("tableForm");
      form.submit();
    });

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
  
</body>
</html>