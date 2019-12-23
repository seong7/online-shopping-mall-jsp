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
		listName ="��ü��ǰ";
		listDetail = "�н��� ��Ѱ� ��� ��ǰ���Դϴ�.";
		break;
	case "best":
		listName ="����Ʈ��ǰ";
		listDetail = "�н��� ��Ѱ����� ���� ���� �ȸ� ��ǰ���Դϴ�.";
		break;		
	case "new":
		listName ="�Ż�ǰ";
		listDetail = "�н��� ��Ѱ����� ���Ӱ� �Ǹ��ϴ� ��ǰ���Դϴ�.";
		break;
	/*case "review":
		listName ="�����";
		break;*/
	/*case "priceH":
		listName ="���� ���ݼ�";
		break;*/
	/*case "review":
		listName ="���� ���ݼ�";
		break;*/
	case "search":
		listName= "�˻����";
		break;
	}
	
	
	if(flag.equals("search")){
		searchTerm = request.getParameter("searchTerm");
		System.out.println("�Էµ� �˻��� : " +searchTerm);
		if(searchTerm.trim().equals("")  || searchTerm == null){
			listName = "�˻�� �Է����ּ���.";
			vlist = null;
			
		}else{
			listName = "\"" +searchTerm + "\"" + " �� �˻� ���";
			vlist = mgr.getSearchList(searchTerm);
			listDetail = "�� " +vlist.size() +" ���� ��ǰ�� �˻��Ǿ����ϴ�.";
			
		}
		
	}else{
		vlist = mgr.getGoodsList(flag);
		
	}
	
	
	
	
	
	

	
%>
<link rel="stylesheet" type="text/css" href="../css/goodsList.css">
<script>
	
</script>
<%@ include file="../top.jsp" %>


<main>

<!-- ��ǰ �� :  --><%--<%=vlist.size()%>--%>
	
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
						<%=util.price(pbean.getP_price())%>��
					</span>
				</div>
			</li>
			<%} //--for%>
		</ul>
	</div>
	
</main>
	
	<%@ include file="../bottom.jsp" %>
	
	
</body>
</html>