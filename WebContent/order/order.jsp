<!-- 사용자 주문서 page -->
<%@page import="Order.UtilMgr"%>
<%@page import="Order.OrderBean"%>
<%@page import="Member.MemberBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.CartMgr"%>
<%@page import="Order.CartBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="Member.MemberMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>
<jsp:useBean id="oMgr" class="Order.OrderMgr"/>
<jsp:useBean id="cMgr" class="Order.CartMgr"/>

<%
		String id = (String)session.getAttribute("idKey");
		int priceTotal = 0;
		int shippingPrice = 2500;
%>


<!DOCTYPE html>
<html>
<title>주문서</title>
<head>
<script type="text/javascript" src="js/order.js"></script>
<link rel="stylesheet" type="text/css" href="css/order.css"/>
</head>
<body>
<h2>주문서</h2>


<table>
	<tr>
		<td>상품정보</td>
	</tr>
	<tr>
		<td colspan="2">상품정보</td>
		<td>상품수량</td>
		<td>상품금액</td>
	</tr>
		<%
			Vector<CartBean> vlist = cMgr.getCart("u1");
			if(vlist.isEmpty()){
		%>
		<tr> 
			<tr>
				<td colspan="4">
				주문하신 물품이 없습니다.
				</td>
			</tr>
		<%
			}
			for(int i=0; i<vlist.size(); i++){
				CartBean cart = vlist.get(i);
				int p_code = cart.getP_code();
				ProductBean pbean = pMgr.getProduct(p_code);
				int price = pbean.getP_price();
				int quantity = cart.getC_qty();
				priceTotal += price * quantity;
		%>
	<tr>
		<td>
		<img alt="제품사진" src="${pageContext.request.contextPath}/img/product/ready.gif">
		</td>
		<td name><%=pbean.getP_name() %></td>
		<td><%=cart.getC_qty() %>개</td>
		<td><%=UtilMgr.intFormat(pbean.getP_price()) %>원</td>
	</tr>
	<%
			}
		%>
</table>
<hr/>
<table>
	<tr>
		<td>주문자 정보</td>
	</tr>
	<tr>
	<%
		
	%>
		<td>보내는 분</td>
		<td></td>
	</tr>
	<tr>
		<td>휴대폰 </td>
		<td>010-3841-0424</td>
	</tr>
	<tr>
		<td>이메일 </td>
		<td>mwchoi0428@gmail.com</td>
	</tr>
</table>
<hr/>
<form name="orderFrm" method="post" action="orderProc.jsp">
<table>
	<tr>
		<td>배송정보</td>
	</tr>
		<%
		Vector<OrderBean> olist = oMgr.getOrder("u1");
		OrderBean order = olist.get(0); //최근 주문 정보 
		%>
	<tr>
		<td>배송주소</td>
		<td><input name="o_recpt_add" size="50" 
		value="<%=order.getO_recpt_add()%>"></td>
	</tr>
	<tr>
		<td></td>
		<td><input name="o_recpt_add_det" size="50" 
		value="<%=order.getO_recpt_add_det()%>"></td>
	</tr>
	<tr>
		<td><input name="o_recpt_zipcode" size="5" 
		value="<%=order.getO_recpt_zipcode()%>"></td>
		<td><input type="button" value="주소검색"></td>
	</tr>
	<tr>
		<td>수령인 이름 </td>
		<td><input name="o_recpt_name" size="20" 
		value="<%=order.getO_recpt_name()%>"></td>
	</tr>
	<tr>
		<td>휴대폰 </td>
		<td><input name="o_recpt_contact" size="13" 
		value="<%=order.getO_recpt_contact()%>"></td>
	</tr>
	
	<tr>
		<td>배송요청사항 </td>
		<td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>적립금</td>
	</tr>
	<tr>
		<td>적립급 적용</td>
		<td>사용가능한 적립금이 없습니다.</td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>결재금액</td>
	</tr>
	<tr>
		<td>상품금액&nbsp;&nbsp;&nbsp;</td>
		<td><input name="o_prod_amount" readonly size="13" 
		value="<%=UtilMgr.intFormat(priceTotal) %>">원</td>
	</tr>
	<tr>
		<td>배송비&nbsp;&nbsp;&nbsp;</td>
		<td><input name="o_del_fee" readonly size="13" 
		value="<%=UtilMgr.intFormat(shippingPrice) %>">원</td>
	</tr>
	<tr>
		<td>최종결재금액&nbsp;&nbsp;&nbsp;</td>
		<td><input name="o_total_amount" readonly size="13" 
		value="<%=UtilMgr.intFormat(priceTotal+shippingPrice) %>">원</td>
	</tr>
	<tr>
		<td>구매시 <%=UtilMgr.intFormat(priceTotal)%>원(5%)적립예정</td>
	</tr>
</table>
<hr/>
<table id="">
	<tr>
		<td>결재수단</td>
	</tr>
	<tr>
		<td>일반결재 &nbsp;&nbsp;&nbsp;</td>
		<td> 신용카드<input type=radio name="o_pay_method" value="신용카드" 
				onclick='paymentMethod(this.value);' checked>&nbsp;&nbsp;&nbsp;
  			 	휴대폰<input type=radio name="o_pay_method" value="휴대폰" 
  			 	onclick='paymentMethod(this.value);'>
  			 	</td>
  	</tr>
 </table>
  <table>
  	<tr id='tr1'>
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
	</table>
		<table>
			<tr id='tr2' style="display:none">
				<td><input name="cellphone1" size="13" 
				placeholder="010-1234-1234"><td>
			</tr>
		</table>
<table>
	<tr>
		<td>간편결제 &nbsp;&nbsp;&nbsp;</td>
		<td>네이버 페이<input type=radio name="o_pay_method" 
		value="네이버페이" onclick='paymentMethod(this.value);'></td>
  	</tr>
</table>

<hr>
<table>
	<tr>
		<td>개인정보 수집/제공*</td>
	</tr>
	<tr>
		<td><input id="agreement" type=checkbox value=1>결재진행 필수동의</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;개인정보 수집/이용동의(필수)</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="">약관확인></a></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;결재대행 서비스 약관 동의(필수)</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="">약관확인></a></td>
	</tr>
</table>
<hr>
	<input type="submit" value="결재완료" onclick="agreement()">
</form>
</body>
</html>













