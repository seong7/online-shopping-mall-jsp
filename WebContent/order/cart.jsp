<!-- goods_view.jsp에서 p_code, 수량 넘겨오기 -->
<%@page import="order.CartBean"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <jsp:useBean id="pMgr" class="product.ProductMgr"/>
 <jsp:useBean id="cMgr" class="order.CartMgr"/>
 <%
 		request.setCharacterEncoding("EUC-KR");
 		String id = (String)session.getAttribute("idKey");
 		//String id = "u1";//확인용 데이터
 		int p_code = 1;//확인용 데이터
 		int o_del_fee = 2500;
 			
 %>
<!DOCTYPE html>
<html>
<head>
<style>
input {
  width:30px;
  height:30px;
  font-size:15px;
  text-align: center;
}
</style>
<script>
	
	
	function allChk(){//전체 체크시 활성화
		f=document.frm;
		if(f.allCh.checked){
			for (var i = 0; i < f.fch.length; i++) {
				f.fch[i].checked = true;
			}
			f.btn1.disabled = false;//버튼의 활성화
			f.btn2.disabled = false;//버튼의 활성화
		}else{
			for (var i = 0; i < f.fch.length; i++) {
				f.fch[i].checked = false;
			}
			f.btn1.disabled = true;//버튼의 비활성화
			f.btn2.disabled = true;//버튼의 비활성화
		}
	}
	
	function chk(frm){
		f=document.frm; 
		let sum =0;
		for (let i = 1; i < f.fch.length; i++) {
			//alert(f.fch[i].value);
			if(f.fch[i].checked){
				f.btn1.disabled = false;//버튼의 활성화 
				f.btn2.disabled = false;//버튼의 활성화
				return;//밑에 있는 체크박스의 체크유무는 무의미함. 
			}else {
				
			}
		}
		
		f.allCh.checked = false;//개별 checkbox를 풀때 전체 checkbox도 해제 
		f.btn1.disabled = true;//버튼의 비활성화()
		f.btn2.disabled = true;//버튼의 비활성화()
		document.getElementById("sumtext").innerHTML = sum;
	}
	
  function qytChange(num){
	  var y = document.getElementById("c_qty");
	  if(y>1) {y.value=y+num;}
  }
  
  function confirmDel(){
		if(confirm("선택상품을 삭제하시겠습니까?")==true){
			document.frm.action = "cartDelProc.jsp";
			document.frm.submit();
		}else{ //취소
			return;
		}
	}
  function calc(cart){
	  f=document.frm; 
		for (var i = 1; i < f.fch.length; i++) {
			//alert(f.fch[i].value);
			if(f.fch[i].checked){
				sum += parseInt(cart.value);
			}else 
				  sum -= parseInt(cart.value);
		}
	  
	  document.getElementById("sumtext").innerHTML = sum;
  }
  
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2 class="layout-page-title">장바구니</h2>
			<p>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>
	<form name="frm" action="order.jsp">
		<input type="hidden" name="fch" value="0">
		<table border="1">
		<tr>
			<th><input type="checkbox" name="allCh" 
			onclick="allChk()"></th>
			<th>상품사진</th>
			<th>상품명</th>
			<th>수량</th>
			<th>상품금액</th>
		</tr>
		<%
			Vector<CartBean> clist = cMgr.getCart(id);
				for(int i= 0; i<clist.size();i++){	
					CartBean cart = clist.get(i);
					p_code = cart.getP_code();
					ProductBean product = pMgr.getProduct(p_code);
					String p_main_pht_name = product.getP_main_pht_name();
			 		String p_name = product.getP_name();
					int p_price = product.getP_price();
					int c_qty = cart.getC_qty();
					int totalPrice = p_price* c_qty;
		%>
		<tr>
			<td><input type="checkbox" name="fch" 
			value="<%=p_code%>"  onclick="chk()"></td>
			<td><img alt="제품사진" src="${pageContext.request.contextPath}
			/img/product/ready.gif"></td>
			<td><%=p_name %><br><%=p_price %>원</td>
		
			<td><input type="button" value="-" 
			onclick="qytChange(-1)">
			<input type="text" id="c_qty" value=<%=c_qty%>>
			<input type="button" value="+" 
			onclick="qytChange(1)"></td>
			<td><%=totalPrice%></td>
		</tr>
				<%} %>	
		</table>
		<br>
		<table border="1">
		<tr>
			<th>상품금액</th>
			<th>배송비</th>
			<th>결제예정금액</th>
		</tr>
		<tr>
			<td id="sumtext">0</td>
			<td><%=o_del_fee %></td>
			<td>결제금액</td>
			</tr>
		</table>
		<br>
		<input type="button" name="btn1" value="선택 삭제하기" 
		disabled style ="width:150px" 
		onclick="location.href='javascript:confirmDel()'">
		<input type="submit" name="btn2" value="선택 주문하기" 
		disabled	style ="width:150px">
		<input type="hidden" name="id" value="<%=id %>">
		</form>
	</div>
</body>
</html>