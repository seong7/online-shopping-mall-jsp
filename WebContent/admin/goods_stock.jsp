<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
	<jsp:useBean id="bean" class="admin.StockBean"/>
	<jsp:useBean id="amgr" class="admin.ProductMgr"/>
	<jsp:useBean id="smgr" class ="admin.StockMgr"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="./css/goods_stock.css">
	

		
<%
	request.setCharacterEncoding("EUC-KR");
	
	int p_code = bean.getP_code();
	int st_enter_qty = bean.getSt_enter_qty	();
	String st_exp_date = bean.getSt_exp_date();				
%>
 <html>
 <head> 
 </head>
 <!-- 모달 -->
 <div id="modalDiv2">
    <div id="modalInnerFrame2">
      <div id="modal_elements_wrapper2">
	     <div id="modal__div">
	     	<input type="hidden" id="modal_code">
      		<span>제품명 :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_name" readonly="readonly">
	     </div>
	     <div id="modal_enter_div">
      		<span>입고수량 :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_enter">
	      </div>
	      <div id="modal_ava_div">
      		<span>재고수량 :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_ava">
	      </div>
	      <div id="modal_waste_div">
      		<span>폐기수량 :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_waste">
	      </div>
	      <div id="modal_date_div">
      		<span>입고일 :</span>
      		<input type="date" class="signup_input signup_long_input" id="modal_date" readonly="readonly">
	      </div>
	      <div>
	      	<button type="button" id="modal_update_btn">제품수정</button>
	      	<button type="button" id="modal_close_btn">수정취소</button>
	      </div>
   	</div>
   </div>
</div>
 <!-- 메인 콘텐츠 -->
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
 <label>
 <input type="checkbox" id="waste_qty_include"> 폐기 제품 포함
</label>
<input type="button" id="stock_delete_btn" value="선택 폐기">
<input type="button" id="stock_update_btn" value="제품 수정">

<input type="hidden" id="selected_data" value="">
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
