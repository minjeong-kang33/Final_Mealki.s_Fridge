<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키의 냉장고</title>
  <!-- End plugin css for this page -->
  <!-- inject:css -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/maincss/images/favicon-32x32.png" /> 
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/maincss/css/vertical-layout-light/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/business/customerDetail.css">
 
</head>
<body>
			<div class="customer_details">
               <h4> |거래처 상세 </h4>
                  <div class="cust_infoDetails">
                     <table border="1" class="cust_details_table">
                     <tr ><th>거래처구분</th><td>${customerDTO.cust_gubun1}</td><th style="width: 200px;">거래처구분</th><td>${customerDTO.cust_gubun2}</td></tr>
                     <tr ><th>거래처명</th><td id="org_name">${customerDTO.cust_name}</td><th style="width: 200px;">사업자번호/생년월일</th><td id="business_num">${customerDTO.business_num}</td></tr>
                     <tr ><th>대표자명</th><td>${customerDTO.boss_name}</td><th style="width: 200px;">대표전화</th><td id="org_tel">${customerDTO.cust_tel}</td></tr>
                     <tr ><th>업태</th><td>${customerDTO.cust_uptae}</td><th style="width: 200px;">종목</th><td>${customerDTO.cust_jongmok}</td></tr>
                     <tr ><th>담당자 이름</th><td>${customerDTO.man_name}</td><th style="width: 200px;">담당자 전화번호</th><td id="home_tel">${customerDTO.man_tel}</td></tr>
                     <tr ><th>담당자 이메일</th><td id="org_email">${customerDTO.man_email}</td><th style="width: 200px;">Fax</th><td>${customerDTO.fax}</td></tr>
                     <tr ><th>주소</th><td colspan="3">(${customerDTO.cust_post_num})${customerDTO.cust_address}, ${customerDTO.cust_address2}</td></tr>
                     <tr ><th>홈페이지</th><td colspan="3">${customerDTO.url_path}</td></tr>
                     <tr ><th>적요</th><td colspan="3"><textarea name="remarks" rows="10" cols="145" readonly>${customerDTO.remarks}</textarea></td></tr>
                     </table>
                  </div>
               </div>
               <div id="buttons" style="text-align:center;">
				<c:if test="${sessionScope.dept_num == 200}">		
					<input type="button" value="수정하기" class="btn btn-primary" onclick="updateCustomer('${pageContext.request.contextPath}/business/customer/updateCustomer?business_num=${customerDTO.business_num}')"> 
					<input type="button" value="삭제하기" class="btn btn-primary" onclick="deleteCustomer('${pageContext.request.contextPath}/business/customer/deleteCustomer?business_num=${customerDTO.business_num}')">
			 	</c:if>
			  <!-- QR코드 시작-->
			  <input type="button" name="getQr" class="btn btn-primary" value="QR코드 생성"><br>
			  <img id="qr" src="" alt="QR code" style="visibility: hidden;">
			  <!-- QR코드 끝-->
			  
			  </div>
			  
			  
<!-- 여기서부터 스크립트 -->
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
  <script>
	function deleteCustomer(url) {
	  if (confirm("거래처를 삭제하시겠습니까?")) {
	    location.href = url;
	  }
	}
  </script>
  
  <script>
	function updateCustomer(url) {
	  if (confirm("거래처를 수정하시겠습니까?")) {
	    location.href = url;
	  }
	}
  </script>

			   
 <script type="text/javascript">
 /* QR코드 생성 */
var vcard= {
	str_start:'BEGIN:VCARD\nVERSION:3.0\n',
	str_vcard:'BEGIN:VCARD\nVERSION:3.0\n',
	str_end:'\nEND:VCARD',
	goog_chart:'http://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=',
	form:[],
	get_field: function(field){
		for(var i in vcard.form){
			if(vcard.form[i].name === field){ 
			     return vcard.form[i].value.replace(/^\s+|\s+$/g,"");
			} 
		}
	}, 
	add_you: function(){
		var first_name = '${customerDTO.man_name}'.substr(0, 1),
			last_name = '${customerDTO.man_name}'.substr(1, 3),
			org_name = document.getElementById("org_name").innerText;
		vcard.str_vcard += 'N:'+last_name+';'+first_name+'\n'+'FN:'+first_name+' '+last_name+' ('+org_name+')';
	},
	add_address: function(){
		var org_street = '${customerDTO.cust_address2}',
			org_city = '${customerDTO.cust_address}';
		if(org_street+org_city !== ''){
			vcard.str_vcard += '\nADR;TYPE=work:;;'+org_street+';'+org_city;
		}
	}, 
	add_tel: function(){
		 var phone = document.getElementById("home_tel").innerText,
			 work = document.getElementById("org_tel").innerText;
		if(phone !== ''){ vcard.str_vcard += '\nTEL;TYPE=phone:'+phone; }
		if(work !== ''){ vcard.str_vcard += '\nTEL;TYPE=work:'+work; }
	},
	add_email: function(){
		var home = document.getElementById("org_email").innerText;
		if(home !== ''){ vcard.str_vcard += '\nEMAIL;TYPE=internet,home:'+home; }
	},
	add_work: function(){
		var name = document.getElementById("org_name").innerText;
		if(name !== ''){ vcard.str_vcard += '\nORG:'+name; }
	},
	required_check: function(){
		var first_name = vcard.get_field("first_name"),
			last_name = vcard.get_field("last_name") ,
		msg = '이름을 불러올 수 없습니다.',
		fields = [] ;
			        
		if(first_name === ''){ fields.push('First name'); }
		if(last_name === ''){ fields.push('Last name'); }
		if(fields.length === 0){ return ''; } 
			        
		return msg; 
	},
	save: function(){
		vcard.form = $('form').serializeArray();
		var required_check_output = vcard.required_check();
			        
		if(required_check_output !== ''){
			alert(required_check_output);
			return;
		}
		
		vcard.add_you();
		vcard.add_address();
		vcard.add_tel();
		vcard.add_email();
		vcard.add_work();
		vcard.str_vcard += vcard.str_end;
			        
	$('#qr').attr('src',vcard.goog_chart+vcard.str_vcard.replace(/\n/g,'%0A'));
		vcard.str_vcard = vcard.str_start;
	}
};

$(function(){
	$('input[name="getQr"]').click(vcard.save);
	
	$('input[name="getQr"]').click(function(){
		const qr = document.getElementById('qr');
		if(qr.style.visibility !== 'hidden') {
			qr.style.visibility = 'hidden';
		}
		else {
			qr.style.visibility = 'visible';
		}
	}); 
});
		</script>
</body>
</html>