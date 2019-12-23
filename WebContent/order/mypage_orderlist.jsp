<%@page import="Order.OrderDetailBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="orderMgr" class="Order.OrderMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	
	
	<div id="mypage">

            <h1 class="title">�ֹ�����</h1>
            
            <table class="mypage_table">
                <tr id="column_tr">
                    <th>�ֹ���ȣ</th>
                    <th>��ǰ��</th>
                    <th>�ֹ���¥</th>
                    <th>�ֹ�����</th>
                    <th>�ֹ����</th>
                </tr>
            <!-- �ֹ����� �������� -->
				<%
					Vector<OrderBean> vlist = orderMgr.getOrder(id);
					
					if(vlist.isEmpty()){
				%>
				<tr> 
					<tr>
						<td colspan="5">
						�ֹ��Ͻ� ��ǰ�� �����ϴ�.
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
	
</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>



