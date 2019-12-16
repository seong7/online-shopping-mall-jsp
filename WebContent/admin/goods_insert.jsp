<!-- goods_insert.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<title>-관리자-제품 등록</title>

<script src="script.js"></script>
</head>
<body topmargin="100">
	<form method="post" action="productProc.jsp?flag=insert"
		enctype="multipart/form-data">
		<!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
	대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->

		<h3>기본정보</h3>
		<table width="75%">
			<tr>
				<td>
					<table width="95%" border="1">

						<tr>
							<td align="center">제품코드</td>
							<td align="left"><input name="p_code" size="20"></td>
						</tr>
						<tr>
							<td align="center">제품명</td>
							<td align="left"><input name="p_name" size="20"></td>
						</tr>
						<tr>
							<td align="center">제품가격</td>
							<td align="left"><input name="p_price" size="20">원</td>
						</tr>
						<tr>
							<td align="center">판매여부</td>
							<td align="left"><input type="checkbox" name="sale_on">판매
								<input type="checkbox" name="sale_off">숨기기</td>
						</tr>
						<tr>
							<td align="center">등록일</td>
							<td align="left"><input name="p_date" size="20"></td>
						</tr>
						<tr>
							<td align="center">유통기한</td>
							<td align="left"><input name="st_exp_date" size="20"></td>
						</tr>
						<tr>
							<td align="center">원재료(1)</td>
							<td align="left"><input name="rm_code1" size="20"></td>
						</tr>
						<tr>
							<td align="center">원재료(2)</td>
							<td align="left"><input name="rm_code2" size="20"></td>
						</tr>
						<tr>
							<td align="center">원재료(3)</td>
							<td align="left"><input name="rm_code3" size="20"></td>
						</tr>
						<tr>
							<td align="center">원재료(4)</td>
							<td align="left"><input name="rm_code4" size="20"></td>
						</tr>
					</table>

					<h3 align="left">상세정보</h3>
					<table width="75%" align="left" width="95%" border="1">
						<tr>
							<td align="center">메인이미지</td>
							<td><input type="file" name="main_image"></td>
						</tr>
						<tr>
							<td align="center">설명이미지</td>
							<td><input type="file" name="sale_image"></td>
						</tr>
						<tr>
							<td align="center">상세이미지</td>
							<td><input type="file" name="info_image"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="submit" value="상품등록">&nbsp;&nbsp;&nbsp; <input
			type="reset" value="다시쓰기">
	</form>
</body>
</html>