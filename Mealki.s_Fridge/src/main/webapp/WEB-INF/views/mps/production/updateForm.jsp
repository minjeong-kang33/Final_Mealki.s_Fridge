<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
<%--   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script> --%>
<!--   <script> -->
<!-- 	$(document).ready(function(){ -->
<!-- 			$("#lineselect").on("change", function () { -->
<!-- 			var value = $(this).val(); -->
<!-- 			var wonum = $(this).find("option:selected").data("wonum"); -->
<!-- 			var item = $(this).find("option:selected").data("itemname"); -->
<!-- 			var manucode = $(this).find("option:selected").data("manucode"); -->
<!-- 			var itemnum = $(this).find("option:selected").data("itemnum"); -->
<!-- 			var sdate = $(this).find("option:selected").data("sdate"); -->
<!-- 			$('input[name=manu_name]').attr('value',value); -->
<!-- 			$('input[name=wo_num]').attr('value',wonum); -->
<!-- 			$('input[name=item_name]').attr('value',item); -->
<!-- 			$('input[name=manu_code]').attr('value',manucode); -->
<!-- 			$('input[name=item_num]').attr('value',itemnum); -->
<!-- 			$('input[name=manu_sdate]').attr('value',sdate); -->
			
<!-- 			if($('#sdate').val()!='')  { -->
<!--                 $('#IconButton1').hide(); -->
<!--                 $('#IconButton2').show(); -->
<!-- 	          }else{ -->
<!-- 	        	$('#IconButton1').show(); -->
<!-- 	        	$('#IconButton2').hide(); -->
<!-- 	          } -->
	        	  
<!-- 				}); -->
<!-- 			}); -->
<!-- </script> -->
</head>
<body>

<!--  본문 내용 시작 -->

			<div id="writebody">
				<form id="updateProduct" method="POST" >
					라인명 :
					<input type="text" name = "wo_num" value="${updateProduct.wo_num}" readonly="readonly">
					라인코드 :
					<input type="text" name = "manu_name" value="${updateProduct.manu_name}" readonly="readonly">
					품명 :
					<input type="text" name = "manu_code" value="${updateProduct.manu_code}" readonly="readonly">
					아이템코드 :
					<input type="text" name = "item_name" value="${updateProduct.item_name}" readonly="readonly">
					작업지시번호 :
					<input type="text" name = "item_num" value="${updateProduct.item_num}" readonly="readonly">
					작업자 : 
					<input type="text" name = "emp_Kname" value="${updateProduct.emp_Kname}" readonly="readonly">
					생산량 :
					<input type="text" name = "manu_tocount" value="${updateProduct.manu_tocount}">
					불량 :
					<input type="text" name = "manu_fail" value="${updateProduct.manu_fail}">
					
					<input type="hidden" name = "manu_date" value="${updateProduct.manu_date}">
					
            	<button class="btn btn-primary" type="submit" id="IconButton2" formaction="${pageContext.request.contextPath}/mps/production/writePro">
				수정
				</button>				
<!-- 				reset -->
				<button class="btn btn-primary" type="reset" id="IconButton3" onclick="window.close()">
				<a>취소</a>
				</button>
				
				</form>
			</div>
 <!--  본문내용 끝 -->    

</body>
</html>