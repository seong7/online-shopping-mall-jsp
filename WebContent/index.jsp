<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="product.productUtil"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />
<%
		request.setCharacterEncoding("EUC-KR");
		
		productUtil util = new productUtil();
		
		Vector<ProductBean> vlist;

%>

<link rel="stylesheet" type="text/css" href="css/goodsList.css">

<%@ include file="/top.jsp" %>

        <!--******************-->
        <!--�۾� �� ���� ����-->
        <!--******************-->        	
         <main>
            <!-- ��� ����-->
            <div id="bannerWrapper">
                <img src="./img/index/banner/banner_sample1.png" alt="banner slider">
                <div id="banner_btn_wrapper">
                    <span>
                        
                    </span>
                </div>
            </div>

            <!-- ����Ʈ��ǰ ����-->
            
            <%
	            vlist = mgr.getGoodsList("indexBest");
            %>
            
            
                <div class="goodslist" id="goodslist_best">
	                <div class="goodslist_tit">
	                    <a href="${pageContext.request.contextPath}/product/goods_list.jsp?list=best" class="goodslist_btn">
	                        <h3>����Ʈ��ǰ</h3>
	                    </a>
	                    <span class="goodslist_detail">�н��� ��Ѱ� BEST ��ǰ���� ����������.</span> 
	                </div>
	                
	                <ul id="goodslist_best_ul">
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
								<img src="img/product/<%=pbean.getP_main_pht_name()%>">
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
	
	           	 <!-- �Ż�ǰ ����-->
	           	 
	         <%
	            vlist = mgr.getGoodsList("indexNew");
            %>
	           	 
	            <div class="goodslist" id="goodslist_new">
	                <div class="goodslist_tit">
	                    <a href="${pageContext.request.contextPath}/product/goods_list.jsp?list=new" class="goodslist_btn">
	                        <h3>�Ż�ǰ</h3>
	                    </a>
	                    <span class="goodslist_detail">�н��� ��Ѱ� ���ο� ��ǰ���� ����������.</span> 
	                </div>
	                <ul id="goodslist_new_ul">
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
								<img src="img/product/<%=pbean.getP_main_pht_name()%>">
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
			<!--******************-->
	        <!--�۾� �� ���� ����-->
	        <!--******************-->        
		<%@ include file="/bottom.jsp" %>
</body>
</html>
	