<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	String listName = null;
	String searchTerm = null;
	String flag = request.getParameter("list");
	
	System.out.println(flag);
	
	Vector<ProductBean> vlist;
	
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
	case "search":
		listName= "검색결과";
		break;
	}
	
	
	if(flag.equals("search")){
		searchTerm = request.getParameter("searchTerm");
		if(searchTerm.trim().equals("")  || searchTerm == null){
			listName = "검색어를 입력해주세요.";
			vlist = null;
			
		}else{
			listName = searchTerm + " 의 검색 결과";
			vlist = mgr.getSearchList(searchTerm);
			
		}
		
	}else{
		vlist = mgr.getGoodsList(flag);
		
	}
	


	
%>
<link rel="stylesheet" type="text/css" href="../css/goodsList.css">
<script>
	
</script>
<jsp:include page="../top.jsp"/>


<main>

<!-- 제품 수 :  --><%--<%=vlist.size()%>--%>
	
	<div class="goodslist">
		<div class="goodslist_tit">
			<h3 class = "goodslist_btn"><%=listName %></h3>
			<span class = "goodslist_detail"></span>
		</div>
		
		<ul>
			<%
			for (int i=0; i<vlist.size(); i++) {ProductBean pbean = vlist.get(i);
			%>
			<li>
				<a href="#">
					<img src="../img/product/<%=pbean.getP_main_pht_name()%>">
				</a>
				<div class="goods_info">
					<a href="#">
						<span class="name">
							<%=pbean.getP_name()%>
						</span>
					</a>
					<span class="price">
						<%=pbean.getP_price()%>원
					</span>
				</div>	
			</li>
			<%} //--for%>
		</ul>
	</div>
	
</main>
	
	<jsp:include page="../bottom.jsp"/>
	
	
</body>
</html>