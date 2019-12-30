<%@page import="order.PointBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.PointMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		String cpath = request.getContextPath();
		
		if(id==null || id.length()==0){
			response.sendRedirect(cpath+"/index.jsp");
		}else{	
			System.out.println(id);			
		}		
%>

<html>
<head>
	<style>
	table {border: 1px solid; border-collapse:collapse; 
				width: 70%; text-align:center;}
	td{border: 1px solid;}
	thead{background:lightgray;}
	</style>
</head>

	<table>	
		<tr>
		<th>포인트 사용 내역</th>
		</tr>	
				
		<tr>
			<th>번호</th>
			<th>적립내용</th>
			<th>적립금액</th>
			<th>적립날짜</th>
		</tr>
			<%
				Vector<PointBean> plist = mgr.getPointList(id);
				System.out.println("포인트리스트의 개수는?:"+plist.size());	
				int listSize =plist.size(); 
				if(plist.isEmpty()){
				out.println("포인트 내역이 없습니다.");
				}else{
				for(int i=0; i<plist.size(); i++){
				PointBean pbean = plist.get(i);
				int num = i+1;
			%>
		<tr>
		<td><%=num%></td>		
		<td><a href="../order/mypage_order_view.jsp?order=<%=pbean.getO_index()%>"><%=pbean.getPt_detail()%></a></td>
		<td><%=pbean.getPt_point()%></td>
		<td><%=pbean.getPt_date()%></td>
		</tr>
		<%}//--for%>
	<%}//--else%>
		
	</table>
</html>