<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int num = UtilMgr.parseInt(request, "num");
	NoticeBean bean = mgr.getNotice(num);
%>
<html>
<head>
</head>
<body>
<h2>공지사항 수정</h2>
<hr>
<form name=Frm" method="post" action ="notice_Proc.jsp?flag=update" 
enctype="multipart/form=data">
	<input type= "hidden" name = index value="<%=bean.getN_index()%>">
	<input type= "hidden" name = category value="<%=bean.getN_category()%>">
	<input type= "hidden" name = filesize value="<%=bean.getN_file_size()%>">	
		<table align="center" width="600" cellspacing="3">
			<tr>
			<td colspan="2">
				<table cellpadding="3" cellspacing="0" width="100%"> 
				<tr>
					<td>이 름</td>
					<td><%=bean.getN_id()%></td>
					<td>날 짜</td>
					<td><%=bean.getN_date() %></td>
				</tr>
				<tr>
					 <td> 제 목</td>
					 <td colspan="3"><input name=title  value=<%=bean.getN_title() %>></td>
				</tr>
				<tr>
					  <td>첨부파일</td>
					  <td colspan="3"><%=bean.getN_file_name()%>
					  <input type= "file" name="FileUp"> 
					  </td>
				</tr>
				<tr>
					<td colspan="4"><br/><pre><input name=content value=<%=bean.getN_content()%>></pre>
				</tr>
				</table>
			</td>
			</tr>
			<tr>
			<td>
				<input type="submit" value="수정하기">
			</td>
			</tr>
	</table>
</form>
</body>
</html>