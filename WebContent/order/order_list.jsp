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
		int cnt = 5;
		
		//검색에 필요한 변수 
		String keyField = "";
		String keyWord = "";
		
		//검색일때 
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
				
		//검색 후에 다시 처음 화면으로 
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
		keyField = "";  keyWord = "";
		}
		
		totalRecord = orderMgr.getTotalCount(keyField, keyWord);
		//out.print(totalRecord);

%>
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
	
	function list() {//리스트로 이동
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {//페이지당 보이는 개수
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
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
	<table  width="600" cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> 주문자 ID</option>
    				<option value="subject">주문번호</option>
    				<option value="content"> 주문상태</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="찾기" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
</form>

<table>
	 <tr>
          <th>번호</th>
          <th>주문자 ID</th>
          <th>주문일시</th>
          <th>주문번호</th>
          <th>제품명</th>
          <th>주문금액</th>
          <th>주문상태</th>
           <th>반품여부</th>
     </tr>
	<%
		Vector<OrderBean> vlist = 
		orderMgr.getOrderList(keyField, keyWord, start, cnt);
		if(vlist.isEmpty()){
	%>
	<tr>
		<td colspan="5">
			주문하신 물품이 없습니다.
		</td>
	</tr>
		<%} else{
			for(int i=0;i<vlist.size();i++){
			OrderBean order = vlist.get(i);
			int o_index = order.getO_index();
			%>
			<tr>
				<td><%=totalRecord-start-i %></td>
					<td><%=order.getO_id()%></td>
					<td><%=order.getO_date()%></td>
					<td><%=order.getO_index()%></td>
					<%
					Vector<OrderDetailBean> dvlist= orderMgr.getOrderCode(o_index);
					for(int j=0;j<dvlist.size();j++){
					OrderDetailBean detailOrder = dvlist.get(j);
					int p_code = detailOrder.getP_code();
					ProductBean pbean = pMgr.getProduct(p_code);
					%>
					<td><%=pbean.getP_name() %></td>
					<td><%=order.getO_total_amount()%></td>
					<td><%=order.getO_status()%></td>
			</tr>
			<%
						}//---for
					}//---for
				}//---else
				%>
	<tr>
		<td></td>
	</tr>
</table>
</div>
</body>
</html>