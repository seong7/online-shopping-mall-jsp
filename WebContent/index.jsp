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
<link rel="stylesheet" type="text/css" href="css/index.css">
<%@ include file="/top.jsp" %>

        <!--******************-->
        <!--작업 및 복붙 구역-->
        <!--******************-->   
            <!-- 배너 구역--> 
        <div class="arrow bounce1">
			<i class="fa fa-arrow-left fa-2x"  onclick="plusDivs(-1)"></i>
		</div>
		<div class="arrow bounce2">
			<i class="fa fa-arrow-right fa-2x"  onclick="plusDivs(-1)"></i>
		</div>    
        <div id="bannerWrapper">
				
            	<img class="mySlides" src="./img/index/banner/banner_new.jpg">
				<img class="mySlides" src="./img/index/banner/banner_open.jpg">
				<img class="mySlides" src="./img/index/banner/banner_sample2.png">
				<img class="mySlides" src="./img/index/banner/banner_sample3.png">
            </div>	
         <main>
            
            <%
	            vlist = mgr.getGoodsList("indexBest");
            %>
            
            
                <div class="goodslist" id="goodslist_best">
	                <div class="goodslist_tit">
	                    <a href="${pageContext.request.contextPath}/product/goods_list.jsp?list=best" class="goodslist_btn">
	                        <h3>베스트상품</h3>
	                    </a>
	                    <span class="goodslist_detail">밀스의 방앗간 BEST 상품들을 만나보세요.</span> 
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
									<%=util.price(pbean.getP_price())%>원
								</span>
							</div>
						</li>
						<%} //--for%>
					</ul>
				</div>
	
	           	 <!-- 신상품 구역-->
	           	 
	         <%
	            vlist = mgr.getGoodsList("indexNew");
            %>
	           	 
	            <div class="goodslist" id="goodslist_new">
	                <div class="goodslist_tit">
	                    <a href="${pageContext.request.contextPath}/product/goods_list.jsp?list=new" class="goodslist_btn">
	                        <h3>신상품</h3>
	                    </a>
	                    <span class="goodslist_detail">밀스의 방앗간 새로운 상품들을 만나보세요.</span> 
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
									<%=util.price(pbean.getP_price())%>원
								</span>
							</div>
						</li>
						<%} //--for%>
					</ul>
				</div>
				
				
	        </main>
	        
			<script src="./js/index.js"></script>
			<!--******************-->
	        <!--작업 및 복붙 구역-->
	        <!--******************-->        
		<%@ include file="/bottom.jsp" %>
</body>
</html>
	