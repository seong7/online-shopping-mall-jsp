<!--�ֹ����� ���� �� īƮ ����  -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="cmgr" class="order.CartMgr"/>
<jsp:useBean id="pmgr" class="admin.PolicyMgr"/>
<jsp:useBean id="pointMgr" class="order.PointMgr"/>
<jsp:useBean id="smgr" class="admin.StockMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<jsp:useBean id="odbean" class="order.OrderDetailBean"/>
<jsp:useBean id="pBean" class="order.PointBean"/>
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
		String usedPoint = request.getParameter("usedPoint");
		int point = 0;
		
		
		//order insert
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
		boolean orderResult=mgr.insertOrder(bean);
		
		//orderDetail insert
		int o_qtys[] = new int[countPart];
		int p_codes[] = new int[countPart];
		for(int i =0; i<countPart;i++){
			
			o_qtys[i] = Integer.parseInt(o_qty[i]);
			p_codes[i] = Integer.parseInt(p_code[i]);
			//����� ����
			smgr.subtractStock(Integer.parseInt(p_code[i]), 
					Integer.parseInt(o_qty[i]));
		}
		odbean.setO_qty(o_qtys);
		odbean.setP_code(p_codes);
		boolean orderDetailResult=mgr.insertDetailOrder(odbean);
		
		//cart Delete
		cmgr.deleteCart(o_id, p_codes);
		
		//Point process 
		point = (int)(o_prod_amount*pmgr.getRate());
		int orderMaxNum = mgr.getOrderMax(o_id);
		int pointRate = (int)(pmgr.getRate()*100);
		String pt_detail = "[��������] (�ֹ���ȣ: "+orderMaxNum+
				")"+pointRate + "% ����";
		pBean.setId(o_id);
		pBean.setPt_detail(pt_detail);
		pBean.setPt_point(point);
		pBean.setPt_category("��������");
		pointMgr.insertPoint(pBean);
		 
		if(!usedPoint.equals("")){//����Ʈ ����� ��
			point = -(Integer.parseInt(usedPoint));
			pt_detail = "[���Ż��] (�ֹ���ȣ: "+orderMaxNum+
					")"+usedPoint + "�� ���";
			pBean.setId(o_id);
			pBean.setPt_detail(pt_detail);
			pBean.setPt_point(point);
			pBean.setPt_category("���Ż��");
			pointMgr.insertPoint(pBean);
		}
		
		String msg = "";
		 if(orderResult&&orderDetailResult){
			//msg = "���簡 �Ϸ�Ǿ����ϴ�.";
			mName = URLEncoder.encode(mName);
			response.sendRedirect("order_end.jsp?mName="+mName+"&o_total_amount="+o_total_amount);

		}else{
			msg = "�������";
			%>
		<script>
			alert("<%=msg%>");
		</script>
		<%
			response.sendRedirect("order.jsp");
		}
		%>
