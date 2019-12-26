<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="product.ProductBean"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="product.ProductMgr"%>
<%@page import="java.util.Vector" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%! 
public String makeKor(String s) throws java.io.UnsupportedEncodingException{ 
	String kor=""; 
	if (s==null) 
		kor=null; 
	else 
		kor=new String(s.getBytes("ISO-8859-1"),"UTF-8"); 
	return kor; 
} 
%>
<%
	request.setCharacterEncoding("UTF-8");
	String searchValue = URLDecoder.decode(request.getParameter("searchValue"), "UTF-8"); 
	String type = request.getParameter("searchType");
	
	System.out.println("타입은" + type);
	System.out.println("search.jsp에서는 : "+searchValue);
	JSONArray arrayObj = new JSONArray();
	ProductMgr mgr = new ProductMgr();
	Vector<ProductBean> vlist = mgr.getstockdata(type, searchValue);
	for(int i=0; i<vlist.size(); i++){
		ProductBean bean = vlist.get(i);
		JSONObject obj = new JSONObject();
		obj.put("code", bean.getP_code());
		obj.put("name", bean.getP_name());
		arrayObj.add(obj);
	}
	PrintWriter pw = response.getWriter(); 
	pw.print(arrayObj); 
	pw.flush();
	pw.close();
%>