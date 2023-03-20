<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업지시등록</title>
</head>
<body>
수주번호검색

	<a href=# onclick="return sj_search();" class="btn">등록</a> 

	<script text="text/javascript">
		function sj_search() {
		//	수정팝업창 크기 조절과 팝업 위치 조절
		var _width = '400';
		var _height = '400';
		var _left = Math.ceil((window.screen.width - _width) / 2);
		var _top = Math.ceil((window.screen.height - _height) / 2);
		let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
		window.name = "sj_search";
		window.open(
		"${pageContext.request.contextPath}/workorder/sj_search",
		"수주번호검색",popOption);}
	</script>
</body>
</html>