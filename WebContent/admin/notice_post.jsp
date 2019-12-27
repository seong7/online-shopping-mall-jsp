<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>
</title>
</head>
<body >
<div>
<h2>공지사항 작성하기</h2>
<form method="post" action="notice_Proc.jsp?flag=insert" 
enctype="multipart/form-data">
<hr>
<br/>
<table width="600" cellpadding="3">
</table>
<br/>
<table width="600" cellpadding="3">
	<tr>
		<td >
		<table>
			<tr>
				<td width="20%">이 름</td>
				<td width="80%">
				<input name="name" size="10" ></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" size="50" ></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			 <tr>
     			<td>첨부파일</td> 
     			<td><input type="file" name="FileUp" size="50" maxlength="50"></td>
				<td colspan="2"></td>
			</tr>
			<tr align="right">
				<td colspan="2">
					 <input type="submit" value="등록">
					 <input type="button" value="리스트" onClick="javascript:location.href='notice_list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>