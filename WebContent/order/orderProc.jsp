<!--주문내역 저장 및 카트 삭제  -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="cmgr" class="order.CartMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<jsp:useBean id="odbean" class="order.OrderDetailBean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		
		String o_id = request.getParameter("o_id");
		String o_recpt_name = request.getParameter("o_recpt_name");
		String o_recpt_contact = request.getParameter("o_recpt_contact");
		String o_recpt_zipcode = request.getParameter("o_recpt_zipcode");
		String o_recpt_add = request.getParameter("o_recpt_add");
		String o_recpt_add_det = request.getParameter("o_recpt_add_det");
		String o_del_msg = request.getParameter("o_del_msg");
		String o_status = request.getParameter("o_status");
		int o_prod_amount = Integer.parseInt(request.getParameter("o_prod_amount"));
		int o_del_fee =Integer.parseInt(request.getParameter("o_del_fee"));
		int o_total_amount = Integer.parseInt(request.getParameter("o_total_amount"));
		String o_pay_method = request.getParameter("o_pay_method");
		String[] o_qty = request.getParameterValues("o_qty");
		String[] p_code = request.getParameterValues("p_code");
		int countPart =Integer.parseInt(request.getParameter("countPart"));
		String mName =request.getParameter("mName");
		System.out.print(mName);
		
		//order insert
		bean.setO_id(o_id);
		bean.setO_recpt_name(o_recpt_name);
		bean.setO_recpt_contact(o_recpt_contact);
		bean.setO_recpt_zipcode(o_recpt_zipcode);
		bean.setO_recpt_add(o_recpt_add);
		bean.setO_recpt_add_det(o_recpt_add_det);
		bean.setO_del_msg(o_del_msg);
		bean.setO_prod_amount(o_prod_amount);
		bean.setO_del_fee(o_del_fee);
		bean.setO_total_amount(o_total_amount);
		bean.setO_pay_method(o_pay_method);
		bean.setO_status(o_status);
		boolean orderResult=mgr.insertOrder(bean);
		
		//orderDetail insert
		int o_qtys[] = new int[countPart];
		int p_codes[] = new int[countPart];
		for(int i =0; i<countPart;i++){
			o_qtys[i] = Integer.parseInt(o_qty[i]);
			p_codes[i] = Integer.parseInt(p_code[i]);
		}
		odbean.setO_qty(o_qtys);
		odbean.setP_code(p_codes);
		boolean orderDetailResult=mgr.insertDetailOrder(odbean);
		
		//cart Delete
		cmgr.deleteCart(o_id, p_codes);
		
		String msg = "";
		if(orderResult&&orderDetailResult){
			//msg = "결제가 완료되었습니다.";
			/* mName = URLEncoder.encode(mName,"utf-8"); */
			/* System.out.print(mName); */
			/* response.sendRedirect("order_end.jsp?mName="+mName+"&o_total_amount="+o_total_amount); */
		%>
		
			<html>
				<form id="order_end_frm" name="order_end_frm" method="post" action="order_end.jsp">
					<input type="hidden" name="mName" value="<%=mName %>" >
					<input type="hidden" name="o_total_amount" value="<%=o_total_amount %>" >
				</form>
			</html>
			
			<script>
				const frmToSubmit = document.getElementById('order_end_frm');
				frmToSubmit.submit();
			</script>
			
		<%
		}else{
			msg = "결제실패";
			%>
		<script>
			alert("<%=msg%>");
		</script>
		<%
			response.sendRedirect("order.jsp");
		}
		%>
		

