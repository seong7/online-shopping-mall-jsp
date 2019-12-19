<!-- goods_Proc.jsp -->
<%@page import="product.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="admin.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		String msg = "오류가 발생하였습니다.";		
		boolean result = false;
			
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "상품을 등록하였습니다.";
		}else if(flag.equals("update")){
			//result = pMgr.updateProduct(request);
			if(result) msg ="상품을 수정하였습니다.";
		}else if(flag.equals("delete")){
			int no = UtilMgr.parseInt(request, "no");
			//result = pMgr.deleteProduct(no);
			if(result) msg = "상품을 삭제하였습니다.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "goods_insert.jsp";
</script>