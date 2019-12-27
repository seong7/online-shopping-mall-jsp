<!-- member view -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- <title>-관리자-제품 등록</title> -->

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 
<!--------------->
<!--  작업 영역  -->
<!--------------->
<link rel="stylesheet" type="text/css" href="./css/member_view.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/ju/dt-1.10.20/datatables.min.css"/>
<!-- 
<script type="text/javascript" src="https://cdn.datatables.net/v/ju/dt-1.10.20/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>
 <link rel="stylesheet" type="text/css" href="./css/datatable.css"> -->



	
	<div id="daumWrap2"></div>
	
	
	  <div id="manager">   
	  
       <h1 class="title">회원 정보</h1>
       
       <div class="form_wrapper">
       
			<table class="verHead memInfo_table" id="search_table">
				<tr >
					<th>아이디</th>
					<td><input class="disabled" id="member_id" value=<%=request.getParameter("id")%> readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input class="disabled" id="member_name" readonly></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input class="member_inputs disabled" id="member_birthday"  readonly></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input class="member_inputs disabled" id="member_joindate" readonly></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input class="member_inputs disabled" id="member_contact" readonly></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="member_inputs disabled" id="member_email" readonly></td>
				</tr>
				<tr>
					<th>보유포인트</th>
					<td><input class="disabled" id="member_point" readonly></td>
				</tr>
				<tr>
					<th rowspan="4">주소</th>
					<td>
						<input class="btn" id="addr_btn" name="zip_btn" type="button" value="주소 찾기" onclick="openDaumZipAddress();"/>
					</td>
				</tr>
				<tr>
					<td><input class="disabled input_zipcode" id="member_zipcode" readonly></td>
				</tr>
				<tr>
					<td>
						<input class="disabled input_zipcode" id="member_address" readonly>
					</td>
				</tr>	
				<tr>		
					<td>
						<input class="member_inputs disabled input_zipcode" id="member_address_detail" readonly>
					</td>
				</tr>
			</table>
       
       
       </div>
		<div id="view_btn_wrapper" class="submit_wrapper">
			<input class="btn" id="update" type="button" value="수정하기"> 
			<input class="btn" id="search_order" type="button" onclick="location.href='order_list.jsp?keyField=o_id&keyWord=<%=request.getParameter("id")%>&nowPage=1'" value="주문정보">
			<input class="btn" id="delete" type="button" value="회원 정보 삭제">
		</div>
		<!--
	<h3 class="inner_title">구매내역</h3>
		<table class="table table-striped table-bordered" id="order_table">
			<thead>
			<tr id="judgeRow">
				<th>번호</th>
				<th>주문일시</th>
				<th>주문번호</th>
				<th>제품명</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>반품여부</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		  -->
		  </div>
		<script src="js/member_view.js"></script>
		
		
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->

	<%@ include file="../bottom.jsp" %>
	
	
</body>
</html>