<!-- 사용자 주문서 page: cart.jsp에서 수량가져옴. -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>

<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<jsp:useBean id="oMgr" class="order.OrderMgr" />
<jsp:useBean id="cMgr" class="order.CartMgr" />

<%

		request.setCharacterEncoding("EUC-KR");
		String cpath = request.getContextPath();
		
		int p_code = 0;
		int o_qty = 0;
		int unitPrice = 0;
		int totalPrice =0;
		int sum = 0;
		int countPart = 0;

		String o_id = (String)session.getAttribute("idKey");

		String flag = request.getParameter("flag");
		
		Vector goods = new Vector();
	
		
		// flag (카트인지 제품 하나 구매인지 구분 )  에 따라 Vector goods 에 정보 넣어줌
		if(flag.equals("oneProduct")){
			p_code = Integer.parseInt(request.getParameter("p_code"));
			ProductBean pbean = pMgr.getProduct(p_code);
			goods.add(pbean);
			
		}else if(flag.equals("cart")){
			//여기에서 플래그값 판단해서 시작
			//플래그는 getparameter
			//선택제품에대한 정보 넘겨줘야함
			//카트 피코드 삭제도 해야함
			goods = cMgr.getCart(o_id);
		}
		

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

<%@ include file="../top.jsp"%>


<main>
    <div id="main_wrapper">
        <div class="title_wrapper">
            <h1 class="title">주문서</h1>
            <span class="description">주문하실 상품명 및 수량을 정확하게 확인해주세요.</span>
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
                
                ProductBean pbean =null;
                CartBean cbean = null;
                
                for(int i=0; i<goods.size(); i++){			
                    
                    /* 물건 하나 구매할 때*/
                    if(flag.equals("oneProduct")){
                        pbean = (ProductBean)goods.get(i);	
                        o_qty = Integer.parseInt(request.getParameter("quantity"));
                        
                        /* 장바구니 구매할 때 */
                    }else if(flag.equals("cart")){
                        
                        cbean = (CartBean)goods.get(i);
                        o_qty = cbean.getC_qty();
                        pbean = pMgr.getProduct(cbean.getP_code());
                    }
                    
                    unitPrice = pbean.getP_price();
                    totalPrice = unitPrice * o_qty;
                    sum += totalPrice;
                    countPart = goods.size();
                    %>
                    <tr>
                        <td>
                            <img alt="제품사진" src="../img/product/fus_main1.jpg">
                            <!-- <img alt="제품사진" src="${pageContext.request.contextPath}/img/product/<%=pbean.getP_main_pht_name()%>"> -->
                            </td>
                            <td>
                            	<a href="${pageContext.request.contextPath}/product/goods_view.jsp?goods=<%=pbean.getP_code()%>">
                            		<%=pbean.getP_name() %>
                            	</a>
                            </td>
                            <td><%=o_qty %>개</td>
                            <td><%=UtilMgr.intFormat(totalPrice) %>원</td>
                        </tr>
                        <%
                                }
                            %>
            </table>
        </section>



        <section id="order_member">
            <h3 class="order_subtitle">주문자 정보</h3>
            <table class="verHead">

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

            <form name="orderFrm" method="post" action="./orderProc.jsp">

                <section id="order_delivery">
                    <h3 class="order_subtitle">배송정보</h3>
                    <table class="verHead">
                            <%
                                Vector<OrderBean> olist = oMgr.getOrder(o_id);
                                OrderBean order = olist.get(0); //최근 주문 정보 
                            %>
                        <tr>
                            <th>배송주소</th>
                            <td>
                            	<input class="input_zipcode" name="o_recpt_add" readonly value="<%=order.getO_recpt_add()%>"><input id="addr_btn" class="btn" type="button" value="주소검색">
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input class="input_zipcode" name="o_recpt_add_det"  value="<%=order.getO_recpt_add_det()%>"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input class="input_zipcode" name="o_recpt_zipcode" readonly value="<%=order.getO_recpt_zipcode()%>"></td>
                        </tr>
                        <tr>
                            <th>수령인 이름</th>
                            <td><input name="o_recpt_name" value="<%=order.getO_recpt_name()%>"></td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td><input name="o_recpt_contact"  value="<%=order.getO_recpt_contact()%>"></td>
                        </tr>
                        
                        <tr>
                            <th>배송요청사항</th>
                            <td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
                        </tr>
                    </table>
                </section>

				<div id="point_price_wrapper">
	                <section id="order_point">
	                    <h3 class="order_subtitle">적립금</h3>
	                    <table class="verHead"> 
	                        <tr>
	                            <th>적립급 적용</th>
	                            <td><input placeholder="사용가능한 적립금 : 5000">원</td>
	                        </tr>
	                    </table>
	                </section>
	
	                <section id="order_pay">
	                    <h3 class="order_subtitle">결제금액</h3>
	                    <table class="verHead">
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
	                                <span id="total_point">(구매 시 <%=UtilMgr.intFormat((int)(sum*pointRate))%>P 적립)</span>
	                            </td>
	                        </tr>
	                        <!-- <tr>
	                            <td></td>
	                        </tr> -->
	                    </table>
	                </section>
				</div>

                <section id="order_howpay">
                    <h3 class="order_subtitle">결제수단</h3>
                    <table class="verHead">
                        <tr>
                            <th>일반결제 &nbsp;&nbsp;&nbsp;</th>
                            <td> 신용카드
	                            <input type="radio" class="radio" name="o_pay_method" value="신용카드" onclick='paymentMethod(this.value);' checked>
	                            &nbsp;&nbsp;&nbsp; 휴대폰
	                            <input type="radio" class="radio" name="o_pay_method" value="휴대폰" onclick='paymentMethod(this.value);'>
                            </td>
                        </tr>
                        <tr id='tr1'>
                        	<td></td>
                            <td>
                                <select id="card">
                                    <option value="0">카드를 선택해주세요.</option>
                                    <option value="1">현대(무이자)</option>
                                    <option value="2">신한</option>
                                    <option value="3">비씨</option>
                                    <option value="4">NH</option>
                                    <option value="5">삼성</option>
                                </select>
                                <select id="installment">
                                    <option value="0">일시불</option>
                                    <option value="1">2개월 할부</option>
                                    <option value="2">3개월 할부</option>
                                    <option value="3">4개월 할부</option>
                                    <option value="4">5개월 할부</option>
                                    <option value="5">6개월 할부</option>
                                </select>
                            </td>
                        </tr>
                        <tr id='tr2' style="display:none">
                            <td></td>
                            <td><input name="cellphone1" size="13" placeholder="010-1234-1234"><td>
                        </tr>
                        <tr>
                            <th>간편결제 &nbsp;&nbsp;&nbsp;</th>
                            <td>네이버 페이<input type="radio" class="radio" name="o_pay_method" value="네이버페이" onclick='paymentMethod(this.value);'></td>
                        </tr>
                    </table>
                </section>

                <section id="order_private">
                    <h3 class="order_subtitle">개인정보 수집/제공*</h3>
                    <table class="verHead">
                       <!--  <tr>
                            <th>개인정보 수집/제공*</th>
                        </tr> -->
                        <tr>
                            <th>
                            	<span>결제진행 필수동의</span>
                            	<input class="checkbox" id="agreement" type="checkbox" value=1>
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th>개인정보 수집/이용동의(필수)</th>
                            <th><a href="#">약관확인 ></a></th>
                        </tr>
                        <tr>
                            <th>결제대행 서비스 약관 동의(필수)</th>
                            <th><a href="#">약관확인 ></a></th>
                        </tr>
                    </table>
                    <input type="hidden" name="o_id" value="<%=o_id%>">
                    <input type="hidden" name="o_status" value="<%=o_status%>">
                    <input type="hidden" name="countPart" value="<%=countPart%>">
                    <%for(int i =0; i<countPart;i++){ %>
                        <input type="hidden" name="o_qty" value="<%=o_qty%>">
                        <input type="hidden" name="p_code" value="<%=p_code%>">
                    <%} %>
                    <div class="order_btn_wrapper">
                        <input type="submit" class="btn order_submit" value="결제하기" onclick="agreement()">
                    </div>
                </section>
            </form>
            


	</div>
</main>


</div>
<!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div>
<!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
<%@ include file="../bottom.jsp"%>

<script type="text/javascript" src="js/order.js"></script>


</body>
</html>













