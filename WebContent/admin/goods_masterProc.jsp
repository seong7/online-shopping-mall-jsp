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
	String msg = "������������ �̵��մϴ�";
	String url = "goods_master.jsp";
	System.out.println("üũ�� ����" + p_code.length);
	
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
		msg = "�����ÿ��� �ϳ��� �������ּ���.";	
	}else if(type_check.equals("delete")){
		System.out.println("delete1");
		msg = "�����Ͻ� ��ǰ�� �����մϴ�";
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
