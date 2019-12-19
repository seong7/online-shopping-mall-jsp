<!-- member list -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- <title>-관리자-제품 등록</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

<jsp:include page="./admin_side.jsp"/>
<!--------------->
<!--  작업 영역  -->
<!--------------->
    <div id="manager">  
    
        <h1 class="title">회원 정보</h1>

        <form method="post" action="goods_insertProc.jsp?flag=insert"
            enctype="multipart/form-data">
            <!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
        대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->
    
            <h3 class="inner_title">회원정보 검색</h3>


                        <table class="mgr_table verHead" id="search_table">
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select id="select_type">
                                        <option>ID</option>
                                        <option>이름</option>
                                        <option>Email</option>
                                    </select>
                                </td>
                                <td>
                                    <input placeholder="내용을 입력해주세요" id="select_value">
                                </td>
                                <td>
                                    <input class="btn" type="button" value="검색" id="member_search_btn">
                                </td>
                            </tr>
                        </table>
    
            <h3 class="inner_title">회원 정보 List</h3>
                        <table class="mgr_table verHead" id="result_table">
                            <tr>
                                <th>ID</th>
                                <th>이름</th>
                                <th>생년월일</th>
                                <th>회원가입일</th>
                                <th>이메일</th>
                                <th>연락처</th>
                                <th>주소</th>
                            </tr>
                        </table>
        </form>
    
    </div>	
    
    
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<jsp:include page="../bottom.jsp"/>
<script src="js/member_list.js"></script>
</body>
</html>