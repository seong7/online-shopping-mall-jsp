<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<jsp:include page="top.jsp"/>
	
<main>
            <div id="bannerWrapper">
                <img src="./img/index/banner/banner_sample1.png" alt="banner slider">
                <div id="banner_btn_wrapper">
                    <span>
                        
                    </span>
                </div>
            </div>
            <div class="goodslist" id="goodslist_best">
                <a href="#" class="goodslist_btn">
                    베스트상품
                </a>
                <div>
                    <ul id="goodslist_best_ul">
                        <li>a</li>
                        <li>b</li>
                        <li>c</li>
                        <li>d</li>
                        <li>e</li>
                    </ul>
                </div>
            </div>
            <div class="goodslist" id="goodslist_new">
                <a href="#" class="goodslist_btn">
                    신상품
                </a>
                <div>
                    <ul id="goodslist_best_ul">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
        </main>
	
</body>
</html>
	