<%@page import="Order.UtilMgr"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.OrderDetailBean"%>
<%@page import="Order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="Order.OrderMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//총 게시물 개수
		int numPerPage=10;//페이지당 레코드 개수(5,10,15,30 옵션추가)
		int pagePerBlock = 15;//페이지당 블럭 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지 
		int nowBlock = 1;//현재 블럭 
		
		//page에 보여줄 게시물 개수 값 
		if(request.getParameter("numPerPage")!=null&&
		!request.getParameter("numPerPage").equals("null")){
		numPerPage = UtilMgr.parseInt(request, "numPerPage");
		//numPerPage = Integer.parseInt(request.getParameter("numPerPage")); 사용가능 
		}

		int start = 0;//테이블에 게시물 시작 번호 
		int cnt = numPerPage;
		
		//검색에 필요한 변수 
		String keyField = "";
		String keyWord = "";
		String keyDate1 = "";
		String keyDate2 = "";
		
		//검색어 검색일때 
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//검색기간 검색일때 
		if(request.getParameter("keyDate1")!=null||
				request.getParameter("keyDate2")!=null){
			keyDate1 = request.getParameter("keyDate1");
			keyDate2 = request.getParameter("keyDate2");
				}
				
		//검색 후에 다시 처음 화면으로 
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
		keyField = "";  keyWord = "";
		}
		
		totalRecord = orderMgr.getTotalCount(keyField, keyWord, 
				keyDate1, keyDate2);
		//out.print(totalRecord);
		
		//nowPage를 요청한 경우
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		//테이블에 게시물 시작 번호 
		start = (nowPage*numPerPage) - numPerPage;

		//전체페이지 수(전체레코드 개수/페이지당 레코드 개수) 올림. 
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체 블럭수 (전체페이지 개수/블럭당 페이지 개수) 올림.
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재 블럭 (현재페이지수/ 블럭당 페이지 개수)올림. 
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<%=totalRecord %>
<%=keyField %>
<%=keyWord %>
<html>
<head>
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function dateCheck(){
		f=document.searchFrm;
		if(f.keyDate1.value.length=="" || f.keyDate1.value.length!==8){
			alert("기간을 올바르게 입력해주세요 ex) 20191217")
			f.keyDate1.focus();
			return;
		}
		if(f.keyDate2.value.length=="" || f.keyDate2.value.length!==8){
			alert("기간을 올바르게 입력해주세요 ex) 20191217")
			f.keyDate2.focus();
			return;
		}document.searchFrm.submit();
	}
	
	function list() {//리스트로 이동
		document.listFrm.action = "order_list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {//페이지당 보이는 개수
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "order_view.jsp";
		document.readFrm.submit();
	}
		
	function block(block) {//prev...or ...next시 nowPage값을 지정
			document.readFrm.nowPage.value = 
				<%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
		}
		
	function pageing(page) {//pageStart 값을 가져옴??
			document.readFrm.nowPage.value = page;
			document.readFrm.submit();
		}
</script>
</head>
<body>
<div align="center"><br/>
<form  name="searchFrm">
	<table>
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="o_id"> 주문자 ID</option>
    				<option value="o_index">주문번호</option>
    				<option value="o_status"> 주문상태</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="찾기" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
  		</tr>
  	</table>
  	<table>
  		<tr>
  		<td>기간검색</td>
		<td>
			<input name ="keyDate1" size="10" placeholder="20190101"> &nbsp; ~ &nbsp;
			<input name ="keyDate2" size="10" placeholder="20191231">			
			<input type="button" value="search" onClick="javascript:dateCheck()">
			<input type="hidden" name="nowPage" value="1">
		</td>
  		</tr>
  	</table>
  </form>
  	
 	<table>
 		<tr>
		<td align="right">
			<form name="npFrm" method="post">
					<select name="numPerPage" size="1" 
					onchange="numPerFn(this.form.numPerPage.value)">
    					<option value="5">5개 보기</option>
    					<option value="10" selected>10개 보기</option>
    					<option value="15">15개 보기</option>
    					<option value="30">30개 보기</option>
   				</select>
   			</form>
   			<!-- "10"으로 fix 된 값을 선택된 numPerPage값으로 유지 -->
   			<script>document.npFrm.numPerPage.value=
   				"<%=numPerPage%>"</script>
		</td>
	</tr>
	</table>
	
<hr width="60%">
<table>
	 <tr>
	 		<th>번호</th>
          <th>주문자 ID</th>
          <th>주문일시</th>
          <th>주문번호</th>
          <th>주문금액</th>
          <th>주문상태</th>
           <th>반품여부</th>
     </tr>
	<%
		Vector<OrderBean> vlist = 
		orderMgr.getOrderList(keyField, keyWord, 
				keyDate1, keyDate2, start, cnt);
		if(vlist.isEmpty()){
	%>
	<tr>
		<td colspan="5">
			검색결과가 없습니다.
		</td>
	</tr>
		<%} else{
			for(int i=0;i<vlist.size();i++){
			OrderBean order = vlist.get(i);
		%>
	<tr>
		<td><%=totalRecord-start-i %></td>
		<td><%=order.getO_id()%></td>
		<td><%=order.getO_date()%></td>
		<td><a href="javascript:read('<%=order.getO_index()%>')">
		<%=order.getO_index()%></a></td>
		<td><%=order.getO_total_amount()%></td>
		<td><%=order.getO_status()%></td>
	</tr>
		<%
			}//---for
		}//---else
				%>
	<tr>
		<td colspan="2"><br/><br/></td>
	</tr>
	</table>
	<table>
	<tr >
		<td>
		<%if(totalPage>0){ %>
				<!-- 이전 블럭 -->
				<%if(nowBlock>1){ %>
					<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
				<%} %>

				<!-- 페이징(블럭수 설정) -->
				<%
					//block시작번호 계산
					int pageStart = (nowBlock-1)*pagePerBlock+1; 
					//block끝 번호 계산
					int pageEnd = (pageStart+pagePerBlock)<totalPage? 
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
				%>
					<a href="javascript:pageing('<%=pageStart%>')">
					<%if(pageStart==nowPage){ %><font color="red"><%} %>
					[<%=pageStart %>]
					<%if(pageStart==nowPage){ %></font><%} %>
					</a>
				<%}//---for %>	
				<!-- 다음블럭 -->
				<%if(totalBlock>nowBlock){ %>
					<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
				<%} %>
			<%} %>
		</td>
	</tr>
</table>

<hr width="60%">
<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>

<form name="readFrm">
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="keyDate1" value="<%=keyDate1%>">
	<input type="hidden" name="keyDate2" value="<%=keyDate2%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
</form>

</div>
</body>
</html>