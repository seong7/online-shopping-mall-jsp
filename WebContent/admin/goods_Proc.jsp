<!-- goods_Proc.jsp -->
<%@page import="product.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="admin.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		String msg = "������ �߻��Ͽ����ϴ�.";
		
		boolean result = false;
		
			
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "��ǰ�� ����Ͽ����ϴ�.";
		}else if(flag.equals("update")){
			result = pMgr.updateProduct(request);
			if(result) msg ="��ǰ�� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){	
			int p_code = Integer.parseInt(request.getParameter("pcode")); 
			System.out.println("�÷��״�"+flag);
			System.out.println(p_code);
			pMgr.deleteproduct1(p_code);
			msg = "��ǰ�� �����Ͽ����ϴ�.";			
		}else{}
		
%>
<script>
	alert("<%=msg%>");
	location.href = "goods_master.jsp";
</script>