<%@page import="Order.OrderDetailBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="orderMgr" class="Order.OrderMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>
<%
		String id = (String)session.getAttribute("idKey");
		/* if(session.getAttribute("idKey")==null){
			String msg = "로그인이 필요한 페이지 입니다.";
			response.sendRedirect("/online-shopping-mall/index.jsp");
		} */
%>

<jsp:include page="../top.jsp"/>
<style>
table {border: 1px solid; border-collapse:collapse; 
			width: 70%; text-align:center;}
td{border: 1px solid;}
thead{background:lightgray;}
</style>


<table>
	<thead>
	<tr>
		<td colspan="5">주문내역</td>
	</tr>
	</thead>
	<tr>
		<td>주문번호</td>
		<td>제품명</td>
		<td>주문날짜</td>
		<td>주문상태</td>
		<td>주문방법</td>
	</tr>
<!-- 주문내역 가져오기 -->
		<%
			Vector<OrderBean> vlist = orderMgr.getOrder(id);
			
			if(vlist.isEmpty()){
		%>
		<tr> 
			<tr>
				<td colspan="5">
				주문하신 물품이 없습니다.
				</td>
			</tr>
		<%} else{
			for(int i=0;i<vlist.size();i++){
				OrderBean order = vlist.get(i);
				int o_index = order.getO_index();
				Vector<OrderDetailBean> dvlist= orderMgr.getOrderCode(o_index);
				for(int j=0;j<dvlist.size();j++){
					OrderDetailBean detailOrder = dvlist.get(j);
					int p_code = detailOrder.getP_code();
					ProductBean pbean = pMgr.getProduct(p_code);
		%>			
		<tr>
			<td><%=order.getO_index() %></td>
			<td><%=pbean.getP_name()%></td>
			<td><%=order.getO_date()%></td>
			<td><%=order.getO_status()%></td>
			<td><%=order.getO_pay_method()%></td>
		</tr>
		<%			
				}//---for
			}//---for
		}//---else
		%>
</table>
</body>
</html>



