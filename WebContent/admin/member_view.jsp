<!-- member view -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- <title>-관리자-제품 등록</title> -->

<jsp:include page="../top.jsp"/>

<jsp:include page="./admin_side.jsp"/>
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



	<main>
	<div id="daumWrap2"></div>
	  <div id="manager">   
       <h3 class="inner_title">회원 정보</h3>
		<table class="mgr_table verHead" id="search_table">
		<tr >
			<th>이름</th>
			<td><input class="disabled" id="member_name" readonly></td>
			<th>아이디</th>
			<td><input class="disabled" id="member_id" value=<%=request.getParameter("id")%> readonly></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input class="member_inputs disabled" id="member_birthday"  readonly></td>
			<th>가입일</th>
			<td><input class="member_inputs disabled" id="member_joindate" readonly></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input class="member_inputs disabled" id="member_contact" readonly></td>
			<th>이메일</th>
			<td><input class="member_inputs disabled" id="member_email" readonly></td>
		</tr>
		<tr>
			<th>보유포인트</th>
			<td><input class="disabled" id="member_point" readonly></td>
			<th>우편번호</th>
			<td><input class="disabled" id="member_zipcode" readonly></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3"><input class="disabled" id="member_address" readonly><input id="addr_btn" name="zip_btn" type="button" value="주소 찾기" disabled="disabled" onclick="openDaumZipAddress();"/></td>
		</tr>			
			<th>상세주소</th>
			<td colspan="3"><input class="member_inputs disabled" id="member_address_detail" readonly></td>
		</tr>
		</table>
		<div id="view_btn_wrapper">
			<input class="btn" id="update" type="button" value="수정"> 
			<input class="btn" id="delete" type="button" value="회원 정보 삭제">
			<input class="btn" id="search_order" type="button" value="주문정보">
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
		</main>
		<script src="js/member_view.js"></script>
</body>
</html>