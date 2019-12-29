<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="reMgr" class="product.ReviewMgr"/>
<jsp:useBean id="reBean" class="product.ReviewBean"/>
<jsp:setProperty property="*" name="reBean"/>
<%

	//int o_index = Integer.parseInt(request.getParameter("o_index"));
	//int p_code = Integer.parseInt(request.getParameter("p_code"));
	
	boolean flag = reMgr.insertReview(reBean);
	if(flag){
		response.sendRedirect("mypage_review.jsp");
	} else{
	%>
		<script>
			alert('에러가 발생하였습니다.');
		</script>
	<%
	}
%>
