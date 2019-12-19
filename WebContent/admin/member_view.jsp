<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>회원관리</h2>
	<hr>
	<h3>회원정보</h3>
		<table border="1">
		<tr >
			<th>이름</th>
			<td><input id="NAME" readonly></td>
			<th>아이디</th>
			<td><input id="id" readonly></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input id="birthday" readonly></td>
			<th>가입일</th>
			<td><input id="join_date" readonly></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input id="contact" readonly></td>
			<th>이메일</th>
			<td><input id="email" readonly></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input id="address" readonly><input name="zip_btn" type="button" value="주소 찾기" /></td>
			<th>보유포인트</th>
			<td><input id="point" readonly></td>
		</tr>
		</table>
		<input id="update" type="button" value="수정">
		<input id="delete" type="button" value="삭제">
		
				<br><br>
	<h3>구매내역</h3>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>주문자ID</th>
				<th>주문일시</th>
				<th>주문번호</th>
				<th>제품명</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>반품여부</th>
			</tr>
			<tr>
				<td>aaa</td>
				<td>sssgi</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
</body>
</html>