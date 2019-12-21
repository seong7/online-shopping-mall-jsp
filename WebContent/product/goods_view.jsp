<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.productUtil"%>
<%@page import="product.ProductBean"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	productUtil util = new productUtil();
	int p_code = Integer.parseInt(request.getParameter("goods"));
	
	ProductBean bean = mgr.getProduct(p_code);
%>
<link rel="stylesheet" type="text/css" href="../css/goodsList.css">
<script>
	
</script>
<jsp:include page="../top.jsp"/>

<main>
	
	<header>
		<img id="main_pht" src="../img/product/<%=bean.getP_main_pht_name()%>" style="height: 400px;">
		
		<form id="header_info_wrapper" method="get" action="../order/order.jsp">
			<div class="header name">
				<span><%=bean.getP_name() %></span>
			</div>
			<div class="header price">
				<span><%=util.price(bean.getP_price())%></span>
			</div>
			<div class="header volume">
				<span class="title">판매 용량</span>
				<span class="content">1상자 / 600g</span>
			</div>
			<div class="header amount">
				<span class="title">구매 수량</span>
				<input type="number" value="1">
			</div>
			<div class="header total">
				<span class="title">총 상품 금액</span>
				<span id="total"></span>
			</div>
			<div class="header btn">
				<input type="button" class="btn" value="장바구니에 추가"> 
				<input type="submit" class="btn" value="구매하기">
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

<jsp:include page="../bottom.jsp"/>

</body>
</html>