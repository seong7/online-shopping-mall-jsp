<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="aMgr" class="admin.ProductMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String p_code[]=request.getParameterValues("fch");
	String type_check =request.getParameter("buffer");
	int num[] = new int[p_code.length];
	//System.out.println(type_check);
	String msg = "수정페이지로 이동합니다";
	String url = "goods_master.jsp";
	System.out.println("체크된 개수" + p_code.length);
	
	if(type_check.equals("update") && p_code.length==1){
	//update		
		System.out.println("update1");
		String q = "";
		for(int i=0; i<p_code.length; i++){
			System.out.println(p_code[i]);
			num[i] = Integer.parseInt(p_code[i]);
			q+="p_code="+p_code[i]+"&";
		}
			System.out.println(p_code);
		url = "goods_view.jsp?"+q;
	}else if(type_check.equals("update")&&p_code.length!=1){	
		System.out.println("update2");		
		msg = "수정시에는 하나만 선택해주세요.";	
	}else if(type_check.equals("delete")){
		System.out.println("delete1");
		msg = "선택하신 제품을 삭제합니다";
		for(int i=0; i<p_code.length; i++){
			System.out.println(p_code[i]);
			num[i] = Integer.parseInt(p_code[i]);
		}
		aMgr.deleteproduct(num);
		url="goods_master.jsp";
	}else{}
		System.out.println("--------------");
%>
<script type="text/javascript">	
	alert("<%=msg%>");
	location.href= "<%=url%>";
</script>
