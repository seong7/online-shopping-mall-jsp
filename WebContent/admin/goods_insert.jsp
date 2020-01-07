
<!-- goods_insert.jsp -->
<%@page import="admin.ProductMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<!-- <title>-관리자-제품 등록</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 

<!--------------->
<!--  작업 영역  -->
<!--------------->
	
        <div id="manager">  
        
            <h1 class="title">제품 등록</h1>

			<form method="post" action="goods_Proc.jsp?flag=insert"
				enctype="multipart/form-data" id="goods_form">
				<!-- enctype="multipart/form-data" 일때에는 post방식으로 보낸다. 
			대신에 action을 통해서 action="productProc.jsp?flag=insert" 를 해줘야한다.-->


                <h3 class="inner_title">기본정보</h3>


                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>제품코드</th>
                                    <td><input name="p_code" placeholder="자동생성됩니다." readonly></td>
                                
                                    <th>제품명</th>
                                    <td><input name="p_name" id="p_name"></td>
                                </tr>
                                <tr>
                                    <th>제품가격</th>
                                    <td><input name="p_price">원</td>
                                
                                    <th>판매여부</th>
                                    <td>
                                        <input class="radio" type="radio" name="p_on_sale" value="1">판매
                                        <input class="radio" type="radio" name="p_on_sale" value="0" checked>숨기기
                                    </td>
                                </tr>						
                                <tr>
                                    <th>원재료(1)</th>
                                    <td>
                                        <select name="rm_code1" id="rm_code1" >
                                            <option value="0"  selected>원재료명</option>
                                            <%
                                        	System.out.println("번째 동작");
                                            ProductMgr p_mgr = new ProductMgr();
                                            Vector<ProductBean> rm_vlist = p_mgr.getMertaterialListAll();
                                            for(int i=0; i<rm_vlist.size();i++) {
                                            	ProductBean bean = rm_vlist.get(i);
                                            %>
                                            <option value="<%=bean.getRm_code()%>"><%=bean.getRm_name() %></option>
                                            <%}%>
                                        </select>
                                        <input class="rm_pct" id="rm_percentage1"  name="rm_percentage1" placeholder="함유율">%
                                    </td>
                                    
                                    <th>원재료(2)</th>
                                    <td>
                                        <select name="rm_code2" id="rm_code2" >
                                                <option value="" disabled selected>원재료명</option>
                                                <%for(int i=0; i<rm_vlist.size();i++) {
                                                	ProductBean bean = rm_vlist.get(i);
                                                %>
                                                <option value="<%=bean.getRm_code()%>"><%=bean.getRm_name() %></option>
                                                <%}%>
                                        </select>
                                        <input class="rm_pct" id="rm_percentage2"   name="rm_percentage2" placeholder="함유율">%
                                    </td>
                                </tr>
                                <tr>
                                    <th>원재료(3)</th>
                                    <td>
                                        <select name="rm_code3" id="rm_code3" >
                                                <option value=""  selected>원재료명</option>
                                                 <%for(int i=0; i<rm_vlist.size();i++) {
                                                	ProductBean bean = rm_vlist.get(i);
                                                %>
                                                <option value="<%=bean.getRm_code()%>"><%=bean.getRm_name() %></option>
                                                <%}%>
                                        </select>
                                        <input class="rm_pct"  id="rm_percentage3"  name="rm_percentage3" placeholder="함유율">%
                                    </td>
                                
                                    <th>원재료(4)</th>
                                    <td>
                                        <select name="rm_code4" id="rm_code4" >
                                                <option value=""  selected>원재료명</option>
                                                 <%for(int i=0; i<rm_vlist.size();i++) {
                                                	ProductBean bean = rm_vlist.get(i);
                                                %>
                                                <option value="<%=bean.getRm_code()%>"><%=bean.getRm_name() %></option>
                                                <%}%>
                                        </select>
                                        <input class="rm_pct" id="rm_percentage4" name="rm_percentage4" placeholder="함유율">%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">사진정보</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>메인이미지</th>
                                    <td><input type="file" name="upFile1"></td>
                                </tr>
                                <tr>
                                    <th>상세이미지</th>
                                    <td><input type="file" name="upFile2"></td>
                                </tr>
                                <tr>
                                    <th>정보이미지</th>
                                    <td><input type="file" name="upFile3"></td>
                                </tr>
                            </table>

            <div class="submit_wrapper">
                <input class="btn" type="button" onclick="submitCheck()" value="상품등록">
                <input class="btn" type="reset" value="다시쓰기">
            </div>
            </form>
        
        </div>	
	<script>
	function submitCheck(){
		const rm_percentage1 = document.getElementById('rm_percentage1').value;
		const rm_percentage2 = document.getElementById('rm_percentage2').value;
		const rm_percentage3 = document.getElementById('rm_percentage3').value;
		const rm_percentage4 = document.getElementById('rm_percentage4').value;
		const rm_code1 = document.getElementById('rm_code1').value;
		const rm_code2 = document.getElementById('rm_code2').value;
		const rm_code3 = document.getElementById('rm_code3').value;
		const rm_code4 = document.getElementById('rm_code4').value;
		const p_name = document.getElementById('p_name').value;
		const goods_form = document.getElementById('goods_form');
		
		goods_form.action='goods_Proc.jsp?flag=insert&rm_percentage1='+rm_percentage1+
				'&rm_percentage2='+rm_percentage2 + '&rm_percentage3='+rm_percentage3 +
				'&rm_percentage4='+rm_percentage4 + '&rm_code1='+rm_code1 + 
				'&rm_code2='+rm_code2 + '&rm_code3='+rm_code3 + 
				'&rm_code4='+rm_code4 + '&p_name='+p_name;
		goods_form.submit();
				
	}
	</script>
	
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>

</body>
</html>