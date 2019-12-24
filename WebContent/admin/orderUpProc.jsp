<!-- order_view.jsp 수정 기능 -->
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		bean.setO_recpt_name(request.getParameter("o_recpt_name"));
		bean.setO_recpt_contact(request.getParameter("o_recpt_contact"));
		bean.setO_recpt_add(request.getParameter("o_recpt_add"));
		bean.setO_recpt_add_det(request.getParameter("o_recpt_add_det"));
		bean.setO_del_msg(request.getParameter("o_del_msg"));
		bean.setO_date(request.getParameter("o_date"));
		int o_prod_amount = UtilMgr.parseInt(request, "o_prod_amount");
		bean.setO_prod_amount(Integer.parseInt(request.getParameter("o_prod_amount")));
		bean.setO_del_fee(Integer.parseInt(request.getParameter("o_del_fee")));
		bean.setO_total_amount(Integer.parseInt(request.getParameter("o_del_fee")));
		bean.setO_pay_method(request.getParameter("o_pay_method"));
		bean.setO_mgr_note(request.getParameter("o_mgr_note"));
		bean.setO_status(request.getParameter("o_status"));
		bean.setO_del_num(request.getParameter("o_del_num"));
		bean.setO_del_date(request.getParameter("o_del_date"));
		int o_index = Integer.parseInt(request.getParameter("o_index"));
		bean.setO_index(o_index);
		String msg = "";
		boolean result = mgr.updateOrder(bean);
		if(result){
			msg = "수정이 완료되었습니다";
		}else{
			msg = "수정에 실패하였습니다.";
		}
		
		
%>
<script>
	alert("<%=msg%>");
	history.back();
</script>