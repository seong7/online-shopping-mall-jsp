<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="mBean" class="member.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%
boolean flag = mMgr.updateMember(mBean);
String id = request.getParameter("id");
if(flag){%>
	<script>
		alert("ȸ�������� �����Ǿ����ϴ�.");
		location.href="${pageContext.request.contextPath}/index.jsp";
	</script>
<%}else{%>
	<script>
		alert("�������� ������ �߻��Ͽ����ϴ�.");
		location.href="${pageContext.request.contextPath}/member/myinfo_check.jsp";
	</script>
<%}%>
