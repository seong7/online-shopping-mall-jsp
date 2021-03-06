<%@page import="order.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="order.OrderDetailBean"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="order.OrderMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>

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

<script type="text/javascript">
	
	function block(block) {//prev...or ...next시 nowPage값을 지정
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}

</script>

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 


	<div id="manager">
		<h1 class="title">주문관리</h1>
		
		<form  name="searchFrm">
		
		<h3 class="inner_title">주문정보 검색</h3>
		
		<table class="mgr_table verHead">
 			<tr>
 				<th>
 					분류별 검색
 				</th>
	  			<td>
	   				<select id="m_select" name="keyField">
	    				<option value="o_id"> 주문자 ID</option>
	    				<option value="o_index">주문번호</option>
	    				<option value="o_status"> 주문상태</option>
	   				</select>
	   				<input name="keyWord">
	   				<input id="search_btn" type="button"  value="검색" onClick="javascript:check()">
	   				<input type="hidden" name="nowPage" value="1">
	  			</td>
	  		</tr>
	  		<tr>
	  			<th>기간검색</th>
				<td>
					<input name ="keyDate1" placeholder="20190101"> &nbsp; ~ &nbsp;
					<input name ="keyDate2" placeholder="20191231">			
					<input id="search_btn" type="button" value="검색" onClick="javascript:dateCheck()">
					<input type="hidden" name="nowPage" value="1">
				</td>
	  		</tr>
  	</table>
  </form>
  	

	<form id="order_number_frm" name="npFrm" method="post">
			<select name="numPerPage"
			onchange="javascript:numPerFn(this.form.numPerPage.value)">
					<option value="5">5개 보기</option>
					<option value="10" selected>10개 보기</option>
					<option value="15">15개 보기</option>
					<option value="30">30개 보기</option>
			</select>
	</form>
	<!-- "10"으로 fix 된 값을 선택된 numPerPage값으로 유지 -->
	<script>document.npFrm.numPerPage.value=
		"<%=numPerPage%>"</script>

	<div>
		<h3 id="order_list_title" class="inner_title" >주문 리스트</h3>
		<table class="mgr_table horHead">
			 <tr>
			 		<th>번호</th>
		          <th>주문번호</th>
		          <th>주문자 ID</th>
		          <th>주문일시</th>
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
				<td colspan="7">
					검색결과가 없습니다.
				</td>
			</tr>
				<%} else{
					for(int i=0;i<vlist.size();i++){
					OrderBean order = vlist.get(i);
					int o_total_amount = order.getO_total_amount();
				%>
			<tr>
				<td><%=totalRecord-start-i %></td>
				<td class="btn_td"><a class="order_num_btn" href="javascript:read('<%=order.getO_index()%>')">
				<%=order.getO_index()%></a></td>
				<td><%=order.getO_id()%></td>
				<td><%=order.getO_date()%></td>
				<td><%=UtilMgr.monFormat(o_total_amount)%>원</td>
				<td><%=order.getO_status()%></td>
				<td></td>
			</tr>
				<%
					}//---for
				}//---else
						%>
		</table>
	</div>	
		<table  class="pagination_tb">
			<tr>
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
								<span class="page_btn">
									<%if(pageStart==nowPage){ %><span id="nowPage_btn"><%} %>
									
									<%=pageStart %>
									
									<%if(pageStart==nowPage){ %></span><%} %>
								</span>
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

		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>

		<form name="readFrm">
			<input type="hidden" name="o_index">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
			<input type="hidden" name="keyDate1" value="<%=keyDate1%>">
			<input type="hidden" name="keyDate2" value="<%=keyDate2%>">
			<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
		</form>


</div>

</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>

<script type="text/javascript" src="./js/order_list.js"></script>

</body>
</html>