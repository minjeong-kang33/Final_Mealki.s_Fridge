<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<!--  한글로 메뉴를 빨리 찾고 싶은 사람은 왼쪽만 보고 슝 내려가시면됩니다
      한글 주석 왼쪽정렬로 달아놨어요 -->

<!-- 사이드바 메뉴는 아래에 있어요
     개인설정, 사이드바 같이있습니다. 떼면 사이드바 배열 망가져요 -->

   <!-- 개인설정 -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading">SIDEBAR SKINS</p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div>Light</div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div>Dark</div>
          <p class="settings-heading mt-2">HEADER SKINS</p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      
<!-- 사이드바 리스트 -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
      
        <ul class="nav">
        
<!--  사원관리 메뉴 -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/employee/empManage">
              <i class="icon-grid menu-icon"></i>
              <span class="menu-title">사원관리</span>
            </a>
          </li>
      
<!--  기준 정보 관리 -->      
           <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="icon-layout menu-icon"></i>
              <span class="menu-title">기준정보관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">소요량관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/mdm/item/itemlist">품목관리</a></li>
              </ul>
            </div>
          </li>
          
<!--  자재관리 -->          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="icon-columns menu-icon"></i>
              <span class="menu-title">자재관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/wms/stock/stockList">재고현황</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/wms/placeorder/insertOrder">발주관리</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/wms/store/insertStore">입고관리</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/wms/unstore/insertUnstore">출고관리</a></li>
              </ul>
            </div>
          </li>
      
   
 <!--  생산관리 -->            
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="icon-bar-graph menu-icon"></i>
              <span class="menu-title">생산관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/mps/workorder/list">작업지시관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/mps/production/list">생산관리(관리자)</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/mps/production/write">생산관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">품질관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">설비관리</a></li>
              </ul>
            </div>
          </li>
          
<!--  영업관리 -->             
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="icon-grid-2 menu-icon"></i>
              <span class="menu-title">영업관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/business/customer/customerList">거래처관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/business/contract/contractWrite">수주관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">출하관리</a></li>
              </ul>
            </div>
          </li>
          
 <!--  그룹웨어(사이드바에 둘지 따로 뺄지 미정) -->           
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="icon-contract menu-icon"></i>
              <span class="menu-title">그룹웨어</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">공지사항</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
</body>
</html>