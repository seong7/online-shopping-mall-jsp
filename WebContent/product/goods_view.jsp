<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.productUtil"%>
<%@page import="product.ProductBean"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	productUtil util = new productUtil();
	//int p_code = Integer.parseInt(request.getParameter("goods"));
	int p_code = 1;//데이터 확인용
	
	ProductBean bean = mgr.getProduct(p_code);
%>
<link rel="stylesheet" type="text/css" href="../css/goodsList.css">
<script>
	
</script>
<jsp:include page="../top.jsp"/>

<link rel="stylesheet" type="text/css" href="css/goods_view.css">

<main>
	
	<header>
		<div id="img_wrapper">
			<img id="main_pht" src="../img/product/<%=bean.getP_main_pht_name()%>">
		</div>
		
		<form id="header_info_wrapper" method="get" action="../order/order.jsp">
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
				<input id="quantity" type="number" min="1" max="9" step="1" value="1">
			</div>
			<div class="header total">
				<span class="title">총 상품 금액</span>
				<!-- <span id="total"></span> -->
				<input id="total" type="text" readonly>
			</div>
			<div class="header btn_wrapper">
				<input id="cartBtn" type="button" class="btn" value="장바구니에 추가"> 
				<input id="submit" type="submit" class="btn" value="구매하기">
			</div>
		</form>			

	</header>
			
			
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
			
			
			<!--  리뷰 영역   display : none -->
			<div id="review" style="display: none;">
				<table>	
					<thead>
						<th>
						
						</th>
					</thead>
					<tr>
						<td>
						</td>
					</tr>
				</table>
			</div>
			
		</div>

	


</main>

<script src="js/goods_view.js"></script>

<jsp:include page="../bottom.jsp"/>

</body>
</html>