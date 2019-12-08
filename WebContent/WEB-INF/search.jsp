<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String searchValue = request.getParameter("searchValue"); 
	JSONArray arrayObj=new JSONArray();
	JSONObject jsonObj = null;
	 //////////// 임의의데이터(db라 가정하자) //////////// 
	 ArrayList<String> dblist = new ArrayList<String>(); 
	 ArrayList<String> resultlist = new ArrayList<String>();
	dblist.add("Afghanistan"); 
	dblist.add("Albania"); 
	dblist.add("Algeria");
	dblist.add("American"); 
	dblist.add("Samoa"); 
	dblist.add("Andorra");
	for(String str : dblist) { 
		if(str.toLowerCase().startsWith(searchValue)){
			 resultlist.add(str); 
		}
	} ///////////resultlist를 db에서 조회후 뽑아온 list라고 가정한다.
	/////////// //뽑은 후 json파싱 
	for(String str : resultlist) { 
		jsonObj = new JSONObject(); 
		jsonObj.put("data", str);
		arrayObj.add(jsonObj);
	}
	PrintWriter pw = response.getWriter(); 
	pw.print(arrayObj); 
	pw.flush();
	pw.close();
%>