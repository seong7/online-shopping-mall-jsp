<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="member.MemberMgr" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("idKey");
String pwd = request.getParameter("pwd");
boolean result = mgr.checkPwd(pwd);
if(result){
%>
<script>
		alert("<%="확인"%>");
		location.href = "mypage_myinfo.jsp";
</script>	

<%
		}else{
%>
<script>
	alert("<%="비밀번호가 일치하지 않습니다."%>");
	location.href = "myinfo_check.jsp";
</script>	
<%
	}
%>
%>