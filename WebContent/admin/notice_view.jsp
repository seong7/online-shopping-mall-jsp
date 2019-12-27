<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = UtilMgr.parseInt(request, "num");
		String nowPage = request.getParameter("nowPage");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		String numPerPage = request.getParameter("numPerPage");
	
		NoticeBean bean = mgr.getNotice(num);
		String n_id = bean.getN_id();
		String n_title = bean.getN_title();
		String n_date = bean.getN_date();
		String n_content = bean.getN_content();
		String n_file_name = bean.getN_file_name();
		int n_file_size = bean.getN_file_size();
		//세션에 읽어온 게시물을 저장 : 삭제, 수정, 답변
		session.setAttribute("bean", bean);
%>
<html>
<head>
<title></title>
<script type="text/javascript">
	function down(n_file_name) {
		document.downFrm.n_file_name.value=n_file_name;
		document.downFrm.submit();
	}
	
	function list() {
		document.listFrm.action="notice_list.jsp";
		document.listFrm.submit();
		
	}
</script>
</head>
<body>
<h2>공지사항</h2>
<hr>
<form name="Frm" method="post" action="notice_update.jsp" 
enctype="multipart/form=data">
<input type= "hidden" name = num value=<%=bean.getN_index()%>>
		<table align="center" width="600" cellspacing="3">
					 <tr>
					  <td colspan="2">
					   <table cellpadding="3" cellspacing="0" width="100%"> 
					    <tr> 
					   
					  <td align="center"  width="20%">이 름</td>
					  <td ><%=n_id%></td>

					  <td align="center" width="20%">날 짜</td>
					  <td><%=n_date%></td>
					 </tr>
					 <tr> 
					    <td align="center"> 제 목</td>
					    <td colspan="3"><%=n_title%></td>
					   </tr>
					   <tr> 
					     <td align="center" width="20%" >첨부파일</td>
					     <td  colspan="3">
					     	<%if(n_file_name!=null&&!n_file_name.equals("")){%>
								<a href="javascript:down('<%=n_file_name%>')">
								<%=n_file_name%></a>
								<font color="blue">(<%=UtilMgr.intFormat(n_file_size) %>bytes)</font>
								<%}else{out.println("등록된 파일이 없습니다.");} %>
					     </td>
					   </tr>
					   <tr> 
					    <td colspan="4"><br/><pre><%=n_content%></pre><br/></td>
					   </tr>
					   </table>
					 
					  </td>
					 </tr>
					 <tr align="right">
					 <td>
							  	<td><input type="button" value="리스트" onclick="location.href ='notice_list.jsp'">
								<td><input type="submit" value="수정" ></td>
								<td><input type="button" value="삭제" onclick="location.href='notice_Proc.jsp?flag=delete&n_index=<%=bean.getN_index()%>'">
					 </td>
					 </tr>
		</table>
</form>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="n_file_name">
</form>
<form name="listFrm" >
	<input type="hidden" action="nowPage" value="<%=nowPage%>">
	<input type="hidden" namex="numPerPage" value="<%=numPerPage%>">
	<%if(!(keyWord==null||keyWord.equals(""))){ %>
	<input type="hidden" action="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<%} %>
</form>
</body>
</html>
