<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductBean"%>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<jsp:useBean id="mgr" class="admin.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ProductBean> list = mgr.printPname();
		String pnameList[] = mgr.readPname();
		out.println(list.size());
		
		//need to search variable 
		String p_name = "";
		int p_date1=0;
		int p_date2=0;
		
		//if do Searching
		if(request.getParameter("p_name")!=null){
			p_name = request.getParameter("p_name");
			p_date1 = Integer.parseInt(request.getParameter("p_date1"));
			p_date2 = Integer.parseInt(request.getParameter("p_date2"));
		}
		
		//After searching, request first screen again
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
			p_name = ""; 
			p_date1=0; 
			p_date2=0; 
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

<script type ="text/javascript">
function check() {
	f = document.SearchFrm;
	if(f.p_name.value.length==0){
		alert("제품명을 선택하세요");
		f.p_name.focus();
		return;
	}
	if(f.p_date1.value.length==0 || f.p_date1.value.length!=8){
		alert("기간을 올바르게 입력해주세요 ex) 20191217")
		f.p_date1.focus();
		return;
	}
	
	function list() {
		document.listFrm.action = "goods_master.jsp";
		document.listFrm.submit();
	}
	
	if(f.p_date2.value.length==0 || f.p_date2.value.length!=8){
		alert("기간을 올바르게 입력해주세요 ex) 20191217")
		f.p_date2.focus();
		return;
	}f.submit();
}

function listSelect() {
	f = document.SearchFrm;
	pl = f.pnameList;
	f.p_name.value = pl.options[pl.selectedIndex].value;
}
/* checkbox javascript */
 
 function allChk() {
	f= document.rFrm;
	if(f.allCh.checked){
		for(i=0;i<f.fch.length;i++){
				/*항목의 체크버튼(fch)들이 배열이기에*/
			f.fch[i].checked = true;
		}
		f.btn.disabled = false;//버튼의 활성화
	}else{
		for(i=0;i<f.fch.length;i++){
			f.fch[i].checked = false;
		}
		f.btn.disabled = true;	//버튼의 비활성화			
	}
}
 function chk(){
		f=document.rFrm;
		for(i=1; i<f.fch.length;i++){
			//alert(f.fch[i].value);
			if(f.fch[i].checked){ //fch 체크박스가 체크가 된 경우
				f.btn.disabled = false;
			return; //밑에 있는 체크박스의 체크 유무는 무의미
			}
		}
		f.allCh.checked= false; //전체체크박스 해제
		f.btn.disabled = true; //버튼 비활성화
	}
 
</script>
</head>

<body>
<h3>제품정보</h3>

<form name = "listFrm">
	<input type ="hidden"  name ="reload" value="true">
</form>


<form name ="SearchFrm" method="get" >
<input type = "hidden" name ="fch" value="0">	
<hr>
<h4>제품정보 검색</h4>
<table>
	<tr>
		<td >제품명</td>
		<td>
		<select name ="pnameList" onchange = "listSelect()">
		<option value ="">제품명 선택</option>
		<%for(int i=0; i<pnameList.length;i++){ %>
		<option value ="<%=pnameList[i]%>"><%=pnameList[i]%></option>
		<%} %>		
		</select>		
		<input name ="p_name" value="<%=p_name%>">
		</td>		
	</tr>
	<tr>
		<td>검색기간(등록일)</td>
		<td>
			<input name ="p_date1" size="20"  value="<%=p_date1%>"> &nbsp; ~ &nbsp;
			<input name ="p_date2" size="20" value="<%=p_date2%>">			
			<input type="button" value="search" onclick="check()">
		</td>
	</tr>	
</table>
		
</form>

	<form name=rFrm action="goods_Proc.jsp?flag=update">
<table>
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
			<td><input type ="checkbox" name= "allCh" onclick="allChk()"></td>					
			<td>제품코드</td>
			<td>상품명</td>
			<td>상품가격</td>
			<td>등록일</td>
			<td>판매여부</td>
			<td>재고수량</td>
		</tr>			
			<% 
			for(int i=0; i<slist.size(); i++){
				ProductBean pbean = slist.get(i);
				int p_code = pbean.getP_code();
		%>			
			<tr>
			<td>
			<input type ="checkbox" name="fch" value="<%=p_code%>" onclick="chk()"></td>			
			<td><%=pbean.getP_code() %></td>
			<td><%=pbean.getP_name() %></td>
			<td><%=pbean.getP_price() %></td>
			<td><%=pbean.getP_date() %></td>
			<td><%=pbean.getP_on_sale() %></td>
			<td><%=pbean.getSt_ava_qty() %></td>		
		</tr>
	<%}//--for %>
	<%}//--else %>
		</table>
		<input type ="submit" value="수정">
		<input type ="button" value="삭제">
		<input type ="button" value="추가" onclick ="location.href='goods_insert.jsp'">
	</form>
</body>	
</html>
