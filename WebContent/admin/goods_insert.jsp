<!-- goods_insert.jsp -->
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<!-- <title>-관리자-제품 등록</title>  -->
<script src="script.js"></script>
</head>
<body topmargin="100">
	<form method="post" action="goods_Proc.jsp?flag=insert"
		enctype="multipart/form-data">
		<!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
	대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->


<!-- <title>-관리자-제품 등록</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

	<jsp:include page="./admin_side.jsp"/>


<!--------------->
<!--  작업 영역  -->
<!--------------->
	
        <div id="manager">  
        
            <h1 class="title">제품 등록</h1>

            <form method="post" action="goods_insertProc.jsp?flag=insert"
                enctype="multipart/form-data">
                <!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
            대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->
        
                <h3 class="inner_title">기본정보</h3>


                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>제품코드</td>
                                    <td><input name="p_code" placeholder="자동생성됩니다." readonly></td>
                                
                                    <th>제품명</td>
                                    <td><input name="p_name"></td>
                                </tr>
                                <tr>
                                    <th>제품가격</td>
                                    <td><input name="p_price">원</td>
                                
                                    <th>판매여부</td>
                                    <td>
                                        <input class="radio" type="radio" name="p_on_sale" value="1">판매
                                        <input class="radio" type="radio" name="p_on_sale" value="0" checked>숨기기
                                    </td>
                                </tr>						
                                <tr>
                                    <th>원재료(1)</td>
                                    <td>
                                        <select name="rm_code1">
                                            <option value="" disabled selected>원재료명</option>
                                            <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage1" placeholder="함유율">%
                                    
                                    </td>
                                    
                                    <th>원재료(2)</td>
                                    <td>
                                        <select name="rm_code2">
                                                <option value="" disabled selected>원재료명</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage2" placeholder="함유율">%
                                    </td>
                                </tr>
                                <tr>
                                    <th>원재료(3)</td>
                                    <td>
                                        <select name="rm_code3">
                                                <option value="" disabled selected>원재료명</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage3" placeholder="함유율">%
                                    </td>
                                
                                    <th>원재료(4)</td>
                                    <td>
                                        <select name="rm_code4">
                                                <option value="" disabled selected>원재료명</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage4" placeholder="함유율">%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">사진정보</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>메인이미지</td>
                                    <td><input type="file" name="upFile1"></td>
                                </tr>
                                <tr>
                                    <th>설명이미지</td>
                                    <td><input type="file" name="upFile2"></td>
                                </tr>
                                <tr>
                                    <th>상세이미지</td>
                                    <td><input type="file" name="upFile3"></td>
                                </tr>
                            </table>

            <div class="submit_wrapper">
                <input class="btn" type="submit" value="상품등록">
                <input class="btn" type="reset" value="다시쓰기">
            </div>
            </form>
        
        </div>	
	
	
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<jsp:include page="../bottom.jsp"/>

</body>
</html>