<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="Order.OrderMgr"/>
<jsp:useBean id="bean" class="Order.OrderBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		System.out.println(bean.getO_total_amount());
		mgr.insertOrder(bean);	
%>
