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
		out.println(list.size());		   
		
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
		String p_name = "";	int p_date1=today1;	int p_date2=today2;
		
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


<jsp:include page="../top.jsp"/>

	<jsp:include page="./admin_side.jsp"/>


	<div id="manager">
	
		<h1 class="title">제품목록</h1>

		<form name = "listFrm">
			<input type ="hidden"  name ="reload" value="true">
		</form>


		<form name ="SearchFrm" method="get" >
		
			<input type = "hidden" name ="fch" value="0">	
			
			<h3 class="inner_title">제품명 검색</h3>
			
			<table class="mgr_table verHead">
				<tr>
					<th>제품명</th>
					<td>
						<select id="p_select" name ="pnameList" onchange = "listSelect()">
						<option value ="">제품명 선택</option>
						<%for(int i=0; i<pnameList.length;i++){ %>
						<option value ="<%=pnameList[i]%>"><%=pnameList[i]%></option>
						<%} %>		
						</select>		
						<input name ="p_name" value="<%=p_name%>">
					</td>		
				</tr>
				<tr>
					<th>검색기간(등록일)</th>
					<td>
						<input name ="p_date1" size="20"  value="<%=p_date1%>"> &nbsp; ~ &nbsp;
						<input name ="p_date2" size="20" value="<%=p_date2%>">			
						<input id="search_btn" type="button" value="검색" onclick="check()">
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
						out.println(p_name);
						out.println(p_date1);
						out.println(p_date2);				
						out.println(slist.size());				
						out.println("검색결과없음");
					}else{
						
				%>
				<tr>
					<td>
						<input class="checkbox" type ="checkbox" name="allCh" onclick="allChk()" >
					</td>					
					<th>제품코드</th>
					<th>상품명</th>
					<th>상품가격</th>
					<th>등록일</th>
					<th>판매여부</th>
					<th>재고수량</th>
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
			<input class="btn" type ="button" name="update" id="update_btn" value="선택 수정">
			<input class="btn" type="button" name="delete" id="delete_btn" value="선택 삭제" disabled>
			<input class="btn" type ="button" value="제품 추가" onclick ="location.href='goods_insert.jsp'">	
			<input type ="hidden" name="buffer" id="buffer">
		</div>
	</form>

	</div>


</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<jsp:include page="../bottom.jsp"/>	
	
</body>	
</html>
