<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		
		String id = (String)session.getAttribute("idKey");
		String o_recpt_name = request.getParameter("o_recpt_name");
		String o_recpt_contact = request.getParameter("o_recpt_contact");
		String o_recpt_zipcode = request.getParameter("o_recpt_zipcode");
		String o_recpt_add = request.getParameter("o_recpt_add");
		String o_recpt_add_det = request.getParameter("o_recpt_add_det");
		String o_del_msg = request.getParameter("o_del_msg");
		int o_prod_amount = Integer.parseInt(request.getParameter("o_prod_amount"));
		int o_del_fee =Integer.parseInt(request.getParameter("o_del_fee"));
		int o_total_amount = Integer.parseInt(request.getParameter("o_total_amount"));
		String o_pay_method = request.getParameter("o_pay_method");
		
		bean.setO_id("u1");
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
		mgr.insertOrder(bean);
		
%>
<%=id %><br/>
<%=o_recpt_name %><br/>
<%=o_recpt_contact %><br/>
<%=o_recpt_zipcode %><br/>
<%=o_recpt_add %><br/>
<%=o_recpt_add_det %><br/>
<%=o_del_msg %><br/>
<%=o_prod_amount %><br/>
<%=o_del_fee %><br/>
<%=o_total_amount %><br/>
<%=o_pay_method %><br/>
