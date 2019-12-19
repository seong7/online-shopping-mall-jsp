<%@page import="Member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="admin.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr" class="Member.MemberMgr"/>
<jsp:useBean id="aMgr" class="admin.AdminMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0;
	int numPerPage = 5;
	int pagePerBlock = 10;
	int totalPage = 10;
	int totalBlock = 0;
	int nowPage = 1;
	int nowBlock= 1;
	
	if(request.getParameter("numPerPage")!=null&&!request.getParameter("numPerPage").equals("null")){
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
			
			totalRecord = aMgr.getTotalCount(keyField, keyWord);
			//out.print(totalRecord);
			
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
</head>
<body>
			<h2>회원정보</h2>
			<hr>
			<h3>회원정보 검색</h3>
		<table border="1">
			<tr>
				<th>검색어</th>
				<td>
					<select>
					<option value ="1">ID</option>
					<option value ="2">이름</option>
					<option value ="3">email</option>
					<option value ="4">회원가입일...</option>
					</select>
					<input id="search">
					<input id="search_btn" type="button" value="검색">
				</td>
			</tr>
		</table>
			<h3>회원정보LIST</h3>
		<%Vector<MemberBean> vlist = mMgr.getMemberList();%>
		<table border="1">
		<tr align="center"> 
			<th>ID</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>이메일</th> 
			<th>연락처</th> 
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>가입일</th>
		</tr>
		<%
			for(int i=0; i<vlist.size(); i++){
				MemberBean mBean = vlist.get(i);
		%>
		<tr>
			<td><%=mBean.getId()%></td>
			<td><%=mBean.getNAME()%></td>
			<td><%=mBean.getBirthday()%></td>
			<td><%=mBean.getEmail() %></td>
			<td><%=mBean.getContact() %></td>
			<td><%=mBean.getZipcode() %></td>
			<td><%=mBean.getAddress()%></td>
			<td><%=mBean.getAddress_detail() %></td>
			<td><%=mBean.getJoin_date()%></td>
		</tr>
		<%}//---for%>
		</table>
</body>
</html>