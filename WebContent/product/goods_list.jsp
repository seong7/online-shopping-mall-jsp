<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="Product.UtilMgr"%>
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="Mgr" class="Product.ProductMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	Vector<ProductBean> vlist = Mgr.getAllList();
	
%>
<%=vlist.size()%>

<html>
<head>
<body>
	<table width="60%" border="1">
		<tr>
			<td>
				<table>
					 
					<%
						for (int i=0; i<vlist.size(); i++) {
							ProductBean pbean = vlist.get(i);
					%>
					<tr align="center">
						<td>
						<img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">
						</td>
						<td><%=pbean.getP_name()%></td>
						<td><%=pbean.getP_price()%>¿ø</td>
						
					</tr>

					<%
						} //--for
					%>

				</table>
			</td>
		</tr>

	</table>

</body>
</head>
</html>