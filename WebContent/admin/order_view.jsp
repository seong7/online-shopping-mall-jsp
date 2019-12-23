<!-- ������ order view ������ -->
<%@page import="order.OrderDetailBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
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
		//int o_index = 18; //Ȯ�ο� ������ 
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
function list() {//nowPage�� NumPerPage������ list.jsp�� �̵� 
	//������ action���� ������ �Ǿ��־ ���� ���� 
	document.listFrm.action = "order_list.jsp";
	document.listFrm.submit();
}

function confirmDel(){
	if(confirm("order number <%=o_index%>�� �����Ͻðڽ��ϱ�?")==true){
		document.listFrm.action = "orderDelete.jsp";
		document.listFrm.submit();
	}else{ //���
		return;
	}
}
</script>
</head>


<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 
	
	
<div align="center"><br/>
<h2 >�ֹ� �� ����</h2>
<hr width="60%">
<h3>���� �� �������</h3>
<table>
	<%
		Vector<OrderBean> olist = oMgr.getOrderDetail(o_index);
		for(int i =0; i<olist.size(); i++){
			OrderBean order = olist.get(i);
			String oId = order.getO_id();
			MemberBean mbean = mMgr.getMember(oId);
	%>
	<tr>
		<th>�ֹ���ȣ<th>
		<td><%=order.getO_index() %><td>
		<th>�ֹ��� ID<th>
		<td><%=order.getO_id() %><td>
	</tr>
	<tr>
		<th>�ֹ��ڸ�<th>
		<td><%=mbean.getNAME() %><td>
		<th>��ȭ��ȣ(�ֹ���)<th>
		<td><%=mbean.getContact() %><td>
	</tr>
	<tr>
		<th>�����ڸ�<th>
		<td><input name="o_recpt_name" 
		value="<%=order.getO_recpt_name()%>"><td>
		<th>��ȭ��ȣ(������)<th>
		<td><input name="o_recpt_contact"  
		value="<%=order.getO_recpt_contact()%>"><td>
	</tr>
	<tr>
		<th>�ּ�<th>
		<td><input name="o_recpt_add" readonly="readonly" 
		value="<%=order.getO_recpt_add()%>"><td>
		<th>���ּ�<th>
		<td><input name="o_recpt_add_det"  
		value="<%=order.getO_recpt_add_det()%>"></td>
	</tr>
	<tr>
		<th>��ۿ�û����<th>
		<td><input name="o_del_msg"  
		value="<%=order.getO_del_msg() %>"><td>
		<th>�ֹ��Ͻ�<th>
		<td><input name="o_date"  
		value="<%=order.getO_date() %>"><td>
	</tr>
	<tr>
		<th>��ǰ�ݾ�<th>
		<td><input name="o_prod_amount"  
		value="<%=order.getO_prod_amount() %>"><td>
		<th>��ۺ�<th>
		<td><input name="o_del_fee"  
		value="<%=order.getO_del_fee() %>"><td>
	</tr>
	<tr>
		<th>����ݾ�<th>
		<td><input name="o_total_amount"  
		value="<%=order.getO_total_amount() %>"><td>
		<th>������<th>
		<td><input name="o_pay_method"  
		value="<%=order.getO_pay_method() %>"><td>
	</tr>

</table>

<hr width="60%">
<h3>�ֹ�����</h3>
<table>
	<tr>
		<th>��ȣ</th>
		<th>�ֹ���ǰ</th>
		<th>����</th>
		<th>�����ȣ</th>
		<th>�ֹ�����</th>
		<th>������ �޸�</th>
		<th>�߼���</th>
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
	<%}//---for
	}//---for%>
	</table>
	<table>
	<tr>
		<td><a href="javascript:list()" >����Ʈ</a></td>
		<td><a href="orderUpdate.jsp">����</a></td>
		<td><a href="javascript:confirmDel()">����</a></td>
		
	</tr>
	</table>
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

	</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
	</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>

</body>
</html>








