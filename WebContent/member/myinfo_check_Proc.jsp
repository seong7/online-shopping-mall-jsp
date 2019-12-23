<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="Member.MemberMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String cpath = request.getContextPath();

	String msg = "비밀번호가 일치하지 않습니다.";
	String location = "myinfo_check.jsp";

	String id = (String)session.getAttribute("idKey");
	String pwd = request.getParameter("pwd");
	
	int count = mgr.checkPwd(id, pwd);
	if(count==1){
		session.setAttribute("myinfo_access", "approved");
		response.sendRedirect(cpath+"/member/mypage_myinfo.jsp");
	}else{
%>
<script>
		alert('<%=msg%>');
		location.href = '<%=location%>';
</script>
<% } %>