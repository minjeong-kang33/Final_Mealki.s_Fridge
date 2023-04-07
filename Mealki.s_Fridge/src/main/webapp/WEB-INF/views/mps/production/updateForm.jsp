<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
  <script>
	$(document).ready(function(){
			$("#lineselect").on("change", function () {
			var value = $(this).val();
			var wonum = $(this).find("option:selected").data("wonum");
			var item = $(this).find("option:selected").data("itemname");
			var manucode = $(this).find("option:selected").data("manucode");
			var itemnum = $(this).find("option:selected").data("itemnum");
			var sdate = $(this).find("option:selected").data("sdate");
			$('input[name=manu_name]').attr('value',value);
			$('input[name=wo_num]').attr('value',wonum);
			$('input[name=item_name]').attr('value',item);
			$('input[name=manu_code]').attr('value',manucode);
			$('input[name=item_num]').attr('value',itemnum);
			$('input[name=manu_sdate]').attr('value',sdate);
			
			if($('#sdate').val()!='')  {
                $('#IconButton1').hide();
                $('#IconButton2').show();
	          }else{
	        	$('#IconButton1').show();
	        	$('#IconButton2').hide();
	          }
	        	  
				});
			});
</script>
</head>
<body>

<!--  본문 내용 시작 -->

			<div id="writebody">
				<form id="insertProduct" method="POST" >
				<label>라인명 : </label>
				<select name="lineselect" id="lineselect" >
            			<option value="" data-wonum="" data-itemname="" 
            						data-manucode="" data-itemnum="">라인을 선택하세요</option>
            			<c:forEach var="sel" items="${selectList}">
            			<c:if test="${sel.unsto_qty != sel.manu_tocount }">
            				<option value="${sel.manu_name}" data-wonum="${sel.wo_num}" data-itemname="${sel.item_name}" 
            						data-manucode="${sel.manu_code}" data-itemnum="${sel.item_num}" data-sdate="${sel.manu_sdate}">${sel.manu_name}</option>
            			</c:if>
            			</c:forEach>
          		</select>
<!--           		selectbox 선택시 값넘기기 위해 만든 박스 -->
          		<input type="hidden" name="manu_name" value="">
          		
          		생산코드 :
          		<input type="text" name="manu_code" value="" readonly="readonly"><p>
          		
          		<label>품명 : </label>
				<input type="text" name="item_name" value="" readonly="readonly">
				
          		아이템코드 :
          		<input type="text" name="item_num" value="" readonly="readonly"><p>
          		
				<label>작업지시번호 : </label>
				<input type="text" name="wo_num" value="" readonly="readonly">
				
				<label>작업자 : </label>
				<input type="text" name="emp_Kname" value="${productionDTO.emp_Kname}" readonly="readonly"><P>
				
				<label>생산량 : </label>
				<input type="text" name="manu_tocount" value="0">

				<label>불량 : </label>
				<input type="text" name="manu_fail" value="0">
				<label>시작시간 : </label>
				<input type="text" name="manu_sdate" value="" id="sdate" readonly="readonly">
<!-- 			시작 했을때 시작시간 등록 -->
            		<button class="btn btn-primary" type="submit" id="IconButton1" formaction="${pageContext.request.contextPath}/mps/production/start">
					시작
					</button>
					
            		<button class="btn btn-primary" type="submit" id="IconButton2" formaction="${pageContext.request.contextPath}/mps/production/writePro">
					완료
					</button>
					
<!-- 				완료 했을때 완료시간 등록 -->
					<c:if test="${productionList.manu_sdate ne null}">
					<button class="btn btn-primary" type="button" id="IconButton2">
					완료
					</button>
					</c:if>
<%-- 				</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 				reset -->
				<button class="btn btn-primary" type="reset" id="IconButton3">
				<a>취소</a>
				</button>
				
				</form>
			</div>
 <!--  본문내용 끝 -->    

</body>
</html>