<!-- 사용자 주문서 page -->

<%@page import="order.OrderDetailBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>

<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<jsp:useBean id="cMgr" class="order.CartMgr"/>
<%-- <jsp:useBean id="mMgr" class="member.MemberMgr"/> --%>
<%-- <jsp:useBean id="oMgr" class="order.OrderMgr"/> --%>

<%
		request.setCharacterEncoding("EUC-KR");
		String o_id = (String)session.getAttribute("idKey");
		int o_index = Integer.parseInt(request.getParameter("order"));
		int priceTotal = 0;
		int sum = 0;
		
		/// sample용
		String o_status = "결제완료";
		int shippingPrice = 2500;
		double pointRate = 0.05;  /* 5% 적립으로 가정 */
%>

<!-- 
<!DOCTYPE html>
<html>
<title>주문서</title>
<head>
</head>
<body>
 -->

<link rel="stylesheet" type="text/css" href="css/order.css"/>



<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	<div id="mypage">

		
			<div id="main_wrapper_mypage">
		        <div class="title_wrapper">
                	<h1 class="mypage_title">주문서 상세보기</h1>
		        </div>
		
		
		        <section id="order_product">
		            <h3 class="order_subtitle">상품정보</h3>
		            <table class="horHead">
		                <tr>
		                    <th colspan="2">상품정보</th>
		                    <th>상품수량</th>
		                    <th>상품금액</th>
		                </tr>
						<%
							Vector<OrderDetailBean> vlist = oMgr.getOrderCode(o_index);
							for(int i=0; i<vlist.size(); i++){
								OrderDetailBean detailOrder = vlist.get(i);
								int p_code[] = detailOrder.getP_code();
								int o_qtys[] = detailOrder.getO_qty();
								ProductBean pbean = pMgr.getProduct(p_code[i]);
								int price = pbean.getP_price();
								int o_qty = o_qtys[i];
								priceTotal = price * o_qty;
								sum += priceTotal;
						%>
						<tr>
							<td>
							<img alt="제품사진" src="${pageContext.request.contextPath}/img/product/<%=pbean.getP_main_pht_name()%>">
							</td>
							<td class="btn_td">
								<a href="${pageContext.request.contextPath}/product/goods_view.jsp?p_code=<%=pbean.getP_code()%>">
                            		<%=pbean.getP_name() %>
                            	</a>
                            </td>
							<td><%=o_qty %>개</td>
							<td><%=UtilMgr.intFormat(price) %>원</td>
						</tr>
						<%
								}
							%>
					</table>
				</section>
				
				
		       <section id="order_member">
		            <h3 class="order_subtitle">주문자 정보</h3>
		            <table class="order_verHead">
		
		                <tr>
		                <%
		                    MemberBean mbean = mMgr.getMember(o_id);
		                    
		                    String mName = mbean.getNAME();
		                    String mContact = mbean.getContact();
		                    String mEmail = mbean.getEmail();
							                    
		                %>
		                        <th>보내는 분</th>
		                        <td><%=mName %></td>
		                    </tr>
		                    <tr>
		                        <th>휴대폰 </th>
		                        <td><%=mContact%></td>
		                    </tr>
		                    <tr>
		                        <th>이메일 </th>
		                        <td><%=mEmail%></td>
		                    </tr>
		                </table>
		
		            </section>
		            
		            
	                <section id="order_delivery">
	                    <h3 class="order_subtitle">배송정보</h3>
	                    <table class="order_verHead">
								<%
									Vector<OrderBean> olist = oMgr.getOrderDetail(o_index);
									OrderBean order = olist.get(0); //최근 주문 정보 
								%>
							<tr>
								<th>배송주소</th>
								<td><input class="input_zipcode" name="o_recpt_add" readonly value="<%=order.getO_recpt_add()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input class="input_zipcode"  name="o_recpt_add_det" readonly  value="<%=order.getO_recpt_add_det()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input class="input_zipcode" name="o_recpt_zipcode" readonly="readonly" value="<%=order.getO_recpt_zipcode()%>"></td>
							</tr>
							<tr>
								<th>수령인 이름</th>
								<td><input name="o_recpt_name" readonly value="<%=order.getO_recpt_name()%>"></td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td><input name="o_recpt_contact" readonly  value="<%=order.getO_recpt_contact()%>"></td>
							</tr>
							
							<tr>
								<th>배송요청사항</th>
								<td><textarea class="mypage_textarea" name="o_del_msg" readonly rows="5" cols="50"></textarea></td>
							</tr>
						</table>
					</section>
						
				<div id="point_price_wrapper">
	                <section id="order_point">
	                    <h3 class="order_subtitle">적립금</h3>
	                    <table class="order_verHead"> 
	                        <tr>
	                            <th>적용된 적립금</th>
	                            <td><input readonly placeholder="0">원</td>
	                        </tr>
	                    </table>
	                </section>
	
	                <section id="order_pay">
	                    <h3 class="order_subtitle">결제금액</h3>
	                    <table class="order_verHead">
	                        <tr>
	                            <th>상품금액</th>
	                            <td>
	                            	<span id="o_prod_amount"><%=UtilMgr.intFormat(sum)%></span>원
	                            	<input type="hidden" name="o_prod_amount" value="<%=sum%>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>배송비</th>
	                            <td>
	                            	<span id="o_del_fee"><%=UtilMgr.intFormat(shippingPrice)%></span>원
	                            	<input type="hidden" name="o_del_fee" value="<%=shippingPrice%>">
	                            </td>
	                            
	                        </tr>
	                        <tr>
	                            <th id="total_price_th">최종결제금액</th>
	                            <td id="total_price_td">
  	                                <span id="o_total_amount"><%=UtilMgr.intFormat(sum+shippingPrice)%></span>원
  	                                <input type="hidden" name="o_total_amount" value="<%=sum+shippingPrice%>">
	                                <span id="total_point">구매 시 <%=UtilMgr.intFormat((int)(sum*pointRate))%>P 적립</span>
	                            </td>
	                        </tr>
							</table>
						</section>
					</div>
					
						<section id="order_howpay">
							<h3 class="order_subtitle">결제수단</h3>
							<table class="order_verHead">
	                        	<tr>
	                        		<th>
										<%=order.getO_pay_method() %>
	                        		</th>
	                        	</tr>
	                        </table>
	                        	
  						</section>
					
					 <div class="order_btn_wrapper">
                        <input type="submit" class="order_btn order_submit" value="주문내역 이동" onclick="location.href='mypage_orderlist.jsp'">
                    </div>
					
					
			</div>
		</div>
	
		
</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>		
	</body>
	
	
</html>













