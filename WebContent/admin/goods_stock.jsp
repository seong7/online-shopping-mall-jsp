<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="admin.StockBean"/>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int p_code = bean.getP_code();
		int st_enter_qty = bean.getSt_enter_qty();
		String st_exp_date = bean.getSt_exp_date();				
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
    <div id="myModal" class="modal">
 <form name="stfrm" method="get" action="goods_stockProc.jsp">
      <div >
      			<h2>입고등록</h2>
      			<hr>
      			<p><select name="opList" onchange ="opSelect()">
      			<option value="opcode">제품코드</option>
      			<option value="opname">제품이름</option>
      			</select>       			
      			<input type ="search" name="sname"> 
      			<input type ="button" value="검색" ></p> 
      			<hr>
				<p>제품명 <input name ="p_name" ></p>
                <p>제품코드 <input name ="p_code" ></p> 						
                <p>수량 <input name ="st_enter_qty"></p>
                <p>유통기한 <input type="date" name ="st_exp_date"> </p>
            <input type="button" value="저장" onClick="submitStock();"> 
      </div>
 </form>
    </div>
 <hr>
 <h2>검색결과</h2>

 <div>
 	<form name="searchfrm">
 <input type="button" value="입고등록">
 		<table>
 			<tr>
	 			<th>번호</th>
	 			<th>제품코드</th>
	 			<th>제품이름</th>
	 			<th>입고수량</th>
	 			<th>재고수량</th>
	 			<th>폐기수량</th>
	 			<th>남은일수</th>
	 			<th>유통기한</th>
 			</tr>
 			<tr>
 			<%for(int i=1; i<10; i++){ %>
 				<td><%out.println(i);%></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 			</tr>
 				<%} %>
 		</table>
 	</form>
 
 </div>
 
    <script type="text/javascript">      
	function submitStock() {
       	f=document.stfrm;
       	alert("저장되었습니다.");
       	f.submit();
        };      
     function opSelect(){
    	 f=document.stfrm;
    	 pl = f.opList;
    	 f.sname.name=pl.options[pl.selectedIndex].value;    		 
     }
      </script>

</html>
