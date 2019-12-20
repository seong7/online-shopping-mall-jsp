<!-- member view -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- <title>-관리자-제품 등록</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

<jsp:include page="./admin_side.jsp"/>
<!--------------->
<!--  작업 영역  -->
<!--------------->
<link rel="stylesheet" type="text/css" href="./css/member_view.css">
	<main>
	  <div id="manager">   
       <h3 class="inner_title">회원 정보</h3>
		<table class="mgr_table verHead" id="search_table">
		<tr >
			<th>이름</th>
			<td><input id="member_name" readonly></td>
			<th>아이디</th>
			<td><input id="member_id" value=<%=request.getParameter("id")%> readonly></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input id="member_birthday" readonly></td>
			<th>가입일</th>
			<td><input id="member_joindate" readonly></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input id="member_contact" readonly></td>
			<th>이메일</th>
			<td><input id="member_email" readonly></td>
		</tr>
		<tr>
			<th>보유포인트</th>
			<td><input id="member_point" readonly></td>
			<th>우편번호</th>
			<td><input id="member_zipcode" readonly></td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3"><input id="member_address" readonly><input id="addr_btn" name="zip_btn" type="button" value="주소 찾기" /></td>
		</tr>
		</table>
		<div id="view_btn_wrapper">
			<input class="btn" id="update" type="button" value="수정"> 
			<input class="btn" id="delete" type="button" value="회원 정보 삭제">
		</div>
	<h3 class="inner_title">구매내역</h3>
		<table class="mgr_table verHead" id="order_table">
			<tr id="judgeRow">
				<th>번호</th>
				<th>주문일시</th>
				<th>주문번호</th>
				<th>제품명</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>반품여부</th>
			</tr>
		</table>
		  </div>
		</main>
		<script src="js/member_view.js"></script>
</body>
</html>