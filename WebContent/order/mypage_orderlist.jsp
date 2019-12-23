<%@page import="order.OrderDetailBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="orderMgr" class="order.OrderMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	
	
	<div id="mypage">

            <h1 class="title">주문관리</h1>
            
            <table class="mypage_table">
                <tr id="column_tr">
                    <th>주문번호</th>
                    <th>제품명</th>
                    <th>주문날짜</th>
                    <th>주문상태</th>
                    <th>주문방법</th>
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
					<td class="btn_td"><a href="#"><%=order.getO_index() %></a></td>
					<td class="btn_td"><a href="#"><%=pbean.getP_name()%></a></td>
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
	</div>
	
</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>



