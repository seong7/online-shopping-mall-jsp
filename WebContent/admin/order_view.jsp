<!-- 관리자 order view 페이지 -->
<%@page import="order.UtilMgr"%>
<%@page import="order.OrderDetailBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<jsp:useBean id="cMgr" class="order.CartMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		int o_index = Integer.parseInt(request.getParameter("o_index"));
		//int o_index = 18; //확인용 데이터 
		String nowPage = request.getParameter("nowPage");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		String keyDate1 = request.getParameter("keyDate1");
		String keyDate2 = request.getParameter("keyDate2");
		String numPerPage = request.getParameter("numPerPage");
		
		
		
%>
<html>
<head>
<script>
function list() {//nowPage와 NumPerPage가지고 list.jsp로 이동 
	//기존에 action값이 지정이 되어있어도 수정 가능 
	document.listFrm.action = "order_list.jsp";
	document.listFrm.submit();
}

function confirmDel(){
	if(confirm("삭제하시겠습니까?")==true){
		document.listFrm.action = "orderDelete.jsp";
		document.listFrm.submit();
	}else{ //취소
		return;
	}
}
</script>
</head>
<body>
<div align="center"><br/>
<h2 >주문 상세 정보</h2>
<hr width="60%">
<h3>구매 및 배송정보</h3>
<form name="updateFrm" method="post" action="orderUpdate.jsp">
<table>
	<%
		Vector<OrderBean> olist = oMgr.getOrderDetail(o_index);
		for(int i =0; i<olist.size(); i++){
			OrderBean order = olist.get(i);
			String id = order.getO_id();
			MemberBean mbean = mMgr.getMember(id);
			int o_prod_amount = order.getO_prod_amount();
			int o_del_fee =order.getO_del_fee();
			int o_total_amount=order.getO_total_amount();
	%>
	<tr>
		<th>주문번호<th>
		<td><input name="o_index" readonly 
		value="<%=o_index%>"><td>
		<th>주문자 ID<th>
		<td><input name="o_id" readonly 
		value="<%=order.getO_id()%>"></td>
	</tr>
	<tr>
		<th>주문자명<th>
		<td><input name="NEME" readonly 
		value="<%=mbean.getNAME()%>"><td>
		<th>전화번호(주문자)<th>
		<td><input name="o_id" readonly 
		value="<%=mbean.getContact()%>"></td>
	</tr>
	<tr>
		<th>수령자명<th>
		<td><input name="o_recpt_name" 
		value="<%=order.getO_recpt_name()%>"><td>
		<th>전화번호(수령자)<th>
		<td><input name="o_recpt_contact"  
		value="<%=order.getO_recpt_contact()%>"><td>
	</tr>
	<tr>
		<th>주소<th>
		<td><input name="o_recpt_add" readonly="readonly" 
		value="<%=order.getO_recpt_add()%>"><td>
		<th>상세주소<th>
		<td><input name="o_recpt_add_det"  
		value="<%=order.getO_recpt_add_det()%>"></td>
	</tr>
	<tr>
		<th>배송요청사항<th>
		<td><input name="o_del_msg"  
		value="<%=order.getO_del_msg() %>"><td>
		<th>주문일시<th>
		<td><input name="o_date"  
		value="<%=order.getO_date() %>"><td>
	</tr>
	<tr>
		<th>상품금액<th>
		<td><input name="o_prod_amount"  
		value="<%=o_prod_amount%>"><td>
		<th>배송비<th>
		<td><input name="o_del_fee"  
		value="<%=o_del_fee%>"><td>
	</tr>
	<tr>
		<th>결재금액<th>
		<td><input name="o_total_amount"  
		value="<%=o_total_amount %>"><td>
		<th>결재방법<th>
		<td><input name="o_pay_method"  
		value="<%=order.getO_pay_method() %>"><td>
	</tr>

</table>

<hr width="60%">
<h3>주문정보</h3>
<table>
	<tr>
		<th>번호</th>
		<th>주문상품</th>
		<th>수량</th>
		<th>송장번호</th>
		<th>주문상태</th>
		<th>관리자 메모</th>
		<th>발송일</th>
	</tr>
	<%
		Vector<OrderDetailBean> dvlist = oMgr.getOrderCode(o_index);
		for(int j=0; j<dvlist.size(); j++){
			OrderDetailBean detailOrder = dvlist.get(j);
			int p_code = detailOrder.getP_code();
			ProductBean pbean = pMgr.getProduct(p_code);
	%>
	<tr>
		<td><%=j+1 %></td>
		<td><input name="p_name"  
		value="<%=pbean.getP_name() %>"></td>
		<td><input name="o_qyt"  
		value="<%=detailOrder.getO_qty() %>"></td>
		<td><input name="o_del_num"  
		value="<%=order.getO_del_num() %>"></td>
		<td><input name="o_status"  
		value="<%=order.getO_status() %>"></td>
		<td><input name="o_mgr_note"  
		value="<%=order.getO_mgr_note() %>"></td>
		<td><input name="o_del_date"  
		value="<%=order.getO_date() %>"></td>
	</tr>
	<%	}//---for
	}//---for %>
	</table>
	<table>
	<tr>
		<td><input type="button" value="리스트" onclick="location.href = 'javascript:list()'">
		<td><input type="submit" value="수정"></td>
		<td><input type="button" value="삭제" onclick="location.href = 'javascript:confirmDel()'">
		
	</tr>
	</table>
	</form>
</div>
<form name="listFrm">
	<input type="hidden" name="o_index" value="<%=o_index%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<%if(!(keyWord==null||keyWord.equals(""))){ %>
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<%}%>
	<%if((!(keyDate1==null||keyDate1.equals("")))&&
			(!(keyDate2==null||keyDate2.equals("")))){ %>
	<input type="hidden" name="keyDate1" value="<%=keyDate1%>">
	<input type="hidden" name="keyDate2" value="<%=keyDate2%>">
	<%}%>
</form>
</body>
</html>








