<%@page import="admin.AdminMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="aMgr" class="admin.AdminMgr"/>
<jsp:useBean id="bean" class="admin.NoticeBean"/>
<%
	request.setCharacterEncoding("EUC-KR");

 	String flag = request.getParameter("flag");
 	String msg = "오류발생";
 	System.out.println(flag);
 	boolean result = false;
 	
 	if(flag.equals("delete")){
 		int n_index = Integer.parseInt(request.getParameter("n_index"));
 		System.out.println(n_index);
 		aMgr.deleteNotice(n_index);
 		msg = "삭제 되었습니다.";
 	}else if(flag.equals("update")){
 		int num = Integer.parseInt(request.getParameter("n_index"));
 		System.out.println(num);
 		//result=aMgr.updateNotice(request);
 		msg="수정 되었습니다.";
 	}else if (flag.equals("insert")){
 		result = aMgr.insertNotice(request);
 		msg="등록 되었습니다.";
 	}
 	
%>
<script>
alert("<%=msg%>");
location.href="notice_list.jsp";
</script>
