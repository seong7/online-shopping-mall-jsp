<%@page import="Product.StockBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Admin.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String p_name = request.getParameter("p_name");
		int p_date1 = Integer.parseInt(request.getParameter("p_date1"));
		int p_date2 = Integer.parseInt(request.getParameter("p_date2"));
		
		Vector<ProductBean> slist = mgr.searchproduct(p_name, p_date1, p_date2);	
%>
<%=slist.size() %>
<%=p_name %>
<%=p_date1 %>
<%=p_date2 %>

<html>
<head>
<body>
	<table border ="1">
		<tr>					
			<td>제품코드</td>
			<td>상품명</td>
			<td>상품가격</td>
			<td>등록일</td>
			<td>판매여부</td>
			<td>재고수량</td>
		</tr>			
			<% 
			for(int i=0; i<slist.size(); i++){
				ProductBean pbean = slist.get(i);
			%>
			<tr>			
			<td><%=pbean.getP_code() %></td>
			<td><%=pbean.getP_name() %></td>
			<td><%=pbean.getP_price() %></td>
			<td><%=pbean.getP_date() %></td>
			<td><%=pbean.getP_on_sale() %></td>
			<td><%=pbean.getSt_ava_qty() %></td>		
		</tr>
	<%}//--for %>
	</table>

</body>

</head>
</html>

