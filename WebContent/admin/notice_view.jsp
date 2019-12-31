<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%>
	
	<link rel="stylesheet" type="text/css" href="./css/notice_list.css"> 
	
<%
		request.setCharacterEncoding("EUC-KR");
		int n_index = UtilMgr.parseInt(request, "n_index");
		String nowPage = request.getParameter("nowPage");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		String numPerPage = request.getParameter("numPerPage");	
		NoticeBean bean = mgr.getNotice(n_index);
		String n_id = bean.getN_id();
		String n_file_name = bean.getN_file_name();
		int n_file_size = bean.getN_file_size();
		//세션에 읽어온 게시물을 저장 : 삭제, 수정, 답변
		session.setAttribute("bean", bean);
%>


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

	<div id="manager">
		<h1 class="title">공지사항</h1>
			<form name="Frm" method="post" action="notice_update.jsp" enctype="multipart/form=data">			
				<input type= "hidden" name = num value=<%=bean.getN_index()%>>
				
				<h3 class="inner_title"></h3>	
				
				
					<table class="mgr_table verHead notice_view_table" > 
						<tr> 
							<th>작성자</th>
							<%if(n_id.equals("m1") || n_id.equals("m2") || n_id.equals("m3")){ %>
							<td>관리자</td><%}else{%>
							<td>관리자아님</td><%} %>					
						</tr>
						<tr>
							<th>작성날짜</th>
							<td><%=bean.getN_date()%></td>
						</tr>		
						<tr> 
							<th> 제 목</th>
						    <td><%=bean.getN_title()%></td>
						</tr>
						<tr> 
							<th> 카테고리</th>
						    <td><%=bean.getN_category()%></td>
						</tr>
						
						 <tr>
							<td colspan="2">
								<img src="../img/notice/<%=n_file_name%>">
								<br/><%=bean.getN_content()%>
							</td>
						</tr>
					</table>								 
				
						
				
				<div class="submit_wrapper">
					<input class="btn" type="button" value="목록" onclick="location.href ='notice_list.jsp'">
					<input class="btn" type="submit" value="수정" >
					<input class="btn" id="delete" type="button" value="글 삭제" onclick="location.href='notice_Proc.jsp?flag=delete&n_index=<%=n_index%>'">
				</div>						  
										
			</form>
		
			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="n_file_name">
			</form>
			<form name="listFrm" >
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
				<%if(!(keyWord==null||keyWord.equals(""))){ %>
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
				<input type="hidden" name="keyField" value="<%=keyField%>">
				<%} %>
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

