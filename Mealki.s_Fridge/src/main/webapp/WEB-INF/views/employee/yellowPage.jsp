
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/employee/yellowPage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">  

$(function () {
	$(".dept_table_tr").click(function(){ 	
		
		var str = ""
			
			// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		var emp_num = td.eq(0).text(); 
		
		alert(emp_num);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/yellowPageDetail',
			type :'GET',
			data:{emp_num:emp_num},
			dataType : 'json',
			success:function(result){			
				alert("사원 조회 완료");		
				
				$.each(result, function(index,item) {
					
				}
				});
		});
		
	});
});

</script>
</head>
<body>

<div class="table_body">
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
				</form>
				<div style="float: left; margin-top: 20px;"><span id="text_search"><input class="input-search" type="text" name="keyword" class="input-search"></span></div>
		        <div style="float: left; margin-top: 8px; margin-left: 10px;"><span id="icon_search"><input type="image" name="button" class="search-icon" src="${pageContext.request.contextPath}/resources/employee/icon-find.png" width="25" height="25" style="margin-top: 15px;"></span></div> 
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
	fff
	</div>


</div>



<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
</body>
</html>
