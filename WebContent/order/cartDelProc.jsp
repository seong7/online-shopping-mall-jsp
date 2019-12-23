<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class ="order.CartMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String p_codes[] = request.getParameterValues("fch");
		int p_code[] = new int[p_codes.length];
		for(int i=0; i<p_code.length;i++){
			p_code[i] = Integer.parseInt(p_codes[i]);
		}
		mgr.deleteCart(id, p_code);
		response.sendRedirect("cart.jsp");
%>
