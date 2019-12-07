<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/top.css">
		<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
	</head>
	<body>
	    <div id="modalDiv">
	        <div id="modalInnerFrame">
	            <label for="userPopup"><i class="fas fa-times"></i></label>
	        </div>
	        <label for="userPopup"></label>
	    </div>
	    <!--전체 페이지 Wrapper-->
	    <div id="top_wrapper">
	        <!--header Lapper(로고 상단 Div(추가 Contents 대비용), Hompage Logo)-->
	        <div id="header">
	            <!--ADD CONTENTS-->
	            <div id="headerTopMenu">
	                <!--필요시 문의-->
	            </div>
	            <!--로고 이미지 Div-->
	            <div id="homeLogo">
	                <img src="img/breadLogo.jpg" alt="이미지 로딩 불가!">
	                <!--LOGO-->
	            </div>
	            <div id="search_div"">
	                <form action="" id="search_form">
	                    <label>
	                        <input type="text" id="search_input" placeholder="상품을 입력하세요" autocomplete=”off”>
	                        <i class="fas fa-search"></i>
	                    </label>
	                </form>
	            </div>
	            
	        </div>
	        <!--메뉴 네비게이션(sticky)-->
	        <div id="menuNav">
	            <!--nav 구성 :2개의 슬라이드 메뉴, 신상품, 알뜰쇼핑, 이벤트, 검색창(search icon), shopping icon(장바구니)-->
	            <div id="nav_Div">
	                <ul class="nav_main">
	                    <li id="nav_start">
	                        <a class="nav_a" id="breadNav">
	                            <i class="fas fa-bars"></i>
	                            <span class="txt">떡</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">베스트</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">신상품</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">이벤트</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">고객지원</span>
	                        </a>    
	                    </li> 
	                </ul>
	                <i class="fas fa-shopping-cart"></i>
	                <input type="checkbox" id="userPopup">
	                <label for="userPopup">
	                    <i class="fas fa-user"></i>
	                </label>
	            </div>
	            <div id="ricecake_sub">
	                <!--떡 slide menu ※기본속성 display none-->
	            </div>
	        </div>
	</div>
	<script type="text/javascript" src="js/index.js"></script>
	</body>
</html>