<%@ page contentType="text/html; charset=EUC-KR"%>

<%

		request.setCharacterEncoding("EUC-KR");
%>

<%@ include file="../top.jsp"%>

	<link rel="stylesheet" type="text/css" href="../vscode__utf8/order/css/order_end.css">
	
	
	<main id="end_wrapper">
		<div id="end_moddal">
			<header>
				<!-- fontawesome -->
				<span>김성진</span><span>님의 주문이 완료되었습니다.</span>
			</header>
			<div>
				<span>결제금액</span>
				<span>(금액)</span>원
				<span>(포인트)원 적립</span>
			</div>
			<div>
				<a class="btn" href="../index.jsp"> 홈으로 이동 </a>
				<a class="btn" href="../mypage_oderlist.jsp"> 주문내역으로 이동 </a>
			</div>
		</div>
		
	</main>
</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->

<%@ include file="../bottom.jsp"%>

</body>
</html>



