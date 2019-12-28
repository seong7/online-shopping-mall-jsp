<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>




<%@include  file="../top.jsp"%>

	<%@ include file="../order/mypage_side.jsp"%> 

	<div id="mypage">
	
		<h1 class="title">리뷰관리</h1>
		
		<input id="" class="btn" type="button" value="나의 리뷰 목록">
		<input id="" class="btn" type="button" value="작성 가능 리뷰">
		
		<table class="mypage_table horHead">
			<tr>
				<th>주문번호</th>
				<th colspan="2">제품정보</th>
				<th>구매일</th>
				<th>주문상태</th>
			</tr>
			<tr>
				<td>
					
				</td>
				<td>
					
				</td>
			</tr>
			
		</table>
		
		
	</div>

</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
	
</body>
</html>