<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
<style>
#pwdCheckInput{
	width: 230px;
}

</style>
		<div id="mypage">

			<h1 class="title">개인 정보 수정</h1>
	
	            <form id="pwdCheck_form" name="confirmForm" method="post" action="myinfo_check_Proc.jsp">
	                
	                <div id="title_wrapper">
	                    <span class="inner_title">비밀번호 확인</span>
	                </div>
	                
	                <div id="btn_group">
	                    <input id="pwdCheckInput" type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
	                    <input id="pwdcheckBtn" class="btn" type="submit" value="확인">
	                </div>
	            </form>
			<!-- </div>  -->
		</div>
	</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
	</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>
	