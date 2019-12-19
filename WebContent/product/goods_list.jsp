<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mgr" class="product.ProductMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	
	String listName = null;
	String flag = request.getParameter("list");
	
	switch (flag){
		case "all":
			listName ="전체상품";
			break;
		case "best":
			listName ="베스트상품";
			break;		
		case "new":
			listName ="신상품";
			break;			
		/*case "review":
			listName ="리뷰순";
			break;*/
		/*case "priceH":
			listName ="높은 가격순";
			break;*/
		/*case "review":
			listName ="낮은 가격순";
			break;*/
	}
	
	Vector<ProductBean> vlist = mgr.getGoodsList(flag);
	
%>
<script>
	
</script>
<jsp:include page="../top.jsp"/>
<main>
제품 수 : <%=vlist.size()%>

	<h3><%=listName %></h3>
	
		<table  border="1">					
			<tr align="center">
			<%
			for (int i=0; i<vlist.size(); i++) {ProductBean pbean = vlist.get(i);
			%>
					<td>
						<a href="#">
							<img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">
						</a><br/>
						<a href="#">
							<span>
								<%=pbean.getP_name()%>
							</span>
						</a><br/>
							<span><%=pbean.getP_price()%>원</span>
					</td>	
					<%} //--for%>					
			</tr>								
		</table>

</main>
	
	<jsp:include page="../bottom.jsp"/>
	
	
</body>
</html>