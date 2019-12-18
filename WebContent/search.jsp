<%@page import="java.net.URLDecoder"%>
<%@page import="Product.ProductMgr"%>
<%@page import="java.util.Vector" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%! 
public String makeKor(String s) throws java.io.UnsupportedEncodingException{ 
	String kor=""; 
	if (s==null) 
		kor=null; 
	else 
		kor=new String(s.getBytes("ISO-8859-1"),"EUC-KR"); 
	return kor; 
} 
%>
<%
	request.setCharacterEncoding("EUC-KR");
	String searchValue = URLDecoder.decode(request.getParameter("searchValue"), "UTF-8"); 
	System.out.println("search.jsp에서는 : "+searchValue);
	JSONArray arrayObj=new JSONArray();
	JSONObject jsonObj = null;
	 Vector<String> modellist = new Vector<String>(); 
	 Vector<String> resultlist = new Vector<String>(); 
	 ProductMgr mgr = new ProductMgr();
	 modellist = mgr.getProductList(searchValue);
	for(String str : modellist) { 
			resultlist.add(str); 
	} ///////////resultlist를 db에서 조회후 뽑아온 list라고 가정한다.
	/////////// //뽑은 후 json파싱
	for(String str : modellist) { 
		jsonObj = new JSONObject(); 
		jsonObj.put("data", str);
		arrayObj.add(jsonObj);
	}
	PrintWriter pw = response.getWriter(); 
	pw.print(arrayObj); 
	pw.flush();
	pw.close();
%>