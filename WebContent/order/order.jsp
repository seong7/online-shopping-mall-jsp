<!-- 사용자 주문서 page: cart.jsp에서 수량가져옴. -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>

<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<jsp:useBean id="oMgr" class="order.OrderMgr" />
<jsp:useBean id="cMgr" class="order.CartMgr" />

<%

		request.setCharacterEncoding("EUC-KR");
		String cpath = request.getContextPath();
		
		int p_code = 0;
		int o_qty = 0;
		int unitPrice = 0;
		int totalPrice =0;
		int sum = 0;
		int countPart = 0; 
		String name;
		String contact;
		int zipcode;
		String add;
		String addDetail;

		String o_id = (String)session.getAttribute("idKey");
		String flag = request.getParameter("flag");
		
		Vector goods = new Vector();
		
		// flag (카트인지 제품 하나 구매인지 구분 )  에 따라 Vector goods 에 정보 넣어줌
		if(flag.equals("oneProduct")){
			System.out.print(flag);
			p_code = Integer.parseInt(request.getParameter("p_code"));
			ProductBean pbean = pMgr.getProduct(p_code);
			goods.add(pbean);
			
		}else if(flag.equals("cart")){

			String[] checked_Pcode = request.getParameterValues("fch");

			for(int i=1; i<checked_Pcode.length; i++){
				goods.add(cMgr.getCartOneOrder(o_id, Integer.parseInt(checked_Pcode[i])));

			}
			//여기에서 플래그값 판단해서 시작
			//플래그는 getparameter
			//선택제품에대한 정보 넘겨줘야함
			//카트 피코드 삭제도 해야함
			//request 데이터 넣어줄것: pcode 배열과 user id 
			//goods = cvlist;
		}
		

		/// sample용
		String o_status = "결제완료";
		int shippingPrice = 2500;
		double pointRate = 0.05;  /* 5% 적립으로 가정 */

%>

<!-- 
<!DOCTYPE html>
<html>
<title>주문서</title>
<head>
</head>
<body>
 -->


<link rel="stylesheet" type="text/css" href="css/order.css"/>

<%@ include file="../top.jsp"%>


<main>
    <div id="main_wrapper">
        <div class="title_wrapper">
            <h1 class="title">주문서</h1>
            <span class="description">주문하실 상품명 및 수량을 정확하게 확인해주세요.</span>
        </div>

 <form name="orderFrm" method="post" action="./orderProc.jsp">
        <section id="order_product">
            <h3 class="order_subtitle">상품정보</h3>
            <table class="horHead" id="order_table">
                <tr>
                    <th colspan="2">상품정보</th>
                    <th>상품수량</th>
                    <th>상품금액</th>
                </tr>
                <%
                
                ProductBean pbean =null;
                CartBean cbean = null;
                
                for(int i=0; i<goods.size(); i++){			
                    
                    /* 물건 하나 구매할 때*/
                    if(flag.equals("oneProduct")){
                     	pbean = (ProductBean)goods.get(i);	
                        o_qty = Integer.parseInt(request.getParameter("quantity"));
                        
                        /* 장바구니 구매할 때 */
                    }else if(flag.equals("cart")){
                        cbean = (CartBean)goods.get(i);
                        o_qty = cbean.getC_qty();
                        pbean = pMgr.getProduct(cbean.getP_code());
                    }
                    unitPrice = pbean.getP_price();
                    totalPrice = unitPrice * o_qty;
                    sum += totalPrice;
                    countPart = goods.size();
                    %>
                    <tr>
                        <td>
                        	<img alt="제품사진" src="${pageContext.request.contextPath}/img/product/<%=pbean.getP_main_pht_name()%>">
                        </td>
                        <td class="btn_td">
                           	<a href="${pageContext.request.contextPath}/product/goods_view.jsp?goods=<%=pbean.getP_code()%>">
                           		<%=pbean.getP_name() %>
                           	</a>
                       	</td>
                        <td>
                        	<%=o_qty %>개
                       	</td>
                        <td>
                        	<input type="hidden" value="<%=pbean.getP_code()%>" name="p_code">
              		  		<input type="hidden" value="<%=o_qty%>" name="o_qty">
                        </td>

                  		<td>
                       		<%=UtilMgr.intFormat(totalPrice) %>원
   	                    	<input type="hidden" name="p_price" value="<%=totalPrice %>">
                        </td>

                    </tr>
                    <%
                            }
                        %>
            </table>
        </section>



        <section id="order_member">
            <h3 class="order_subtitle">주문자 정보</h3>
            <table class="verHead">

                <tr>
                <%
                    MemberBean mbean = mMgr.getMember(o_id);
                    
                    String mName = mbean.getNAME();
                    String mContact = mbean.getContact();
                    String mEmail = mbean.getEmail();
                    int mZipcode = mbean.getZipcode();
                    String mAdd = mbean.getAddress();
                    String mAddDetail = mbean.getAddress_detail();
                %>
                
                        <th>보내는 분</th>
                        <td><%=mName %></td>
                    </tr>
                    <tr>
                        <th>휴대폰 </th>
                        <td><%=mContact%></td>
                    </tr>
                    <tr>
                        <th>이메일 </th>
                        <td><%=mEmail%></td>
                    </tr>
                </table>

            </section>

                <section id="order_delivery">
                    <h3 class="order_subtitle">배송정보</h3>
                    <table class="verHead">
                            <%
                                Vector<OrderBean> olist = oMgr.getOrder(o_id);
                            if(olist.isEmpty()){//회원정보 
                            	name = mName;
                        		contact =mContact;
                        		zipcode = mZipcode;
                        		add = mAdd;
                        		addDetail =mAddDetail;
                            }else{
                            	OrderBean order = olist.get(0); //최근 주문 정보
                            	name = order.getO_recpt_name();
                        		contact =order.getO_recpt_contact();
                        		zipcode = Integer.parseInt(order.getO_recpt_zipcode());
                        		add = order.getO_recpt_add();
                        		addDetail =order.getO_recpt_add_det();
                            }
                            %>
                        <tr>
                            <th>배송주소</th>
                            <td>
                            <input type="text" id="o_recpt_zipcode"  name="o_recpt_zipcode" readonly	value="<%=zipcode%>">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="o_recpt_add" name="o_recpt_add" readonly value="<%=add%>"><br>
							<input type="text" id="o_recpt_add_det" name="o_recpt_add_det" value="<%=addDetail%>">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수
							
							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }
							
							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("sample6_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample6_extraAddress").value = '';
							                }
							
							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('o_recpt_zipcode').value = data.zonecode;
							                document.getElementById("o_recpt_add").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("o_recpt_add_det").focus();
							            }
							        }).open();
							    }
							</script>
                            </td>
                        </tr>
                        <tr>
                            <th>수령인 이름</th>
                            <td><input name="o_recpt_name" 
                            value="<%=name%>"></td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td><input name="o_recpt_contact"  value="<%=contact%>"></td>
                        </tr>
                        
                        <tr>
                            <th>배송요청사항</th>
                            <td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
                        </tr>
                    </table>
                </section>

				<div id="point_price_wrapper">
	                <section id="order_point">
	                    <h3 class="order_subtitle">적립금</h3>
	                    <table class="verHead"> 
	                        <tr>
	                            <th>적립급 적용</th>
	                            <td><input placeholder="사용가능한 적립금 : 5000">원</td>
	                        </tr>
	                    </table>
	                </section>
	
	                <section id="order_pay">
	                    <h3 class="order_subtitle">결제금액</h3>
	                    <table class="verHead">
	                        <tr>
	                            <th>상품금액</th>
	                            <td>
	                            	<span id="o_prod_amount"><%=UtilMgr.intFormat(sum)%></span>원
	                            	<input type="hidden" name="o_prod_amount" value="<%=sum%>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>배송비</th>
	                            <td>
	                            	<span id="o_del_fee"><%=UtilMgr.intFormat(shippingPrice)%></span>원
	                            	<input type="hidden" name="o_del_fee" value="<%=shippingPrice%>">
	                            </td>
	                            
	                        </tr>
	                        <tr>
	                            <th id="total_price_th">최종결제금액</th>
	                            <td id="total_price_td">
  	                                <span id="o_total_amount"><%=UtilMgr.intFormat(sum+shippingPrice)%></span>원
  	                                <input type="hidden" name="o_total_amount" value="<%=sum+shippingPrice%>">
	                                <span id="total_point">구매 시 <%=UtilMgr.intFormat((int)(sum*pointRate))%>P 적립</span>

	                            </td>
	                        </tr>
	                        <!-- <tr>
	                            <td></td>
	                        </tr> -->
	                    </table>
	                </section>
				</div>

                <section id="order_howpay">
                    <h3 class="order_subtitle">결제수단</h3>
                    <table class="verHead">
                        <tr>
                            <th>일반결제 &nbsp;&nbsp;&nbsp;</th>
                            <td> 신용카드
	                            <input type="radio" class="radio" name="o_pay_method" value="신용카드" onclick='paymentMethod(this.value);' checked>
	                            &nbsp;&nbsp;&nbsp; 휴대폰
	                            <input type="radio" class="radio" name="o_pay_method" value="휴대폰" onclick='paymentMethod(this.value);'>
                            </td>
                        </tr>
                        <tr id='tr1'>
                        	<td></td>
                            <td>
                                <select id="card">
                                    <option value="0">카드를 선택해주세요.</option>
                                    <option value="1">현대(무이자)</option>
                                    <option value="2">신한</option>
                                    <option value="3">비씨</option>
                                    <option value="4">NH</option>
                                    <option value="5">삼성</option>
                                </select>
                                <select id="installment">
                                    <option value="0">일시불</option>
                                    <option value="1">2개월 할부</option>
                                    <option value="2">3개월 할부</option>
                                    <option value="3">4개월 할부</option>
                                    <option value="4">5개월 할부</option>
                                    <option value="5">6개월 할부</option>
                                </select>
                            </td>
                        </tr>
                        <tr id='tr2' style="display:none">
                            <td></td>
                            <td><input name="cellphone1" size="13" placeholder="010-1234-1234"><td>
                        </tr>
                        <tr>
                            <th>간편결제 &nbsp;&nbsp;&nbsp;</th>
                            <td>네이버 페이<input type="radio" class="radio" name="o_pay_method" value="네이버페이" onclick='paymentMethod(this.value);'></td>
                        </tr>
                    </table>
                </section>

                <section id="order_private">
                    <h3 class="order_subtitle">개인정보 수집/제공*</h3>
                    <table class="verHead">

                        <tr>
                            <th>
                            	<span>결제진행 필수동의</span>
                            	<input class="checkbox" id="agreement" type="checkbox" value=1>
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th>개인정보 수집/이용동의(필수)</th>
                            <th><a href="#">약관확인 ></a></th>
                        </tr>
                        <tr>
                            <th>결제대행 서비스 약관 동의(필수)</th>
                            <th><a href="#">약관확인 ></a></th>
                        </tr>
                    </table>
                    <input type="hidden" name="o_id" id="order_id" value="<%=o_id%>">
                    <input type="hidden" name="o_status" value="<%=o_status%>">
                    <input type="hidden" name="countPart" value="<%=countPart%>">
                    <input type="hidden" name="mName" value="<%=mName%>">
                
                    <div class="order_btn_wrapper">
                        <input type="button" class="btn order_submit" 
                        value="결제하기" onclick="location.href='javascript:agreement()'">
                        <script>
                        function agreement(){//약관 미 동의시 진행안됨. 
                    		var chk = document.getElementById("agreement");
                    		if(chk.checked){
                    			document.orderFrm.submit();
                    			}else{ 
                    			alert("약관에 동의해주세요.");
                    			return;
                    		}
                    	}
                        </script>
                    </div>
                </section>
            </form>
            


	</div>
</main>


</div>
<!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
</div>
<!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
<%@ include file="../bottom.jsp"%>

<script type="text/javascript" src="js/order.js"></script>


</body>
</html>













