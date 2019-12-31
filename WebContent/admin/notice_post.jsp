<%@ page contentType="text/html; charset=EUC-KR" %>

<%
		request.setCharacterEncoding("EUC-KR");
		String n_id = request.getParameter("n_id");
%>
<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%>
	
	<link rel="stylesheet" type="text/css" href="./css/notice_list.css"> 

	<div id="manager">
		<h1 class="title">공지사항</h1>
		
		<form name="postFrm" method="post" action="notice_Proc.jsp?flag=insert" enctype="multipart/form-data">		
			<h3 class="inner_title">공지사항 작성하기</h3>	

			<input type="hidden" name ="n_id" value="<%=n_id%>">		
			<table class="mgr_table verHead notice_view_table" > 	
				<tr>
					<th>작성자</th>
					<td><%=n_id%></td>
				</tr>
				
				<tr>
					<th>제 목</th>
					<td>
						<input id="notice_write_title" name="n_title">
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
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
	     			<th>첨부파일</th> 
	     			<td>
	     				<input type="file" name="noticeFile">
	     			</td>
				</tr>				
				
				<tr>
					<td id="input_td" colspan="2">
						<textarea name="n_content" rows="10" cols="20" wrap="hard"></textarea>
					</td>
				</tr>
				
			</table>	
			
			<div class="submit_wrapper">
				<input class="btn" type="submit" value="등록">
				<input class="btn" type="button" value="작성취소" onClick="javascript:location.href='notice_list.jsp'">	
			</div>
				
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		</form>

	</div>

	
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>

</body>
</html>