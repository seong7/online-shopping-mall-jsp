<!-- goods_view.jsp에서 p_code, 수량 넘겨오기 -->
<%@page import="java.text.DecimalFormat"%>
<%@page import="order.CartBean"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="pMgr" class="product.ProductMgr"/>
 <jsp:useBean id="cMgr" class="order.CartMgr"/>
 <%
 		request.setCharacterEncoding("EUC-KR");
 		String id = (String)session.getAttribute("idKey");
 		int o_del_fee = 2500;
 		DecimalFormat formatter = new DecimalFormat();
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
        <div id="loader">
        </div>        	
 <main id="main_contents">
	<div align="center" class="default_wrapper cart_wrapping">
		<h2 class="layout-page-title page_title">장바구니</h2>
			<p class="subtitle">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
	<form name="frm" id="go_order_form" action="order.jsp">
		<input type="hidden" value="cart" name="flag">
		<input type="hidden" name="fch" value="0">
		<table border="1" id="cart_table" class="default_table">
		<thead>
			<tr>
				<th id="cart_firstcol"><label class="checkbox"><input type="checkbox" name="allCh"><span class="icon"></span><span class="text"></span></label></th>
				<th>상품사진</th>
				<th id="cart_thirdcol">상품명</th>
				<th>수량</th>
				<th>상품금액</th>
			</tr>
		</thead>
		<%
			Vector<CartBean> clist = cMgr.getCart(id);
			if(clist.isEmpty()){
				%>
					<tr>
						<td colspan="5">
						장바구니가 비었습니다. 
						</td>
					</tr>
				<%} else{
				for(int i= 0; i<clist.size();i++){	
					CartBean cart = clist.get(i);
					int p_code = cart.getP_code();
					ProductBean product = pMgr.getProduct(p_code);
					String p_main_pht_name = product.getP_main_pht_name();
			 		String p_name = product.getP_name();
					int p_price = product.getP_price();
					int c_qty = cart.getC_qty();
					int totalPrice = p_price* c_qty;
				%>
		<tr>
			<td><label class="checkbox"><input type="checkbox" name="fch" value="<%=p_code%>" ><span class="icon"></span><span class="text"></span></label></td>
			<td><img alt="제품사진" src="${pageContext.request.contextPath}/img/product/<%=p_main_pht_name%>"></td>
			<td class="cart_price_td"><%=p_name %><br><span><%=formatter.format(p_price) %></span></td>
		
			<td><button type="button" id="minus">-</button>
			<input type="text" id="c_qty" value=<%=c_qty%> readonly="readonly">
			<button type="button" id="plus">+</button></td>
			<td class="cart_totalprice_td"><%=formatter.format(totalPrice)%></td>
		</tr>
				<%} 
				}%>	
		</table>
		<br>
		<div class="result_wrapper">
			<div class="cart_result_box">
				<div>
					<span class="resultbox_title">상품금액</span><br/>
					<span class="resultbox_content" id="sumtext">0</span>
				</div>
			</div>
			<span class="result_subicon">+</span>
			<div class="cart_result_box">
				<div>
					<span class="resultbox_title">배송비</span><br/>
					<span class="resultbox_content">2,500</span>
				</div>
			</div>
			<span class="result_subicon">=</span>
			<div class="cart_result_box">
				<div id="cart_result_totalbox">
					<span class="resultbox_title">결제예정금액</span><br/>
					<span class="resultbox_content" id="sumtotaltext">2,500</span>
				</div>
			</div>
		</div>
		<button type="button" name="btn1" id="delete_product"
		disabled style ="width:150px">선택 삭제하기</button>
		<button type="button" name="btn2" value="" id="order_product"
		disabled	style ="width:150px">선택 주문하기</button>
		<input type="hidden" name="id" id="user_id" value="<%=id %>">
		</form>
	</div>
	
	<script src="js/cart.js"></script>
</main>
		<jsp:include page="../bottom.jsp"/>
		</body>
</html>