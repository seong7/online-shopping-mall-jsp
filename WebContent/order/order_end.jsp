<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>


<%
		request.setCharacterEncoding("EUC-KR");

		/****  ������ ���� �޾ƾ��ϴ� �κ� !!!  *****/
		String mName = null; 				//�̸�
		int o_total_amount = 0;		    //�� ���� �ݾ�
		double pointRate = 0;             //����Ʈ ����
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
					<span id="name"><%=mName %></span><span>���� �ֹ��� �Ϸ�Ǿ����ϴ�.</span>
				</header>
				<div id="end_modal_summ">
					<span>�����ݾ�</span>
					<span><%=UtilMgr.intFormat(o_total_amount)%>��</span>
					<span><%=UtilMgr.intFormat((int)(o_total_amount*pointRate))%>�� ����</span>
				</div>
				<div id="end_modal_btn_wrapper">
					<a class="btn" href="../index.jsp"> Ȩ���� �̵� </a>
					<a class="btn" href="../mypage_oderlist.jsp"> �ֹ��������� �̵� </a>
				</div>
			<!-- </div> -->
		</div>
		
	</main>
</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->

<%@ include file="../bottom.jsp"%>

</body>
</html>


