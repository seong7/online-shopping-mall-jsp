<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bottom.css">
<footer>
	<div id="footer_wrapper">
	    <ul>
	        <li id="footer_first">
	            <span id="title">고객센터</span>
	            <span id="middle">1600-1234</span>
	            <button onclick="location.href='#'" id="bottom">1:1문의</button>
	        </li>
	        <li id="footer_second">
	            <div class="second" id="phone">
	                365고객콜센터
	                <span>오전 8시 - 오후 6시</span>
	            </div>
	            <div class="second" id="qnaboard">
	                24시간 QnA 게시판
	                <span>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</span>
	            </div>
	        </li>
	        <li id="footer_third">
	            <div id="business_info">
	                <span>법인명 (상호) : 밀스의 방앗간</span>
	                <span>사업자등록번호 : 111-11-11111</span>
	                <span>주소 : 부산광역시 부산진구 중앙대로 708 부산파이낸스센터 4F, 5F</span>
	                <span>팩스 : 070-111-1111 | 이메일 : xxx@xxxxx.com</span>
	                <a href="#"><img src="${pageContext.request.contextPath}/img/index/footer/ico_fb.webp"></a>
	                <a href="#"><img src="${pageContext.request.contextPath}/img/index/footer/ico_instagram.webp"></a>
	                <a href="#"><img src="${pageContext.request.contextPath}/img/index/footer/ico_blog.webp"></a>
	                <a href="#"><img src="${pageContext.request.contextPath}/img/index/footer/ico_youtube.webp"></a>
	            </div>
	        </li>
	    </ul>
	</div>
</footer>