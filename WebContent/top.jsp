<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" href="css/top.css">
		<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	</head>
	<body>
	    <div id="modalDiv">
	        <div id="modalInnerFrame">
				<div id="modal_elements_wrapper">
					<!-- modal_header : 로그인 / 회원가입 버튼-->
					<div id="modal_header">
						<input type="radio" id="login_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('login')" checked>
						<label for="login_btn" id="login_btn_label" class="login_signup_btns_label" >&nbsp로그인&nbsp</label>
						<span id="modal_header_span">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<input type="radio" id="signup_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('signup')">
						<label for="signup_btn" id="signup_btn_label" class="login_signup_btns_label">회원가입</label>
					</div>
					<form method="POST" id="login_form" action="#">
						<h3>어서오세요!</h3>
						<input type="text" id="login_id_input" class="login_input" name="id" placeholder="아이디를 입력해주세요." autocomplete="off">
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="비밀번호를 입력해주세요."autocomplete="off">
						<div id="lost_id_pwd_wrapper">
							<a href="#">아이디나 비밀번호를 잊어버렸습니까?</a>
						</div>
						<button type="submit" class="top_modal_button top_modal_button_style" id="login_submit_btn">
							<span>로그인</span>
						</button>
					</form>
					<form method="POST" id="signup_form" action="#">
						<h3>처음이세요?</h3>
						<div id="id_section">
							<input type="text" class="signup_input" id="id_section_input" autocomplete="off" placeholder="아이디를 입력하세요.">
							<!-- ajax 필요 ?-->
							<button type="button" class="signup_util_btn top_modal_button_style top_modal_button" id="id_section_btn" onclick="location.href='xx.jsp'"><span>중복확인</span></button>
						</div>
						<input type="password" class="signup_input" autocomplete="off" placeholder="비밀번호를 입력하세요.">
						<input type="password" class="signup_input" autocomplete="off" placeholder="비밀번호를 한번 더 입력하세요.">
						<input type="text" class="signup_input" autocomplete="off" placeholder="이름을 입력하세요.">
						<input type="text" class="signup_input" autocomplete="off" placeholder="생년월일을 입력하세요.">
						<input type="text" class="signup_input" autocomplete="off" placeholder="이메일을 입력하세요.">
						<input type="text" class="signup_input" autocomplete="off" placeholder="연락처를 입력하세요.">
						<div id="address_section">
							<div id ="address_section_header">
								<input type="text" class="signup_input" id="address_section_zipcode" autocomplete="off" readonly placeholder="우편번호">
								<button class="signup_util_btn top_modal_button_style top_modal_button" id="address_section_btn"><span>주소검색</span></button><br/>
							</div>
							<input type="text" class="signup_input" autocomplete="off" readonly placeholder="주소">
							<input type="text" class="signup_input" autocomplete="off" placeholder="상세주소를 입력해주세요.">
						</div>
						<button type="submit" class="top_modal_button top_modal_button_style" id="signup_submit_btn">
							<span>회원가입</span>
						</button>
					</form>
				</div>
	        </div>
	        <label for="userPopup"></label>
	    </div>
	    <!--전체 페이지 Wrapper-->
	    <div id="top_wrapper">
	        <!--header Wrapper(로고 상단 Div(추가 Contents 대비용), Hompage Logo)-->
	        <div id="header">
	            <!--ADD CONTENTS-->
	            <div id="headerTopMenu">
	                <!--필요시 문의-->
	            </div>
	            <!--로고 이미지 Div-->
	            <div id="homeLogo">
	                <img src="img/logo4.png" alt="이미지 로딩 불가!">
	                <!--LOGO-->
	            </div>
	            <div id="search_div">
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
	                        <a class="nav_a" id="ricecakeNav" onclick="navCategory()">
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
	                            <span class="txt">고객지원</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt"></span>
	                        </a>    
	                    </li> 
	                </ul>
	                <i class="fas fa-shopping-cart"></i>
	                <input type="checkbox" id="userPopup">
					<label for="userPopup" id="userPopup_label">
						<i class="fas fa-user"></i>
					</label>
	            </div>
	            <div id="nav_category">
					<!--떡 slide menu ※기본속성 display none-->
					
	            </div>
	        </div>
	</div>
	<script type="text/javascript" src="js/top.js"></script>
	</body>
</html>