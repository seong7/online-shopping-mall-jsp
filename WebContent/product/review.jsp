<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="product.ReviewBean" %>
<%@ page import="java.util.Vector" %>

<jsp:useBean id="reviewMgr" class="product.ReviewMgr"/>



	<table class="mypage_table horHead">
		<tr id="column_tr">
			<th>주문번호</th>
			<th colspan="2">제품정보</th>
			<th>구매일</th>
			<th>주문상태</th>
			<th></th>
		</tr>
		
	</table>