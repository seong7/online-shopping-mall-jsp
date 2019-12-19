<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="Mgr" class="product.ProductMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	Vector<ProductBean> vlist = Mgr.getAllList();
	Vector<ProductBean> blist = Mgr.getBestList();
	Vector<ProductBean> nlist = Mgr.getNewList();	
	Vector<ProductBean> rlist = Mgr.getReviewList();
	Vector<ProductBean> phlist = Mgr.getHighList();
	Vector<ProductBean> pllist = Mgr.getLowList();
	
	String flag = request.getParameter("list");
%>
<script>
	console.log('"<%=flag%>"');
</script>
<!-- <%=vlist.size()%>
<%=blist.size()%>
<%=nlist.size()%>
<%=rlist.size()%>
<%=phlist.size()%>
<%=pllist.size()%> -->

<jsp:include page="../top.jsp"/>

<main>
	
	<h3>전체상품</h3>
		<table  border="1">					
			<tr align="center">
	<%
	for (int i=0; i<vlist.size(); i++) {ProductBean pbean = vlist.get(i);
	%>
					<td><img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">	<br/>
					<%=pbean.getP_name()%><br/><%=pbean.getP_price()%>원</td>	
					<%} //--for%>					
			</tr>								
		</table>
	<h3>베스트상품</h3>
		<table  border="1">					
			<tr align="center">
	<%
	for (int i=0; i<blist.size(); i++) {ProductBean pbean = blist.get(i);
	%>
					<td><img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">	<br/>
					<%=pbean.getP_name()%><br/><%=pbean.getP_price()%>원</td>	
					<%} //--for%>					
			</tr>								
		</table>
	<h3>신상품</h3>
		<table  border="1">					
			<tr align="center">
	<%
	for (int i=0; i<nlist.size(); i++) {ProductBean pbean = nlist.get(i);
	%>
					<td><img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">	<br/>
					<%=pbean.getP_name()%><br/><%=pbean.getP_price()%>원</td>	
					<%} //--for%>					
			</tr>								
		</table>
	<h3>리뷰상품</h3>
		<table  border="1">					
			<tr align="center">
	<%
	for (int i=0; i<rlist.size(); i++) {ProductBean pbean = rlist.get(i);
	%>
					<td><img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">	<br/>
					<%=pbean.getP_name()%><br/><%=pbean.getP_price()%>원</td>	
					<%} //--for%>					
			</tr>								
		</table>
	<h3>가격높은상품</h3>
		<table  border="1">					
			<tr align="center">
	<%
	for (int i=0; i<phlist.size(); i++) {ProductBean pbean = phlist.get(i);
	%>
					<td><img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">	<br/>
					<%=pbean.getP_name()%><br/><%=pbean.getP_price()%>원</td>	
					<%} //--for%>					
			</tr>								
		</table>
	<h3>가격낮은상품</h3>
		<table  border="1">					
			<tr align="center">
	<%
	for (int i=0; i<pllist.size(); i++) {ProductBean pbean = pllist.get(i);
	%>
					<td><img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">	<br/>
					<%=pbean.getP_name()%><br/><%=pbean.getP_price()%>원</td>	
					<%} //--for%>					
			</tr>								
		</table>
		
	</main>
	
	<jsp:include page="../bottom.jsp"/>
	
	
</body>
</html>