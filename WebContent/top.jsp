<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		String admin_id = (String)session.getAttribute("adminKey");

%>
<!--<!DOCTYPE html>
<html>
	<head>-->
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/reset.css">
		<link rel="stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/util.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css">
		<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--</head>
	<body> -->
	        
			    <div id="wrap" style="display:none;border:1px solid #DDDDDD;width:500px;margin-top:500px; margin-left: 200px, z-index: 200"></div>
    	<div style="height:10px;"></div>
	    <div id="modalDiv">
	        <div id="modalInnerFrame">
				<div id="modal_elements_wrapper">
					<!-- modal_header : �α��� / ȸ������ ��ư-->
					<div id="modal_header">
						<input type="radio" id="login_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('login')" checked>
						<label for="login_btn" id="login_btn_label" class="login_signup_btns_label" >&nbsp�α���&nbsp</label>
						<span id="modal_header_span">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<input type="radio" id="signup_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('signup')">
						<label for="signup_btn" id="signup_btn_label" class="login_signup_btns_label">ȸ������</label>
					</div>
					<form method="POST" id="login_form" action="#">
						<h3>�������!</h3>
						<input type="text" id="login_id_input" class="login_input" name="id" placeholder="���̵� �Է����ּ���." autocomplete="off">
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="��й�ȣ�� �Է����ּ���."autocomplete="off">
						<div id="lost_id_pwd_wrapper">
							<a href="#">���̵� ��й�ȣ�� �ؾ���Ƚ��ϱ�?</a>
						</div>
						<button type="button" class="top_modal_button top_modal_button_style top_modal_orange" id="login_submit_btn">
							<span id="login_span">�α���</span>
						</button>
					</form>
					<form id="signup_form">
						<h3>ó���̼���?</h3>
						<div id="daumWrap"></div>
						<div id="id_section">
							<input type="text" class="signup_input" id="id_section_input" autocomplete="off" placeholder="���̵� �Է��ϼ���.">
							<!-- ajax �ʿ� ?-->
							<button type="button" class="signup_util_btn top_modal_button_style top_modal_orange top_modal_button" id="id_section_btn"><span>�ߺ�Ȯ��</span></button>
						</div>
						<input type="password" class="signup_input signup_long_input" id="signup_pwd"autocomplete="off" placeholder="��й�ȣ�� �Է��ϼ���.">
						<input type="password" class="signup_input signup_long_input" id="signup_pwd_check" autocomplete="off" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���.">
						<input type="text" class="signup_input signup_long_input" id="signup_name" autocomplete="off" placeholder="�̸��� �Է��ϼ���.">
						<input type="text" class="signup_input signup_long_input" id="signup_birth" autocomplete="off" placeholder="��������� �Է��ϼ���. Ex)1900-01-01">
						<input type="text" class="signup_input signup_long_input" id="signup_email" autocomplete="off" placeholder="�̸����� �Է��ϼ���. Ex)timi@page.net">
						<input type="text" class="signup_input signup_long_input" id="signup_phone" autocomplete="off" placeholder="����ó�� �Է��ϼ���. Ex)010-0000-0000">
						<div id="address_section">
							<div id ="address_section_header">
							    <input id="address_section_zipcode" class="signup_input" type="text" value="" readOnly/>
								<button type="button" id="address_section_btn" class="signup_util_btn top_modal_button_style top_modal_button" onclick="openDaumZipAddress();"><span>�ּ� ã��</span></button>
							
							    <!-- ���� �����ȣ ã�� ����Ʈ�� ��� ������ ���� -->
						
							    <input type="text" class="signup_input signup_long_input" id="signup_addr" readOnly/>
							    <input type="text" class="signup_input signup_long_input" id="signup_addr_detail" placeholder="���ּҸ� �Է��ϼ���."/>
							</div>
						</div>
						<button type="button" class="top_modal_button top_modal_button_style top_modal_orange" id="signup_submit_btn" >
							<span id="submit_span" class="box">ȸ������</span>
						</button>
					</form>
				</div>
	        </div>
	        <label for="userPopup"></label>
	    </div>
	    	    <!--��ü ������ Wrapper-->
	    <div id="top_wrapper">
	        <!--header Wrapper(�ΰ� ��� Div(�߰� Contents ����), Hompage Logo)-->
	        <div id="header">
	            <!--ADD CONTENTS-->
	            <div id="headerTopMenu">
	                <!--�ʿ�� ����-->
	            </div>
	            <!--�ΰ� �̹��� Div-->
	            <div id="homeLogo">
	            	<a id="logo_a" href="${pageContext.request.contextPath}/index.jsp">
		                <img id="logoImg" src="${pageContext.request.contextPath}/img/index/logo/mills_logo.png" alt="�̹��� �ε� �Ұ�!">
		                <!--LOGO-->
	            	</a>
	            </div>
	            <div id="search_div">
	                <form  id="search_form" action="${pageContext.request.contextPath}/product/goods_list.jsp">
	                    <label>
	                        <input name="searchTerm" type="text" id="search_input" placeholder="��ǰ�� �Է��ϼ���" autocomplete=��off��>
	                        <i class="fas fa-search" onclick="document.getElementById('search_form').submit()"></i>
	                    </label>
	                        <input name="list" value="search" type="hidden">
	                </form>
	            </div>
	            
	        </div>
	        <!--�޴� �׺���̼�(sticky)-->
	        <div id="menuNav">
	            <!--nav ���� :1���� �����̵� �޴�, ����Ʈ, �Ż�ǰ, ������, �˻�â(search icon), shopping icon(��ٱ���)-->
	            <div id="nav_Div">
	                <ul class="nav_main">
	                    <li id="nav_start">
	                        <a class="nav_a" id="ricecakeNav">
	                            <i class="fas fa-bars"></i>
	                            <span class="txt">��</span>
							</a>
							<div id="nav_category">
								<ul>
									<li><a href="${pageContext.request.contextPath}/product/goods_list.jsp?list=all" class="category_menu">��ü����</a></li>
									<li><a href="#" class="category_menu">���붱</a></li>
									<li><a href="#" class="category_menu">ǻ����</a></li>

								</ul>
							</div>
	                    </li>
	                    <li>
	                        <a class="nav_a" href="${pageContext.request.contextPath}/product/goods_list.jsp?list=best">
	                            <span class="txt">����Ʈ</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a" href="${pageContext.request.contextPath}/product/goods_list.jsp?list=new">
	                            <span class="txt">�Ż�ǰ</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a"  href="#">
	                            <span class="txt">������</span>
	                        </a>
	                    </li>
						<li id="active_btn_li">
							<ul id="active_btn_wrapper">
							<%if(id==null && admin_id==null){ %>
								<li>
									<input type="checkbox" id="userPopup">
									<label for="userPopup" id="userPopup_label">
										<i class="fas fa-user"></i>
									</label>
								</li>
							<%}else if(id==null && admin_id!=null){ %>
							<li>
									<a href="${pageContext.request.contextPath}/member/myinfo_check.jsp"><i class="fas fa-user"></i></a>
								</li>
								<li>
									<a href="#"><i class="fas fa-shopping-cart"></i></a>
								</li>
								<li>
									<form id="logout_admin" action="/online-shopping-mall/member/signup"  method="post">
										<a onclick="logout_admin()"><i class="fas fa-sign-in-alt"></i></a>
									</form>
								</li>
								<li>
									<a href="#"><i class="fas fa-cog"></i></a>
								</li>
							<%}else if(id!=null && admin_id==null){ %>
								<li>
									<a href="${pageContext.request.contextPath}/member/myinfo_check.jsp"><i class="fas fa-user"></i></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/order/cart.jsp"><i class="fas fa-shopping-cart"></i></a>
								</li>
								<li>
									<form id="logout_form" action="/online-shopping-mall/member/signup"  method="post">
										<a onclick="logout_onclick()"><i class="fas fa-sign-in-alt"></i></a>
									</form>
								</li>
								
								<%} %>
							</ul>
						</li>
					</ul>
				</div>
	        </div>
	</div>

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/top.js"></script>

<!-- </body>    --- index.jsp ���� �ݾ���
</html> -->
