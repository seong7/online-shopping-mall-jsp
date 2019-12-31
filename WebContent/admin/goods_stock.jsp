<!-- member connect -->
<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
	<jsp:useBean id="bean" class="admin.StockBean"/>
	<jsp:useBean id="amgr" class="admin.ProductMgr"/>
	<jsp:useBean id="smgr" class ="admin.StockMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	
	int p_code = bean.getP_code();
	int st_enter_qty = bean.getSt_enter_qty	();
	String st_exp_date = bean.getSt_exp_date();				
%>
<%@ include file="../top.jsp" %>

<%@ include file="./admin_side.jsp"%> 
<link rel="stylesheet" type="text/css" href="./css/goods_stock.css">
<link rel="stylesheet" type="text/css" href="../css/util_btn.css">

<!--------------->
<!--  작업 영역  -->
<!--------------->
	<div id="manage_wrap">
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
      		<span>유통기한 :</span>
      		<input type="date" class="signup_input signup_long_input" id="modal_date" readonly="readonly">
	      </div>
	      <div>
	      	<button class ="btn-gradient maincolor small button_items" type="button" id="modal_update_btn">제품수정</button>
	      	<button class="btn-gradient maincolor small button_items" type="button" id="modal_close_btn">수정취소</button>
	      </div>
   	</div>
   </div>
</div>
 <!-- 메인 콘텐츠 -->
    <div id="main_wrapping">
 <h2 class="title">재고관리</h2>
 <div>
 	<div id="toggle_order_wrap">
 		<p>
			 <label class="checkbox" id="toggle_older">
				 <input type="checkbox" id="waste_qty_include">
				 <span class="icon"></span>
				 <span class="text">유통기한 지난 제품 숨기기</span>
		 	</label>
	 	</p>
 	</div>
	<form name="search_result_frm" id="stock_form">
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
 <div id="options wrapper">
	<input class="btn-gradient maincolor small button_items" id="display_addstock" type="button" value="입고등록">		
	<input class="btn-gradient maincolor small button_items" type="button" id="stock_update_btn" value="제품 수정">
	<input class="btn-gradient maincolor small button_items" type="button" id="stock_delete_btn" value="선택 폐기">
	<input type="hidden" id="selected_data" value="">
 </div>
  	
 <div id="add_stock_wrapper">
		<h2 class="title">입고등록</h2>
 		<form name="searchfrm">
	      			<p>
		      			<select name="keyField" id="search_type" >	
			      			<option value="code">제품코드</option>
			      			<option value="name">제품이름</option>
		      			</select>
		      			<input name="keyWord"  id="product_search" autocomplete=”off”> 
		      			<input type ="button" class="btn-gradient maincolor small button_items" value="검색"  onClick="javascript:check()">
		      			<input type ="hidden" name = "nowpage" value="1">
	      			</p>
   	  	</form>
	  	<form name="stfrm" id="stfrm" method="get"  action="goods_stockProc.jsp">
		  	<div id="stfrm_wrapper">
		  		<table class="default_table left_margin10">
			  		<tr>
						<th>제품명</th>
						<td><input class="input_full disabled" name ="p_name" id="stfrm_name" ></td>
						<th>제품코드</th>
						<td><input class="input_full disabled" name ="p_code" id="stfrm_code" ></td>
					</tr>
					<tr>
			            <th>수량</th>
			            <td><input class="input_full" name ="st_enter_qty"></td>
			            <th>유통기한</th>
			            <td><input class="input_full" type="date" name ="st_exp_date"></td>
			         </tr>
	            </table>
		     </div>
		     <div id="save_btn_wrap">
	     	<p>
	     		<input type="button" class="btn-gradient maincolor small button_items" value="저장" onClick="submitStock();"> 
	     	</p>
     		</div>
	 </form>
   </div>
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
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
<script src="js/member_connect.js"></script>
</body>
</html>
