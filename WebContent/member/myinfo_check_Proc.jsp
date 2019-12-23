<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="member.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");

	String msg = "비밀번호가 일치하지 않습니다.";
	String location = "myinfo_check.jsp";

	String id = (String)session.getAttribute("idKey");
	String pwd = request.getParameter("pwd");
	
	int count = mgr.checkPwd(id, pwd);
	if(count==1){
		msg = "회원수정 페이지로 이동합니다.";
		location="mypage_myinfo.jsp";
	}
%>
<script>
		alert('<%=msg%>');
		location.href = '<%=location%>';
</script>