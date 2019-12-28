<!--주문내역 저장 및 카트 삭제  -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="cmgr" class="order.CartMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<jsp:useBean id="odbean" class="order.OrderDetailBean"/>

<script>
	// order insert 또는 order detail insert 실패 시 호출되는 function
	function err(){
		alert("알 수 없는 오류로 결제가 실패하였습니다.");
		history.go(-1);  /* 1페이지 뒤로보냄 (order.jsp 로 )*/
		// ==>  location.href  또는   response.sendRedirect 사용하면 request 값 보낼 수 없으므로  에러 발생함
	}
</script>


<%
		request.setCharacterEncoding("EUC-KR");
		
		String o_id = request.getParameter("o_id");
		String o_recpt_name = request.getParameter("o_recpt_name");
		String o_recpt_contact = request.getParameter("o_recpt_contact");
		String o_recpt_zipcode = request.getParameter("o_recpt_zipcode");
		String o_recpt_add = request.getParameter("o_recpt_add");
		String o_recpt_add_det = request.getParameter("o_recpt_add_det");
		String o_del_msg = request.getParameter("o_del_msg");
		String o_status = request.getParameter("o_status");
		int o_prod_amount = Integer.parseInt(request.getParameter("o_prod_amount"));
		int o_del_fee =Integer.parseInt(request.getParameter("o_del_fee"));
		int o_total_amount = Integer.parseInt(request.getParameter("o_total_amount"));
		String o_pay_method = request.getParameter("o_pay_method");
		String[] o_qty = request.getParameterValues("o_qty");
		String[] p_code = request.getParameterValues("p_code");
		int countPart =Integer.parseInt(request.getParameter("countPart"));
		String mName =request.getParameter("mName");
		String flag = request.getParameter("flag");
		
		
		
		//order_tb insert
		bean.setO_id(o_id);
		bean.setO_recpt_name(o_recpt_name);
		bean.setO_recpt_contact(o_recpt_contact);
		bean.setO_recpt_zipcode(o_recpt_zipcode);
		bean.setO_recpt_add(o_recpt_add);
		bean.setO_recpt_add_det(o_recpt_add_det);
		bean.setO_del_msg(o_del_msg);
		bean.setO_prod_amount(o_prod_amount);
		bean.setO_del_fee(o_del_fee);
		bean.setO_total_amount(o_total_amount);
		bean.setO_pay_method(o_pay_method);
		bean.setO_status(o_status);
		boolean orderResult = mgr.insertOrder(bean);
		
		if(orderResult){
			
			//orderDetail_tb insert
			int o_qtys[] = new int[countPart];
			int p_codes[] = new int[countPart];
			for(int i =0; i<countPart;i++){
				o_qtys[i] = Integer.parseInt(o_qty[i]);
				p_codes[i] = Integer.parseInt(p_code[i]);
			}
			odbean.setO_qty(o_qtys);
			odbean.setP_code(p_codes);
			boolean orderDetailResult=mgr.insertDetailOrder(odbean);
			
			
			if(orderDetailResult){ /* order 생성 성공 시 */
				
				if(flag.equals("cart")){ /* flag = cart 일 경우 */
					//cart Delete
					cmgr.deleteCart(o_id, p_codes);
				} %>
				
				<!-- order_end.jsp 에 보내는 form -->
				<form id="order_end_frm" name="order_end_frm" method="post" action="order_end.jsp">
					<input type="hidden" name="mName" value="<%=mName %>" >
					<input type="hidden" name="o_total_amount" value="<%=o_total_amount %>" >
				</form>
				
				<script>
					const frmToSubmit = document.getElementById('order_end_frm');
					frmToSubmit.submit();
				</script>
					
			<%  return;
				
			} else{  // orderDetailResult = false 일 때  %> 
				<script>
					err();
				</script>
			<% }
		 } else{  // orderResult = false 일 때 %>
			<script>
				err();
			</script>
		<%
		 } %>
		
		

		
		

