<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="Member.MemberMgr" />
<jsp:useBean id="mBean" class="Member.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%
boolean flag = mMgr.updateMember(mBean);
String id = request.getParameter("id");
if(flag){%>
<script>
	alert("ȸ�������� �����Ǿ����ϴ�.");
	location.href="index.jsp";
</script>
<%}else{%>
<script>
	alert("�������� ������ �߻��Ͽ����ϴ�.");
	history.back();
</script>
<%}%>


