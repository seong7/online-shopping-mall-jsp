<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
	<jsp:useBean id="bean" class="admin.StockBean"/>
	<jsp:useBean id="amgr" class="admin.ProductMgr"/>
	<jsp:useBean id="smgr" class ="admin.StockMgr"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
		 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>

		
<%
	request.setCharacterEncoding("EUC-KR");
	
	int p_code = bean.getP_code();
	int st_enter_qty = bean.getSt_enter_qty	();
	String st_exp_date = bean.getSt_exp_date();				
%>
 <html>
 <head> 
 </head>
    <div>
 		<form name="searchfrm">
      			<h2>입고등록</h2>
      			<hr>
      			<p><select name="keyField" id="search_type" >	
	      			<option value="code">제품코드</option>
	      			<option value="name">제품이름</option>
      			</select>       			
      			<input name="keyWord"  id="product_search" autocomplete=”off”> 
      			<input type ="button" value="검색"  onClick="javascript:check()">
      			<input type ="hidden" name = "nowpage" value="1">
      			</p>      			 
    	  </form>
      </div>
      <hr>
	  <form name="stfrm" method="get"  action="goods_stockProc.jsp">
	  <div>			
			<p>제품명 <input name ="p_name" id="stfrm_name" ></p>
            <p>제품코드 <input name ="p_code" id="stfrm_code" ></p> 						
            <p>수량 <input name ="st_enter_qty"></p>
            <p>유통기한 <input type="date" name ="st_exp_date"> </p>
            <input type="button" value="저장" onClick="submitStock();"> 
      </div>
 </form>
    
 <hr>
 <h2>검색결과</h2>

 <div>
	<form name="search_result_frm" id="stock_form">
		 <input type="button" value="입고등록">
		<table id="stock_table" class="cell-border hover nowrap order-column cell-border ">
			<thead>
				<tr id="judgeRow">
		 			<th>번호</th>
		 			<th>제품코드</th>
		 			<th>제품이름</th>
		 			<th>입고수량</th>
		 			<th>재고수량</th>
		 			<th>폐기수량</th>
		 			<th>남은일수</th>
		 			<th>유통기한</th>
	 			</tr> 		
			</thead>
		</table>
	</form>
 

 </div>
 <script src="./js/goods_stock.js"></script>
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
