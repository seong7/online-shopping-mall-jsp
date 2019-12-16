<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="Product.UtilMgr"%>
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="pMgr" class="Product.ProductMgr" />
<%
	Vector<ProductBean> vlist = pMgr.getAllList();
%>

<html>
<head>
<body>
	<table width="60%" border="1">
		<tr>
			<td>
				<table>
					<tr>
						<td>이름</td>
						<td>가격</td>
						<td>사진</td>
					</tr>
					<%
						for (int i = 0; i < vlist.size(); i++) {
							ProductBean pbean = vlist.get(i);
					%>
					<tr align="center">
						<td><%=pbean.getP_name()%></td>
						<td><%=pbean.getP_price()%></td>
						<td><%=pbean.getP_main_pht_name()%></td>
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