<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="admin.StockBean"/>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<jsp:useBean id="smgr" class ="admin.StockMgr"/>
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
    <div>
 		<form name="searchfrm">
      
      			<h2>입고등록</h2>
      			<hr>
      			<p><select name="keyField" >
      			<option value="opcode">제품코드</option>
      			<option value="opname">제품이름</option>
      			</select>       			
      			<input name="keyWord"> 
      			<input type ="button" value="검색"  onClick="javascript:check()">
      			<input type ="hidden" name = "nowpage" value="1">
      			</p>      			 
    	  </form>
      </div>
      			<hr>
<form name="stfrm" method="get" action="goods_stockProc.jsp">
	  <div >			
				<p>제품명 <input name ="p_name" ></p>
                <p>제품코드 <input name ="p_code" ></p> 						
                <p>수량 <input name ="st_enter_qty"></p>
                <p>유통기한 <input type="date" name ="st_exp_date"> </p>
            <input type="button" value="저장" onClick="submitStock();"> 
      </div>
 </form>
    
 <hr>
 <h2>검색결과</h2>

 <div>
 	<form name="search_result_frm">
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
 			<% for(int i =1; i<10; i++){%> 			
 			<tr> 			
 			<td><%out.println(i);%></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td> 				
 			</tr>
 				<%}%>
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
     function check() {
 		if(document.searchFrm.keyWord.value==""){
 			alert("검색어를 입력하세요.");
 			document.searchFrm.keyWord.focus();
 			return;
 		}
 		document.searchFrm.submit();
 	}    
      </script>

</html>
