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

<%@ include file="../top.jsp" %>


<link rel="stylesheet" type="text/css" href="./css/goods_view.css">

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
				<span class="title">����</span>
				<span class="content" id="price"><%=util.price(bean.getP_price())%></span><span> ��</span>
				<!-- <input class="content" id="price" type="text" value="30000" readonly><span> ��</span>  -->
			</div>
			<div class="header volume">
				<span class="title">�Ǹ� �뷮</span>
				<span class="content">1���� / 600g</span>
			</div>
			<div class="header quantity">
				<span class="title">���� ����</span>
				<i id="button_down" class="far fa-minus-square"></i>
				<input id="quantity" class="quantity" type="number" min="1" max="99" step="1" value="1">
				<i id="button_up" class="far fa-plus-square"></i>
			</div>
			<div class="header total">
				<span class="title">�� ��ǰ �ݾ�</span>
				<span id="total"></span><span> ��</span>
				<!--<input id="total" type="text" readonly>-->
			</div>
			<div class="header btn_wrapper">
				<input id="cartBtn" type="button" class="btn" value="��ٱ��Ͽ� �߰�"
				onclick="location.href='${pageContext.request.contextPath}
				/order/cart.jsp?'"> 
				<input id="submit" type="submit" class="btn" value="�����ϱ�">
			</div>
		</form>			

	</header>
			
			
			<!--  ��ǰ ��õ �˰��� ���� -->
			<div id="recom_wrapper" style="display:none;">
				<div class="title">
					<span>�� ��ǰ�� �����?</span>
				</div>
				<ul>
					<li>
					</li>
				</ul>
			</div>
			
			<!-- ���� �̹��� ���� -->
			<div id="detail">
				<img id="detail_pht" src="../img/product/<%=bean.getP_detail_pht_name()%>">
			</div>
			
			<!-- �� �̹��� ����    display : none -->
			<div id="detail" style="display:none;">
				<img id="detail_pht" src="../img/product/<%=bean.getP_info_pht_name()%>">
			</div>
			
			
			<!--  ���� ����   display : none -->
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

	<%@ include file="../bottom.jsp" %>

</body>
</html>