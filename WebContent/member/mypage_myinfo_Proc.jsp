<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="Member.MemberMgr" />
<jsp:useBean id="mBean" class="Member.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");
String newPassword = request.getParameter("newPwd");
String checkPassword = request.getParameter("checkPwd");
String birthday = request.getParameter("birthday");
String email = request.getParameter("email");
String contact = request.getParameter("contact");
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String address_detail = request.getParameter("address_detail");

boolean flag = mMgr.updateMember(mBean);
%>


<% 
if(flag){%>
<script>
		alert("회원정보가 수정되었습니다.");
		location.href="../index.jsp";
	</script>
<%}else{%>
	<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
	</script>
<%}%>

