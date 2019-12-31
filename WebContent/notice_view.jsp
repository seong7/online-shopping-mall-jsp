<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_style.css">
	<link rel="stylesheet" type="text/css" href="admin/css/notice_list.css">

	<%@ include file="../top.jsp" %>
	
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

	<main>
	
		<div id="manager">
		<h1 class="title">공지사항</h1>
			<form name="Frm" method="post" action="notice_update.jsp" enctype="multipart/form=data">			
			<input type= "hidden" name="num" value=<%=bean.getN_index()%>>
			
			<h3 class="inner_title"></h3>	
				
				
				<table class="mgr_table verHead notice_view_table" > 
					<tr> 
						<th>작성자</th>
						<%if(n_id.equals("m1") || n_id.equals("m2") || n_id.equals("m3")){ %>
						<td>관리자</td><%}else{%>
						<td>관리자아님</td><%} %>					
					</tr>
					<tr>
						<th>작성일</th>
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
						<td id="input_td" colspan="2">
							<%
								if(!n_file_name.equals("")){
							%>
								<img src="./img/notice/<%=n_file_name%>">
							<%
								}if(!bean.getN_content().equals("")){
							%>
								<textarea rows="10" cols="90" wrap="hard"><%=bean.getN_content()%></textarea>
							<%	
								}
							%>
						</td>
					</tr>
				</table>									 
				
				<div class="submit_wrapper">
					<input class="btn" type="button" value="목록" onclick="location.href ='notice_list.jsp'">
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
		
		
	</main>


</div>
<!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div>
<!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
<%@ include file="../bottom.jsp"%>

</body>
</html>

