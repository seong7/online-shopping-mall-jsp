<!-- member_list.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<html>
	<head>
		<body>
			<jsp:include page="../top.jsp"/>
			<jsp:include page="./admin_side.jsp">
			<!-- 작업 영역 -->
			
			
					</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
				</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
			<jsp:include page="../bottom.jsp"/>
		</body>
	</head>
</html>