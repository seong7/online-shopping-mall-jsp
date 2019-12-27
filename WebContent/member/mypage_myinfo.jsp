<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>

      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function openDaumZipAddress() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수
             
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('input_zipcode').value = data.zonecode;
                        document.getElementById('input_addr').value = roadAddr + " " + data.jibunAddress;
                        
                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("input_detail").value = extraRoadAddr;
                        } else {
                            document.getElementById("input_detail").value = '"';
                        }
        
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                        	alert('입력해주세요');
                        } 
                    }
                }).open();
            }

        </script>
        
        
        <script type="text/javascript" src="./js/myinfo.js"></script>
        
<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 

	<%
		request.setCharacterEncoding("EUC-KR");
		String access = (String)session.getAttribute("myinfo_access");
		MemberBean myInfoBean = null;	
	
		if(access==null || access.length()==0){
			if(id==null || id.length()==0){
				response.sendRedirect(cpath+"/index.jsp");
				return;   // return 꼭 넣어야함
			}else{
				response.sendRedirect(cpath+"/member/myinfo_check.jsp");
				return;
			}
		}else{
			session.removeAttribute("myinfo_access");
			myInfoBean = mgr.getMember(id);
		}
	%>

       <div id="mypage">

			<h1 class="title">개인 정보 수정</h1>

				<div id="daumWrap3"></div>
				
			<form id="myinfo_form" name="myinfoForm" method="post" action="mypage_myinfo_Proc.jsp">
				<table class="mypage_table verHead memInfo_table" id="myinfo_table">
					<tr>
						<th>아이디</th>
						<td>
							<input name="id" id="myinfo_id" value="<%=myInfoBean.getId()%>" readonly>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input name="NAME" id="myinfo_name" value="<%=myInfoBean.getNAME()%>">
						</td>
					</tr>
					<tr>
						<th>새 비밀번호</th>
						<td>
							<input type="password" id="myinfo_pwd1" name="newPwd"> 
						</td>
					</tr>
					<tr>
						<th>새 비밀번호 확인</th>
						<td>
							<input type="password" id="myinfo_pwd2" name="pwd"><span id="pwd_alert"></span>
						</td>
					</tr>
					
					<tr>
						<th>생년월일</th>
						<td>
							<input name="birthday" id="myinfo_birthday" placeholder="Ex)1900-01-01" value="<%=myInfoBean.getBirthday()%>">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input name="email" id="myinfo_email" placeholder="Ex)mills@gmail.com" value="<%=myInfoBean.getEmail()%>">
						</td>
					</tr>						
					<tr>
						<th>연락처</th>
						<td>
							<input name="contact" id="myinfo_contact"  placeholder="Ex)010-0000-0000" value="<%=myInfoBean.getContact()%>">
						</td>
					</tr>
					<!-- <div id="address_section"> -->
						<tr>
							<th id="address_th">주소</th>
							<td id="address_td">
								<input id="zip_btn" class="btn" name="zip_btn" type="button" value="주소 찾기" />
								<input class="input_zipcode" id="myinfo_zipcode" name="zipcode"type="text" value="<%=myInfoBean.getZipcode()%>" readonly /> 
								<input class="input_zipcode" id="myinfo_addr" name="address" type="text" value="<%=myInfoBean.getAddress()%>" readonly />
								<input class="input_zipcode" id="myinfo_detail_addr" name="address_detail" type="text" value="<%=myInfoBean.getAddress_detail()%>" placeholder="상세주소를 입력하세요.">
							</td>
						</tr>
					<!-- </div> -->
                </table>
                <div class="mypage_btn_wrapper">
                    <input id="adrress_submit" class="btn mypage_submit" type="button" value="회원정보수정">
                </div>
			</form>
		</div>
		<script type="text/javascript" src="./js/mypage_myinfo.js"></script>


	</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
	</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>