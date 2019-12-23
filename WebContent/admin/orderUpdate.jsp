<!-- order_view.jsp 에서 수정삭제 기능 -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		request.setCharacterEncoding("EUC-KR");
				
%>
