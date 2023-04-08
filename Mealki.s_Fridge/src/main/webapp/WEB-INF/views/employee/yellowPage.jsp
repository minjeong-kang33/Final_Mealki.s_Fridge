
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-16x16.png" />
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/yellowPage.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>

</head>
<body>

<div class="table_body">
	<div id="top_table" >
		<div id="table_search">
			<div id="select_search">
				<form name="search" method="get" action="${pageContext.request.contextPath}/employee/yellowPage" id="selectBox" name="selectBox2" onsubmit="return fun1()">
					<select name="search_option" class="search_option">
						<option value=""> 선택하세요 </option>
				        <option value="emp_Kname"> 이름 </option>
				        <option value="emp_num"> 사번 </option>
				        <option value="emp_tel"> 내선번호 </option>
				        <option value="emp_phone"> 휴대폰번호 </option>
				        <option value="dept_num"> 부서 </option>
		   			</select>

				<div style="float: left; margin-top: 20px;"><span id="text_search"><input class="input-search" type="text" name="keyword" class="input-search"></span></div>
		        <div style="float: left; margin-top: 8px; margin-left: 10px;"><span id="icon_search"><input type="image" name="button" class="search-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25" style="margin-top: 15px;"></span></div> 
			   </form>
			</div>
		</div>
	</div>
	
	<div class="left_table">
	
		<table border="1" style="width: 100%" id="dept_table">
		<tr><th>사번</th><th>이름</th><th>부서</th><th>직급</th><th>내선번호</th></tr>
		<c:forEach var="dto" items="${yellowPage }">
			<tr class="dept_table_tr"><td>${dto.emp_num}</td><td>${dto.emp_Kname}</td><td>${dto.dept_deptName}</td><td>${dto.dept_position}</td><td>${dto.emp_tel}</td></tr>
		</c:forEach>
		
		</table>
		
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			<a href="${pageContext.request.contextPath}/employee/yellowPage?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">10페이지 이전</a>
		</c:if>
						
		<c:if test="${pageDTO.currentPage > 0}">
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
				<a href="${pageContext.request.contextPath}/employee/yellowPage?pageNum=${i}">${i}</a> 
			</c:forEach>
		</c:if>

		<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			<a href="${pageContext.request.contextPath}/employee/yellowPage?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">10페이지 다음</a>
		</c:if>
	</div>
	
	
	<div class="right_table">
		<div class="emp_img" id="employee_default"></div>
	    <div class="emp_infoDetails">
	     <table border="1" class="emp_details_table">
		  
	     </table>
	    </div>
	</div>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p> 갓민정님... 여기에 코드를 넣어주시옵소서,,, </p>
  </div>

</div>

</div>


<script type="text/javascript">  

$(function () {
	$(".dept_table_tr").click(function(){ 	
		
	
	var str = ""
	var tr = $(this);
	var td = tr.children();
	var emp_num = td.eq(0).text(); 
	
	
	$.ajax({
		url:'${pageContext.request.contextPath}/employee/yellowPageDetail',	
		data:{emp_num:emp_num},
		dataType : 'json',
		success:function(result){
			
			$.each(result, function(index,item) {
				$('#employee_default').html('<img src="${pageContext.request.contextPath}/resources/employee/upload/'+item.emp_img+'" style="width: 200px; height: 230px; border-radius:10px;" id="yellowPageImg">');
				$('.emp_details_table').html('<tr><th>이름</th><td>'+item.emp_Kname+'</td></tr><tr><th>부서</th><td>'+item.dept_deptName+'</td></tr><tr><th>팀</th><td>'+item.dept_teamName+'</td></tr><tr><th>직급</th><td>'+item.dept_position+'</td></tr><tr><th>직위</th><td>'+item.dept_duty+'</td></tr><tr><th>내선번호</th><td>'+0+item.emp_tel+'</td></tr><tr><th>휴대폰번호</th><td>'+0+item.emp_phone+'</td></tr>');
			
				
			 var modal = document.getElementById("myModal");

				// Get the button that opens the modal
			 var btn = document.getElementById("yellowPageImg");

				// Get the <span> element that closes the modal
			 var span = document.getElementsByClassName("close")[0];

				// When the user clicks the button, open the modal 
				btn.onclick = function() {
				  modal.style.display = "block";
				}

				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
				  modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				  if (event.target == modal) {
				    modal.style.display = "none";
				  }
				}
			
			});
		}
	}); 
	
});
});

</script>
<script> //검색어
function fun1() {
	
	if(document.search.search_option.value=="") {
		alert("검색 조건을 선택하세요")
		document.search.search_option.focus();
		return false;
	}
	if(document.search.keyword.value==0) {
		alert("검색어를 입력하세요");
		document.search.keyword.focus();
		return false;
		}
	
		document.search.submit();
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
</body>
</html>
