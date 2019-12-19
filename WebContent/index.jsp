<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>

<link rel="stylesheet" type="text/css" href="css/index.css">

<jsp:include page="top.jsp"/>

        <!--******************-->
        <!--작업 및 복붙 구역-->
        <!--******************-->        	
         <main>
            <!-- 배너 구역-->
            <div id="bannerWrapper">
                <img src="./img/index/banner/banner_sample1.png" alt="banner slider">
                <div id="banner_btn_wrapper">
                    <span>
                        
                    </span>
                </div>
            </div>

            <!-- 베스트상품 구역-->
                <div class="goodslist" id="goodslist_best">
                <div class="goodslist_tit">
                    <a href="#" class="goodslist_btn">
                        <h3>베스트상품</h3>
                    </a>
                    <span class="goodslist_detail">밀스의 방앗간 BEST 상품들을 만나보세요.</span> 
                </div>
                <ul id="goodslist_best_ul">
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/basil_main.jpg"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- 신상품 구역 -->
            <div class="goodslist" id="goodslist_new">
                <div class="goodslist_tit">
                    <a href="#" class="goodslist_btn">
                        <h3>신상품</h3>
                    </a>
                    <span class="goodslist_detail">밀스의 방앗간 새로운 상품들을 만나보세요.</span> 
                </div>
                <ul id="goodslist_new_ul">
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/index/product_sample/prod_sample1.PNG"/>
                        </a>
                        <div class="goods_info">
                            <a href="#">
                                <span class="name">
                                    [CREAPAN] 아메리칸 스타일 팬케이트 240g
                                </span>
                            </a>
                            <span class="price">
                                4,900원
                            </span>
                        </div>
                    </li>
                </ul>
            </div>
        </main>
		<!--******************-->
        <!--작업 및 복붙 구역-->
        <!--******************-->        
		<jsp:include page="bottom.jsp"/>
</body>
</html>
	