<!-- 관리자 order view 페이지 -->
<%@page contentType="text/html; charset=EUC-KR"%>
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
		String id = request.getParameter("id");
%>

<html>
<head>
</head>
<body>
<div align="center"><br/>
<h2>주문 상세 정보</h2>
<hr width="60%">
<table>
	<tr>
		<th>주문번호<th>
		<td><td>
		<th>주문자 ID<th>
		<td><td>
	</tr>
	<tr>
		<th>주문번호<th>
		<td><td>
		<th>주문자 ID<th>
		<td><td>
	</tr><tr>
		<th>주문자명<th>
		<td><td>
		<th>전화번호(주문자)<th>
		<td><td>
	</tr><tr>
		<th>수령자명<th>
		<td><td>
		<th>전화번호(수령자)<th>
		<td><td>
	</tr>
	<tr>
		<th>주소<th>
		<td><td>
		<th>상세주소<th>
		<td><td>
	</tr>
	<tr>
		<th>배송 메세지<th>
		<td><td>
		<th>주문일시<th>
		<td><td>
	</tr>
	<tr>
		<th>상품금액<th>
		<td><td>
		<th>배송비<th>
		<td><td>
	</tr>
	<tr>
		<th>결재금액<th>
		<td><td>
		<th>결재방법<th>
		<td><td>
	</tr>
</table>
</div>
</body>