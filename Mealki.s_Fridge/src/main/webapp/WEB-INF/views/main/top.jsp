<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


      <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
       <a class="navbar-brand brand-logo mr-5" href="${pageContext.request.contextPath}/main/main"><img src="${pageContext.request.contextPath}/resources/maincss/images/logo.png" width="130" style="margin-left: 30px;" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/main/main"><img src="${pageContext.request.contextPath}/resources/maincss/images/logo.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
 
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
          
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
     			       <button type="button" style="border: none; background-color: transparent;" onClick="yellowPage()">
                        <img src="${pageContext.request.contextPath}/resources/maincss/css/free-icon-phone-book-4812550.png" width="35" height="35" style="border:0; background-color: transparent;"></i>
                       </button>
            </a>

          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${pageContext.request.contextPath}/resources/employee/upload/${sessionScope.userProfileImagePath}" alt="profile"/>
               <span class="text-primary"> ${sessionScope.emp_Kname}</span> 님 
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                Settings 
              </a>
              <a class="dropdown-item" href="${pageContext.request.contextPath}/main/logout">
                <i class="ti-power-off text-primary"></i>
                로그아웃
              </a>
            </div>
          </li>

        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>


<script type="text/javascript">

/* 전화번호부 팝업 */

function yellowPage() {
	var _width = '1200';
	var _height = '650';
	var _left = Math.ceil((window.screen.width - _width) / 2);
	var _top = Math.ceil((window.screen.height - _height) / 2);
	let popOption = 'width='+ _width+ ', height='+ _height+ ', left='+ _left+ ', top='+ _top;
	window.open("${pageContext.request.contextPath}/employee/yellowPage",
							"밀키의 냉장고",popOption);}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>


</body>
</html>