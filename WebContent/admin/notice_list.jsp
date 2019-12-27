<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//총게시물 개수
		int numPerPage = 10;//페이지당 레코드 개수 (5,10,15,30)
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭
		
		if(request.getParameter("numPerPage")!=null&&
				!request.getParameter("numPerPage").equals("null")){
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		int start = 0;
		int cnt = numPerPage;
		
		//검색에 필요한 변수
		String keyField = "" , keyWord = "";
		
		//검색일때 
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//검색 후에 다시 처음화면으로 요청
		if(request.getParameter("reload")!=null&&
				request.getParameter("reload").equals("true")){
			keyField = "";  keyWord = "";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		
		//nowPage를 요청한 경우
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		//테이블 시작 번호
		start = (nowPage*numPerPage)-numPerPage;
		
		//전체페이지수 (전체레코드개수/페이지당 레코드 개수) 올림.
		 totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭수 (전체페이지수/블럭당 페이지 개수) 올림.
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭 (현재페이지수/블럭당 페이지 개수) 올림.
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
 %>
 
<html>
<head>
<title>
</title>
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	
	function list() {
		document.listFrm.action = "notice_list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "notice_view.jsp";
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();	
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();	
	}
</script>
</head>
<body >
<div>
<h2>공지사항</h2>
<hr/>
<table>
	<tr>
		<td align="center" colspan="2">
		<%
				Vector<NoticeBean> vlist = mgr.getNoticeList(keyField, keyWord, start, cnt);
				int listSize = vlist.size();
				if(vlist.isEmpty()){
					out.println("등록된 게시물이 없습니다.");
				}else{
		%>
		<table cellspacing="0">
			<tr align="left">
				<td width="100">번 호</td>
				<td width="250">제 목</td>
				<td width="100">이 름</td>
				<td width="150">날 짜</td>
			</tr>
		<%
				for(int i=0;i<numPerPage;i++){
					if(i==listSize) break; 
					NoticeBean bean = vlist.get(i);
					int n_index = bean.getN_index ();
					String n_id = bean.getN_id();
					String n_category = bean.getN_category ();
					String n_title = bean.getN_title();
					String n_content = bean.getN_content ();
					String n_date = bean.getN_date();
					String n_file_name = bean.getN_file_name ();
					int n_file_size = bean.getN_file_size();
		%>
		<tr align="center">
			<td><%=totalRecord-start-i%></td>
			<td align="left">
			<a href="javascript:read('<%=n_index%>')"><%=n_title%></a>
			<%if(n_file_name!=null&&!n_file_name.equals("")){%>
			<%}%>
			</td>
			<td><%=n_id%></td> 
			<td><%=n_date%></td>
		</tr>
		<%}//---for%>	
		</table>
		<%}//----if-else%>	
		</td>
	</tr>
	<tr>
		<td >
		<%if(totalPage>0){ %>
			<!-- 이전 블럭 -->
			<%if(nowBlock>1){%>
				<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
			<%}%>
			<!-- 페이징 -->
			<% 
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart+pagePerBlock)<totalPage?
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
			%>
				<a href="javascript:pageing('<%=pageStart%>')">
				<%if(pageStart==nowPage){%><font color="red"><%}%>
					[<%=pageStart%>]
				<%if(pageStart==nowPage){%></font><%}%>
				</a>
			<%}//---for%>
			<!-- 다음 블럭 -->
			<%if(totalBlock>nowBlock){%>
				<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
			<%}%>
		<%}%>
		</td>	
	</tr>
	<tr align="right">
		<td><input type="button" value="글쓰기" onclick="location.href='notice_post.jsp'">
	</tr>
</table>
<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>
<form name="readFrm">
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
</form>
</div>
</body>
</html>
