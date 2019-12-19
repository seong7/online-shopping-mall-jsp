<!-- goods_view.jsp -->
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Product.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	ProductBean bean = mgr.getProduct(p_code);
%>
<html>
<head>
<!-- <title>-관리자-제품 등록</title>  -->
<script src="script.js"></script>
</head>
<body topmargin="100">	

<!-- <title>-관리자-제품 등록</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

	<jsp:include page="./admin_side.jsp"/>

<!--------------->
<!--  작업 영역  -->
<!--------------->
	
        <div id="manager">  
        
            <h1 class="title">제품 수정</h1>

            <form name="frm" method="get" action="goods_Proc.jsp"
                enctype="multipart/form-data">
                <!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
            대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->        
        
        		<!--  input hidden 으로 flag 값 넘기면 flag=update 전달 가능 -->
        		<input type="hidden" value="update" name="flag">
        
        
        
                <h3 class="inner_title">기본정보</h3>
                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>제품코드</th>
                                    <td><input name="p_code" value="<%=bean.getP_code()%>" readonly>                                                            	
                                    <th>제품명</th>
                                    <td><input name="p_name" value="<%=bean.getP_name()%>"></td>
                                </tr>
                                <tr>
                                    <th>제품가격</th>
                                    <td><input name="p_price" value="<%=bean.getP_price()%>">원</td>
                                
                                    <th>판매여부</th>
                                    <td>
                                    	<%if(bean.getP_on_sale()==1){%>
                                    	<input class="radio" type="radio" name="p_on_sale" value="1"checked>판매
                                        <input class="radio" type="radio" name="p_on_sale" value="0" >숨기기
                                        <%}else{%>
                                        <input class="radio" type="radio" name="p_on_sale" value="1">판매
                                        <input class="radio" type="radio" name="p_on_sale" value="0" checked>숨기기
                                        <%} %>
                                    </td>
                                </tr>						
                                <tr>
                                    <th>원재료(1)</th>
                                    <td>
                                        <select name="rm_code1">
                                            <option value="" disabled selected>원재료명</option>
                                            <option value=""></option>
                                        </select>
                                        <input class="" name="rm_percentage1" placeholder="함유율">%
                                    
                                    </td>
                                    
                                    <th>원재료(2)</th>
                                    <td>
                                        <select name="rm_code2">
                                                <option value="" disabled selected>원재료명</option>
                                                <option value=""></option>
                                        </select>
                                        <input name="rm_percentage2" placeholder="함유율">%
                                    </td>
                                </tr>
                                <tr>
                                    <th>원재료(3)</th>
                                    <td>
                                        <select name="rm_code3">
                                                <option value="" disabled selected>원재료명</option>
                                                <option value=""></option>
                                        </select>
                                        <input name="rm_percentage3" placeholder="함유율">%
                                    </td>                                
                                    <th>원재료(4)</th>
                                    <td>
                                        <select name="rm_code4">
                                                <option value="" disabled selected>원재료명</option>
                                                <option value=""></option>
                                        </select>
                                        <input name="rm_percentage4" placeholder="함유율">%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">사진정보</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>메인이미지</th>
                                    <td><%=bean.getP_main_pht_name()%>
                                    <input type="file" name="upFile1" ></td>
                                </tr>
                                <tr>
                                    <th>설명이미지</th>                                                                    
                                    <td> <%=bean.getP_detail_pht_name()%>
                                    <input type="file" name="upFile2"></td>
                                </tr>
                                <tr>
                                    <th>상세이미지</th>
                                    <td> <%=bean.getP_info_pht_name()%>
                                    <input type="file" name="upFile3"></td>
                                </tr>
                            </table>
                            

            <div class="submit_wrapper">
                <input class="btn" type="submit" value="작성완료">
                <input class="btn" type="submit" value="수정완료">
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