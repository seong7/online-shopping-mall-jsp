<!-- goods_view.jsp���� p_code, ���� �Ѱܿ��� -->
<%@page import="Order.CartBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <jsp:useBean id="pMgr" class="Product.ProductMgr"/>
 <jsp:useBean id="cMgr" class="Order.CartMgr"/>
 <%
 		request.setCharacterEncoding("EUC-KR");
 		String id = (String)session.getAttribute("idKey");
 		//String id = "u1";//Ȯ�ο� ������
 		int p_code = 1;//Ȯ�ο� ������
 		int o_del_fee = 2500;
 		if(id==null){%>
 			<script>
 			alert("�α��� ������ �����ϴ�.");
 			document.location.href="${pageContext.request.contextPath}/index.jsp";
 			</script>
 		<%}%>
 
<link rel="stylesheet" type="text/css" href="./css/cart.css">

<jsp:include page="../top.jsp"/> 
		<!--******************-->
        <!--�۾� �� ���� ����-->
        <!--******************-->        	
         <main>
	<div align="center">
		<h2 class="layout-page-title">��ٱ���</h2>
			<p>�ֹ��Ͻ� ��ǰ�� �� ������ ��Ȯ�ϰ� Ȯ���� �ּ���.</p>
	<form name="frm" action="order.jsp">
		<input type="hidden" name="fch" value="0">
		<table border="1" id="cart_table">
		<tr>
			<th><input type="checkbox" name="allCh" 
			></th>
			<th>��ǰ����</th>
			<th>��ǰ��</th>
			<th>����</th>
			<th>��ǰ�ݾ�</th>
		</tr>
		<%
			Vector<CartBean> clist = cMgr.getCart(id);
				for(int i= 0; i<clist.size();i++){	
					CartBean cart = clist.get(i);
					p_code = cart.getP_code();
					ProductBean product = pMgr.getProduct(p_code);
					String p_main_pht_name = product.getP_main_pht_name();
			 		String p_name = product.getP_name();
					int p_price = product.getP_price();
					int c_qty = cart.getC_qty();
					int totalPrice = p_price* c_qty;
		%>
		<tr>
			<td><input type="checkbox" name="fch" 
			value="<%=p_code%>" ></td>
			<td><img alt="��ǰ����" src="${pageContext.request.contextPath}
			/img/product/ready.gif"></td>
			<td><%=p_name %><br><span><%=p_price %></span>��</td>
		
			<td><input type="button" value="-" 
			>
			<input type="text" id="c_qty" value=<%=c_qty%>>
			<input type="button" value="+" 
			></td>
			<td><%=totalPrice%></td>
		</tr>
				<%} %>	
		</table>
		<br>
		<table border="1">
		<tr>
			<th>��ǰ�ݾ�</th>
			<th>��ۺ�</th>
			<th>���������ݾ�</th>
		</tr>
		<tr>
			<td id="sumtext">0</td>
			<td><%=o_del_fee %></td>
			<td>�����ݾ�</td>
			</tr>
		</table>
		<br>
		<input type="button" name="btn1" value="���� �����ϱ�" id="delete_product"
		disabled style ="width:150px" 
		onclick="location.href='javascript:confirmDel()'">
		<input type="submit" name="btn2" value="���� �ֹ��ϱ�" id="order_product"
		disabled	style ="width:150px">
		<input type="hidden" name="id" value="<%=id %>">
		</form>
	</div>
	<script src="js/cart.js"></script>
</main>
		<jsp:include page="../bottom.jsp"/>
		</body>
</html>