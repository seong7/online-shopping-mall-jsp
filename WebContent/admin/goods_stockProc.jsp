<%@page import="admin.StockBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.StockMgr"/>
<jsp:useBean id="bean" class="admin.StockBean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int p_code = Integer.parseInt(request.getParameter("p_code"));
		String p_name = request.getParameter("p_name");
		int st_enter_qty = Integer.parseInt(request.getParameter("st_enter_qty"));
		String st_exp_date = request.getParameter("st_exp_date");
		//String opname = request.getParameter("opname");
		//int opcode = Integer.parseInt(request.getParameter("opcode"));
		//StockBean bean = new StockBean();				
		bean.setP_code(p_code);
		bean.setSt_enter_qty(st_enter_qty);
		bean.setSt_exp_date(st_exp_date);
		mgr.insertStock(bean);		
%>
<script>
	location.href="goods_stock.jsp";
</script>