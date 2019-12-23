<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductBean"%>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ProductBean> list = amgr.printPname();
		String pnameList[] = amgr.readPname();
		//out.println(list.size());		   
		
		//Printing yymmdd
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal1 = Calendar.getInstance();	Calendar cal2 = Calendar.getInstance();
		int year = Integer.parseInt((sdf.format(cal2.getTime())).substring(0, 4));
		int month = Integer.parseInt((sdf.format(cal2.getTime())).substring(4, 6));
		int date = Integer.parseInt((sdf.format(cal2.getTime())).substring(6, 8));
		cal1.set(year ,month-1, date);	cal1.add(Calendar.MONTH, -1);
						
		int today1 = Integer.parseInt(sdf.format(cal1.getTime()));
		int today2 = Integer.parseInt(sdf.format(cal2.getTime()));			
		
		//need to search variable 
		String p_name = "";	int p_date1=0;	int p_date2=0;
		
		//if do Searching
		if(request.getParameter("p_name")!=null){
			p_name = request.getParameter("p_name");
			p_date1 = Integer.parseInt(request.getParameter("p_date1"));
			p_date2 = Integer.parseInt(request.getParameter("p_date2"));
		}
		
		//After searching, request first screen again
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
			p_name = ""; p_date1=0; p_date2=0; 
		}	
%>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type ="text/javascript" src="./js/goods_master.js"></script>
<link rel="stylesheet" href="./css/admin_style.css">

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 
	
	<div id="manager">
	
		<h1 class="title">��ǰ���</h1>

		<form name = "listFrm">
			<input type ="hidden"  name ="reload" value="true">
		</form>

		<form name ="SearchFrm" method="get" >
		
			<input type = "hidden" name ="fch" value="0">	
			
			<h3 class="inner_title">��ǰ�� �˻�</h3>
			
			<table class="mgr_table verHead">
				<tr>
					<th>��ǰ��</th>
					<td>
						<select id="p_select" name ="pnameList" onchange = "listSelect()">
						<option value ="">��ǰ�� ����</option>
						<%for(int i=0; i<pnameList.length;i++){  %>
						<option value ="<%=pnameList[i]%>"><%=pnameList[i]%></option>
						<%} %>		
						</select>		
						<input name ="p_name" value="<%=p_name%>">
					</td>		
				</tr>
				<tr>
					<th>�˻��Ⱓ(�����)</th>
					<td>
						<input name ="p_date1" size="20"  <%if(p_date1==0){ %>placeholder="<%=today1%>"
						<%}else{ %> value="<%=p_date1%>" <%} %>> &nbsp; ~ &nbsp;
						<input name ="p_date2" size="20" <%if(p_date2==0) { %>placeholder="<%=today2%>" 
						<%}else{ %> value="<%=p_date2%>" <%} %>>
								
						<input id="search_btn" type="button" value="�˻�" onclick="check()">
					</td>
				</tr>	
			</table>
				
		</form>

	<!-- <form name=rFrm action="goods_Proc.jsp?flag=delete" enctype="multipart/form-data"> -->
	<form name=rFrm id="rFrame" action="goods_masterProc.jsp" enctype="multipart/form-data">

		<table class="mgr_table horHead">
			<tr>
				<%
					//p_name = request.getParameter("p_name");
					//p_date1 = Integer.parseInt(request.getParameter("p_date1"));
					//p_date2 = Integer.parseInt(request.getParameter("p_date2"));
					Vector<ProductBean> slist = amgr.searchproduct(p_name, p_date1, p_date2);					
					int listSize = slist.size();
					if(slist.isEmpty()){
						//out.println(p_name);
						//out.println(p_date1);
						//out.println(p_date2);				
						//out.println(slist.size());				
						out.println("�˻��������");
					}else{
						
				%>
				<tr>
					<td>
						<input class="checkbox" type ="checkbox" name="allCh" onclick="allChk()" >
					</td>					
					<th>��ǰ�ڵ�</th>
					<th>��ǰ��</th>
					<th>��ǰ����</th>
					<th>�����</th>
					<th>�Ǹſ���</th>
					<th>������</th>
				</tr>			
					<% 
					for(int i=0; i<slist.size(); i++){
						ProductBean pbean = slist.get(i);
						int p_code = pbean.getP_code();
				%>			
					<tr>
					<td>
						<input class="checkbox" type ="checkbox" name="fch" value="<%=p_code%>" onclick="chk()" >
					</td>						
					<td><a href="goods_view.jsp?p_code=<%=pbean.getP_code()%>"><%=pbean.getP_code() %></a></td>
					<td><a href="goods_view.jsp?p_code=<%=pbean.getP_code()%>"><%=pbean.getP_name() %></a></td>
					<td><%=pbean.getP_price() %></td>
					<td><%=pbean.getP_date() %></td>
					<td><%=pbean.getP_on_sale() %></td>
					<td><%=pbean.getSt_ava_qty() %></td>		
				</tr>
			<%}//--for %>
			<%}//--else %>
			
		</table>
		<div class="submit_wrapper">
			<input class="btn" type ="button" name="update" id="update_btn" value="���� ����">
			<input class="btn" type="button" name="delete" id="delete_btn" value="���� ����" disabled>
			<input class="btn" type ="button" value="��ǰ �߰�" onclick ="location.href='goods_insert.jsp'">	
			<input type ="hidden" name="buffer" id="buffer">
		</div>

	</form>

	</div>


</div> <!--  #btn_manager_wrapper (��ư�޴� + manager) : admin_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + manager) : admin_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
	
</body>	
</html>
