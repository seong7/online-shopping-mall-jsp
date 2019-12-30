<%@page import="admin.StockMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.productUtil"%>
<%@page import="product.ProductBean"%>
<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	String id_goods = (String)session.getAttribute("idKey");
	
	productUtil util = new productUtil();

	int p_code = Integer.parseInt(request.getParameter("p_code"));

	StockMgr stmgr = new StockMgr();
	
	int stqty = stmgr.getStockAva(p_code);
	
	ProductBean bean = mgr.getProduct(p_code);

%>

<link rel="stylesheet" type="text/css" href="../css/goodsList.css">

<%@ include file="../top.jsp" %>



<link rel="stylesheet" type="text/css" href="./css/goods_view.css">

<main>
	
	<header>
		<div id="img_wrapper">
			<img id="main_pht" src="../img/product/<%=bean.getP_main_pht_name()%>">
		</div>
		
		<form id="header_info_wrapper" name="orderFrm" method="get" action="../order/order.jsp">
			<input type="hidden" name="flag" value="oneProduct">
			<input type="hidden" name="p_code" value="<%=bean.getP_code() %>">
			<div class="header name">
				<span><%=bean.getP_name() %></span>
			</div>
			<div class="header price">
				<span class="title">가격</span>
				<span class="content" id="price"><%=util.price(bean.getP_price())%></span><span> 원</span>
				<!-- <input class="content" id="price" type="text" value="30000" readonly><span> 원</span>  -->
			</div>
			<div class="header volume">
				<span class="title">판매 용량</span>
				<span class="content">1상자 / 600g</span>
			</div>
			<div class="header quantity">
				<span class="title">구매 수량</span>
				<i id="button_down" class="far fa-minus-square"></i>
				<input id="quantity" class="quantity" name="quantity" 
				type="number" min="1" max="<%=stqty %>" step="1" value="1">
				<i id="button_up" class="far fa-plus-square"></i>
			</div>
			<div class="header total">
				<span class="title">총 상품 금액</span>
				<span id="total"></span><span> 원</span>
				<!--<input id="total" type="text" readonly>-->
			</div>
			<div class="header btn_wrapper">
				<input id="cartBtn" type="button" class="btn" value="장바구니에 추가"
				onclick="addCart()";> 
				<input id="submit_btn" type="button" 
				onclick="logincheck_goods()" class="btn" value="구매하기">
			</div>
		</form>			

	</header>
	<form name="cartFrm" method="post"> 
	<input type="hidden" name="id_goods" value="<%=id_goods %>">
	<input type="hidden" name="p_code" value="<%=p_code %>">
	<input type="hidden" name="c_qty" value="">
	</form>
			
			<!--  제품 추천 알고리즘 영역 -->
			<div id="recom_wrapper" style="display:none;">
				<div class="title">
					<span>이 제품은 어떠세요?</span>
				</div>
				<ul>
					<li>
					</li>
				</ul>
			</div>
			
			<!-- 설명 이미지 영역 -->
			<div id="detail">
				<img id="detail_pht" src="../img/product/<%=bean.getP_detail_pht_name()%>">
			</div>
			
			<!-- 상세 이미지 영역    display : none -->
			<div id="detail" style="display:none;">
				<img id="detail_pht" src="../img/product/<%=bean.getP_info_pht_name()%>">
			</div>
			
			
			<!--  리뷰 영역 -->
			
			<% String reviewList = "goods_view";%>
			<%@ include file="review.jsp" %>
			
			
		</div>

	


</main>

<script src="js/goods_view.js"></script>

	<%@ include file="../bottom.jsp" %>


<script>
	// order.jsp 이동 전 로그인 체크
	function logincheck_goods(){
		const orderFrm = document.getElementById("header_info_wrapper");
		<%
			//String id_goods = (String)session.getAttribute("idKey");
			if(id_goods==null || id_goods.length() ==0){
		%>
			alert('구매를 위해서는 로그인이 필요합니다.');
			return;
		<%
			}else{
		%>	
			orderFrm.submit();
		<%}%>
	}
	
	function addCart(){
		<%
		if(id_goods==null || id_goods.length() ==0){
	%>
		alert('로그인이 필요합니다.');
		return;
	<%
		}else{
	%>
		const quantity = document.getElementById('quantity');
		document.cartFrm.c_qty.value=quantity.value;
		document.cartFrm.action = "goods_viewProc.jsp";
		document.cartFrm.submit();
		<%}%>
	}
</script>
</body>
</html>