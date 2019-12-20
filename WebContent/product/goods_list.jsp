<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.productUtil"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	productUtil util = new productUtil();
	String listName = null;
	String listDetail = null;
	String searchTerm = null;
	String flag = request.getParameter("list");
	
	//System.out.println(flag);
	
	Vector<ProductBean> vlist;
	
	switch (flag){
	case "all":
		listName ="전체상품";
		listDetail = "밀스의 방앗간 모든 상품들입니다.";
		break;
	case "best":
		listName ="베스트상품";
		listDetail = "밀스의 방앗간에서 가장 많이 팔린 상품들입니다.";
		break;		
	case "new":
		listName ="신상품";
		listDetail = "밀스의 방앗간에서 새롭게 판매하는 상품들입니다.";
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
			listName = "\"" +searchTerm + "\"" + " 의 검색 결과";
			vlist = mgr.getSearchList(searchTerm);
			listDetail = "총 " +vlist.size() +" 개의 상품이 검색되었습니다.";
			
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
			<span class = "goodslist_detail"><%=listDetail %></span>
		</div>
		
		<ul>
			<%
			for (int i=0; i<vlist.size(); i++) {ProductBean pbean = vlist.get(i);
				if(i%4==0 && i!=0 ){ 
					//System.out.println("work");
			%>
					</ul>
					<ul>
			<%		
				}  //--if
			%>
			
			<li>
				<a href="${pageContext.request.contextPath}/product/goods_view.jsp?goods=<%=pbean.getP_code()%>">
					<img src="../img/product/<%=pbean.getP_main_pht_name()%>">
				</a>
				<div class="goods_info">
					<a href="${pageContext.request.contextPath}/product/goods_view.jsp?goods=<%=pbean.getP_code()%>">
						<span class="name">
							<%=pbean.getP_name()%>
						</span>
					</a>
					<span class="price">
						<%=util.price(pbean.getP_price())%>원
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