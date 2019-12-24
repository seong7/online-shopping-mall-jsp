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

<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<jsp:useBean id="cMgr" class="order.CartMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String o_id = (String)session.getAttribute("idKey");
		o_id = "u1"; // 확인용 
		int o_index = Integer.parseInt(request.getParameter("o_index"));
		String o_status = "결재완료";//최초 주문시 default 값으로 입력 
		int priceTotal = 0;
		int shippingPrice = 2500;
%>

<!-- 
<!DOCTYPE html>
<html>
<title>주문서</title>
<head>
</head>
<body>
 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="css/order.css"/>


<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	
		<main>
			<div id="orderWapper">
				<h2>주문서</h2>
					<section id="order_product">
					<h3 class="order_subtitle">상품정보</h3>
						<table>
							<tr>
								<td colspan="2">상품정보</td>
								<td>상품수량</td>
								<td>상품금액</td>
							</tr>
								<%
									OrderDetailBean detailOrder = oMgr.getOrderCode(o_index);
									int p_codes[] = detailOrder.getP_code();
									int o_qtys[] = detailOrder.getO_qty();
									for(int i=0; i<p_codes.length; i++){
										int p_code = p_codes[i];
										ProductBean pbean = pMgr.getProduct(p_code);
										int price = pbean.getP_price();
										int o_qty = o_qtys[i];
										priceTotal += price * o_qty;
								%>
								<%=p_code %>
								<%=o_qty %>
							<tr>
								<td>
								<img alt="제품사진" src="${pageContext.request.contextPath}/img/product/ready.gif">
								</td>
								<td><a><%=pbean.getP_name() %></a></td>
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
						<table>
							<tr>
							<%
								MemberBean mbean = mMgr.getMember(o_id);
							%>
								<td>보내는 분</td>
								<td><%=mbean.getNAME() %></td>
							</tr>
							<tr>
								<td>휴대폰 </td>
								<td><%=mbean.getContact() %></td>
							</tr>
							<tr>
								<td>이메일 </td>
								<td><%=mbean.getEmail() %></td>
							</tr>
						</table>
						<hr/>
						</section>
						<section id="order_delivery">
						<h3 class="order_subtitle">배송정보</h3>
						<table>
								<%
									Vector<OrderBean> olist = oMgr.getOrderDetail(o_index);
									OrderBean order = olist.get(0); //최근 주문 정보 
								%>
							<tr>
								<td>배송주소</td>
								<td><input name="o_recpt_add" readonly value="<%=order.getO_recpt_add()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_add_det" readonly  value="<%=order.getO_recpt_add_det()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_zipcode" readonly="readonly" value="<%=order.getO_recpt_zipcode()%>"></td>
							</tr>
							<tr>
								<td>수령인 이름</td>
								<td><input name="o_recpt_name" readonly value="<%=order.getO_recpt_name()%>"></td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td><input name="o_recpt_contact" readonly  value="<%=order.getO_recpt_contact()%>"></td>
							</tr>
							
							<tr>
								<td>배송요청사항</td>
								<td><textarea name="o_del_msg" readonly rows="5" cols="50"></textarea></td>
							</tr>
						</table>
						</section>
						<section id="order_point">
							<h3 class="order_subtitle">적립금</h3>
								<table>
									<tr>
										<td>적립급 적용</td>
										<td><input placeholder="사용가능한 적립금 : 5000원"></td>
									</tr>
								</table>
						</section>
						<section id="order_pay">
							<h3 class="order_subtitle">결제금액</h3>
							<table>
								<tr>
									<td>상품금액&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_prod_amount" readonly size="13" 	value="<%=priceTotal%>">원</td>
								</tr>
								<tr>
									<td>배송비&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_del_fee" readonly size="13" 	value="<%=shippingPrice%>">원</td>
								</tr>
								<tr>
									<td>최종결재금액&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_total_amount" readonly size="13" value="<%=priceTotal+shippingPrice%>">원</td>
								</tr>
								<tr>
									<td>구매 시 <%=UtilMgr.intFormat(priceTotal)%>P 적립</td>
								</tr>
							</table>
						</section>
						<section id="order_howpay">
							<h3 class="order_subtitle">결제수단</h3>
							<%=order.getO_pay_method() %>
  						</section>
						<input type="submit" value="주문내역으로 이동" onclick="location.href='mypage_orderlist.jsp'">
					</section>
					
					
			</div>
		</main>
		
</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>		
	</body>
	
	<script type="text/javascript" src="js/order.js"></script>
	
</html>













