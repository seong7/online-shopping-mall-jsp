<%@page import="order.PointBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.PointMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
	<style>
		.point_blue{
			color: #4b4bf9;
			text-shadow: 0.5px 0.5px 0.5px #4b4bf9;
		}
		.point_red{
			color: #f74d4d;
			text-shadow: 0.5px 0.5px 0.5px #f74d4d;
		}
	</style>
	<div id="mypage">
	
		<h1 class="title">포인트관리</h1>
	
		<table class="mypage_table horHead">	
						
			<tr id="column_tr">
				<th>번호</th>
				<th>내용</th>
				<th>금액</th>
				<th>날짜</th>
			</tr>
				<%
					Vector<PointBean> plist = mgr.getPointList(id);
					System.out.println("포인트리스트의 개수는?:"+plist.size());	
					int listSize =plist.size(); 
					if(plist.isEmpty()){
				%>
					<tr>
						<td colspan="4">포인트 내역이 없습니다</td>
					</tr>
				<%
					}else{
					for(int i=0; i<plist.size(); i++){
					PointBean pbean = plist.get(i);
					int num = i+1;
				%>
			<tr>
			<td><%=num%></td>		
			<td class="btn_td"><a href="../order/mypage_order_view.jsp?order=<%=pbean.getO_index()%>"><%=pbean.getPt_detail()%></a></td>
			<%if(pbean.getPt_point()>0){%>	
			<td><font class="point_blue"><%=UtilMgr.intFormat(pbean.getPt_point())%></font></td>
			<%}else if(pbean.getPt_point()<0){%>
			<td><font class="point_red"><%=UtilMgr.intFormat(pbean.getPt_point())%></font></td>
			<%}else{%>
			<td><%=UtilMgr.intFormat(pbean.getPt_point())%></td>
			<%}%>
			<td><%=pbean.getPt_date()%></td>
			</tr>
			<%}//--for%>
		<%}//--else%>
			
		</table>
	</div>

</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>
</html>