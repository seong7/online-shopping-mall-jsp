<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 

		<div id="mypage">

			<h1 class="title">���� ���� ����</h1>
	
	            <form id="pwdCheck_form" name="confirmForm" method="post" action="myinfo_check_Proc.jsp">
	                
	                <div id="title_wrapper">
	                    <span class="inner_title">��й�ȣ Ȯ��</span>
	                </div>
	                
	                <div id="btn_group">
	                    <input id="pwdCheckInput" type="password" name="pwd" placeholder="��й�ȣ�� �Է����ּ���.">
	                    <input id="pwdcheckBtn" class="btn" type="submit" value="Ȯ��">
	                </div>
	            </form>
			<!-- </div>  -->
		</div>
	</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
	</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>
	