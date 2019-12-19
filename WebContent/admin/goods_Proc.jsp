<!-- goods_Proc.jsp -->
<%@page import="Product.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="Admin.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		String msg = "오류가 발생하였습니다.";
		boolean result = false;
		System.out.println(flag);
			
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "상품을 등록하였습니다.";
		}else if(flag.equals("update")){
			//msg="성공이야";
			result = pMgr.updateProduct(request);
			if(result) msg ="상품을 수정하였습니다.";
		}else if(flag.equals("delete")){	
			String snum[]=request.getParameterValues("fch");
			//문자열 snum을 int형 배열 변환, num의 크기는 snum의 크기와 동일
			int p_code[] = new int[snum.length];
			//문자열 배열을 정수형 배열로 변환 값을 리턴(대입)
			for(int i=0;i<p_code.length;i++){
				p_code[i] = Integer.parseInt(snum[i]);
		}
			result = pMgr.deleteproduct(p_code);
			response.sendRedirect("goods_master.jsp");			
			if(result) msg = "상품을 삭제하였습니다.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "goods_master.jsp";
</script>