<%@ page contentType="text/html; charset=EUC-KR" %>

<%
		request.setCharacterEncoding("EUC-KR");
		String n_id = request.getParameter("n_id");
%>
<html>
<head>
		<style>
		table {border: 1px solid; border-collapse:collapse; 
					width: 70%; text-align:center;}
		td{border: 1px solid;}
		thead{background:lightgray;}
		</style>
</head>
<body>

<h2>공지사항 작성하기</h2>
<hr>

<form name="postFrm" method="post" action="notice_Proc.jsp?flag=insert" enctype="multipart/form-data">		
<input type="hidden" name ="n_id" value="<%=n_id%>">		
		<table>
			<tr>
				<td>작성자</td>
				<td><%=n_id%></td>
			</tr>
			
			<tr>
				<td>제 목</td>
				<td>
				<input name="n_title"></td>
			</tr>
			<tr>
			<td>카테고리</td>
			<td>
			<select name="n_category">
			<option>선택</option>
			<option value="주문/결제">주문/결제</option>
			<option value="회원문의">회원</option>
			<option value="취소/교환/반품">취소/교환/반품</option>
			<option value="배송문의">배송</option>
			<option value="기타">기타</option>
			</select>
			</td>
			</tr>
			
			<tr>
				<td>내 용</td>
				<td><input name="n_content"></td>
			 <tr>
			 
     			<td>첨부파일</td> 
     			<td><input type="file" name="noticeFile" size="50"></td>
				<td></td>
			</tr>				
		</table>	
				<input type="submit" value="등록">
				<input type="button" value="작성취소" onClick="javascript:location.href='notice_list.jsp'">	
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>

</body>
</html>