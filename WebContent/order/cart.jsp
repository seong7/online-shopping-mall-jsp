<!-- goods_view.jsp에서 p_code, 수량 넘겨오기 -->
<%@page import="order.CartBean"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <jsp:useBean id="pMgr" class="product.ProductMgr"/>
 <jsp:useBean id="cMgr" class="order.CartMgr"/>
 <%
 		request.setCharacterEncoding("EUC-KR");
 		String id = (String)session.getAttribute("idKey");
 		//String id = "u1";//확인용 데이터
 		int p_code = 1;//확인용 데이터
 		int o_del_fee = 2500;
 		if(id==null){%>
 			<script>
 			alert("로그인 정보가 없습니다.");
 			document.location.href="${pageContext.request.contextPath}/index.jsp";
 			</script>
 		<%}%>
 
<link rel="stylesheet" type="text/css" href="./css/cart.css">

<jsp:include page="../top.jsp"/> 
		<!--******************-->
        <!--작업 및 복붙 구역-->
        <!--******************-->        	
         <main>
	<div align="center">
		<h2 class="layout-page-title">장바구니</h2>
			<p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
	<form name="frm" action="order.jsp">
		<input type="hidden" name="fch" value="0">
		<table border="1" id="cart_table">
		<tr>
			<th><input type="checkbox" name="allCh" 
			></th>
			<th>상품사진</th>
			<th>상품명</th>
			<th>수량</th>
			<th>상품금액</th>
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
			<td><img alt="제품사진" src="${pageContext.request.contextPath}
			/img/product/ready.gif"></td>
			<td><%=p_name %><br><span><%=p_price %></span>원</td>
		
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
			<th>상품금액</th>
			<th>배송비</th>
			<th>결제예정금액</th>
		</tr>
		<tr>
			<td id="sumtext">0</td>
			<td><%=o_del_fee %></td>
			<td>결제금액</td>
			</tr>
		</table>
		<br>
		<input type="button" name="btn1"  value="선택 삭제하기" id="delete_product"
		disabled style ="width:150px" 
		>
		<input type="submit" name="btn2" value="선택 주문하기" id="order_product"
		disabled	style ="width:150px">
		<input type="hidden" name="id" value="<%=id %>">
		</form>
	</div>
	<script src="js/cart.js"></script>
</main>
		<jsp:include page="../bottom.jsp"/>
		</body>
</html>