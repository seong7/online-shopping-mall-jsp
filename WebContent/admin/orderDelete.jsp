<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String nowPage = request.getParameter("nowPage");
		int o_index = Integer.parseInt(request.getParameter("o_index"));
		oMgr.deleteOrder(o_index);
		String url = "order_list.jsp?nowPage="+nowPage;
		response.sendRedirect(url);
%>
