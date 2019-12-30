<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int num = UtilMgr.parseInt(request, "num");
	NoticeBean bean = mgr.getNotice(num);	
	String n_id = bean.getN_id();
	int n_index=bean.getN_index();
%>
<html>
<h2>공지사항 수정</h2>
<head>
	<style>
		table {border: 1px solid; border-collapse:collapse; 
					width: 70%; text-align:center;}
		td{border: 1px solid;}
		thead{background:lightgray;}
		</style>
	</head>
<body>
<hr>
</body>
<form name="Frm" method="post" action ="notice_Proc.jsp?flag=update" enctype="multipart/form-data">
	<input type= "hidden" name = n_index value="<%=bean.getN_index()%>">
	<input type= "hidden" name = n_id value="<%=bean.getN_index()%>">
	<input type= "hidden" name = n_category value="<%=bean.getN_category()%>">
	<input type= "hidden" name = n_file_size value="<%=bean.getN_file_size()%>">	
		
		<table> 				
				<tr>
					<th>이 름</th>
					<%if(n_id=="m1" || n_id=="m2"|| n_id=="m3"){ %>
					<td>관리자</td><%}else{%><td>관리자아님</td><%}%>					
				</tr>
				
				<tr>
					<th>날 짜</th>
					<td><%=bean.getN_date() %></td>
				</tr>
				
				<tr>
					 <th> 제 목</th>
					 <td><input name=n_title  value=<%=bean.getN_title() %>></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
					<select name="n_category">
						<option><%=bean.getN_category()%></option>
						<option value="주문/결제">주문/결제</option>
						<option value="회원문의">회원</option>
						<option value="취소/교환/반품">취소/교환/반품</option>
						<option value="배송문의">배송</option>
						<option value="기타">기타</option>
					</select>
					</td>
				<tr>
					<th>내용</th>
					<td><input name="n_content" value="<%=bean.getN_content()%>"></td>
				</tr>
				<tr>
					  <th>첨부파일</th>
					  <td><%=bean.getN_file_name()%>
					  <input type="file" name="noticeFile"> 
					  </td>
				</tr>				
		</table>				
				<input type="submit" value="수정하기">
				<input type="button" value="작성취소" onClick="javascript:location.href='notice_list.jsp'">				
</form>
</html>