<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<jsp:useBean id="polMgr" class="admin.PolicyMgr" />

<%
		request.setCharacterEncoding("EUC-KR");

		/****  데이터 전달 받아야하는 부분 !!!  *****/
		String mName = request.getParameter("mName"); //이름
		int o_total_amount = Integer.parseInt(request.getParameter("o_total_amount")); //총 결제 금액
		int o_prod_amount = Integer.parseInt(request.getParameter("o_prod_amount")); // 총 상품 금액 
//		double pointRate = 0.3;             //포인트 비율
		double pointRate = polMgr.getRate();     //포인트 비율 db에서 가져옴 
		/*******************************/		

%>
<%@ include file="../top.jsp"%>

	<link rel="stylesheet" type="text/css" href="./css/order_end.css">
	
	<main id="end_wrapper">
	
		<div id="end_modal">
			<!-- <div id="end_modal_wrapper"> -->
				<header>
					<div id="end_modal_icon">
						<i class="fas fa-ellipsis-h"></i>
						<i class="fas fa-truck"></i>
					</div>
					<span id="name"><%=mName %></span><span>님의 주문이 완료되었습니다.</span>
				</header>
				<div id="end_modal_summ">
					<span>결제금액</span>
					<span><%=UtilMgr.intFormat(o_total_amount)%>원</span>
					<span><%=UtilMgr.intFormat((int)(o_prod_amount*pointRate))%>원 적립</span>
				</div>
				<div id="end_modal_btn_wrapper">
					<a class="btn" href="../index.jsp"> 홈으로 이동 </a>
					<a class="btn" href="mypage_orderlist.jsp"> 주문내역으로 이동 </a>
				</div>
			<!-- </div> -->
		</div>
		
	</main>
</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->

<%@ include file="../bottom.jsp"%>

</body>
</html>



