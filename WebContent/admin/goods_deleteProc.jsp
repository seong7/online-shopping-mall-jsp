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
	System.out.println(type_check);
	String msg = "수정시에는 하나의 품목만 선택해주세요";
	
	if(type_check.equals("update") && p_code.length==1){
	//update, delete
		for(int i=0; i<p_code.length; i++){
			System.out.println(p_code[i]);			
		}		
	}else{
		msg
	}	
	if(type_check.equals("delete")){
		for(int i=0; i<p_code.length; i++){
			System.out.println(p_code[i]);		
		}	
	System.out.println("딜리트");
	}	
%>
<script>
	alert="msg"
	location.href=""
</script>
