<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 

		<div id="mypage">

			<h1 class="title">개인 정보 수정</h1>
			
			<!-- <div class="conf_pw">  -->
				<form name="confirmForm" method="post" action="myinfo_check_Proc.jsp">
					
						<!-- <input type="text" id="login_id_input" class="login_input" name="id" placeholder="아이디를 입력해주세요." > -->
						<span>비밀번호 확인</span>
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="비밀번호를 입력해주세요.">
					
					<div class="group_btn">

						<input type="submit" class="btn btn_positive" value="확인">
					</div>
				</form>
			<!-- </div>  -->
		</div>
	</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
	</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>
	