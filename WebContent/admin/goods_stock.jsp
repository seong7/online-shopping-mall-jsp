<%@page import="admin.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="admin.StockBean"/>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<jsp:useBean id="smgr" class ="admin.StockMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//총게시물 개수
		int numPerPage = 10;//페이지당 레코드 개수 (5,10,15,30)
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭
		
		//page에 보여줄 게시물 개수값
		if(request.getParameter("numPerPage")!=null&&
		!request.getParameter("numPerPage").equals("null")){
		numPerPage = UtilMgr.parseInt(request, "numPerPage");
	}		
		int start = 0;//테이블에 시작 번호
		int cnt = numPerPage;
				
		//검색에 필요한 변수
		String keyField = "" , keyWord = "";
				
		//검색일때 
		if(request.getParameter("keyWord")!=null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
				
		//검색 후에 다시 처음화면으로 요청
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
		keyField = "";  keyWord = "";
	}
		totalRecord = smgr.getTotalCount(keyField, keyWord);

		//nowPage를 요청한 경우
		if(request.getParameter("nowPage")!=null){
					nowPage = UtilMgr.parseInt(request, "nowPage");
	}
		//테이블 시작 번호
		start = (nowPage*numPerPage)-numPerPage;
				
		//전체페이지수 (전체레코드개수/페이지당 레코드 개수) 올림.
		 totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭수 (전체페이지수/블럭당 페이지 개수) 올림.
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭 (현재페이지수/블럭당 페이지 개수) 올림.
		 nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
		
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
 
 <form name="readFrm">
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
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
