<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr" />
<%
	String id = (String) session.getAttribute("idKey");
	MemberBean bean = mgr.getMember(id);
%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function openDaumZipAddress() {
                new daum.Postcode({
                    oncomplete: function(data) {
                    	console.log("gd");
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
<!-- form 시작 부 -->
<html>
<head>
<title>회원정보 수정</title>
</head>
<body>
	<div class="page_section_myinfo">
		<div class="head_aticle">
			<h2 class="tit">개인 정보 수정</h2>
			<hr>
		</div>
		<div class="myinfo">
			<h4>*필수입력사항</h4>
			<form name="myinfoForm" method="post" action="mypage_myinfo_Proc.jsp">
				<table class="Member_comm">
					<tbody>
						<tr>
							<td class="member_id1">*아이디</td>
							<td class="member_id2"><input name="id"
								value="<%=bean.getId()%>" ></td>
						</tr>
						<tr>
							<td class="member_name1">*이름</td>
							<td class="member_name2"><input name="name"
								value="<%=bean.getName()%>"></td>
						</tr>
						
						<tr>
							<td class="member_ori_pwd1">현재 비밀번호</td>
							<td class="member_ori_pwd2"><input type="password"
								name="pwd"> <!-- <p class="txt_guide" style="display: block;">
					<span class="txt_guide_pwd">현재 비밀번호를 확인해주세요</span></p> --></td>
						</tr>
						
						<tr class="member_new_pwd">
							<td class="new_pwd1">새 비밀번호</td>
							<td class="new_pwd2"><input type="password" name="newPwd"></td>
						</tr>
						
						<tr class="member_new_pwd_check">
							<td class="pwd_check1">새 비밀번호 확인</td>
							<td class="pwd_check2"><input type="password"
								name="checkPwd"></td>
						</tr>
						
						<tr>
							<td class="member_birthday1">생년월일</td>
							<td class="member_birthday2"><input name="birthday"
								placeholder="Ex)1900-01-01"></td>
						</tr>
						<tr>
							<td class="member_email1">이메일</td>
							<td class="member_email2"><input name="email"
								placeholder="Ex)mills@gmail.com"></td>
						</tr>						
						<tr>
							<td class="member_contact1">연락처</td>
							<td class="member_contact2"><input name="contact"
								placeholder="Ex)010-0000-0000"></td>
						</tr>
						<div id="address_section">
							<tr>
								<td class="member_zipcode1">*우편번호</td>
								<td class="member_zipcode2"><input id="input_zipcode"name="zipcode"type="text" value="<%=bean.getZipcode()%>"  /> 
								<input name="zip_btn" type="button" onclick="openDaumZipAddress();"value="주소 찾기" /></br> 
								<input name="address" id="input_addr" type="text"
									value="<%=bean.getAddress()%>" /></td>
							</tr>
							<tr>
								<td class="member_addr_detail1">상세주소</td>
								<td class="member_addr_detail2"><input name="address_detail" id="input_detail"
									type="text" value="<%=bean.getAddress_detail()%>"></td>
							</tr>
						</div>
					</tbody>
				</table>
				<input type="submit" class="myinfo_btn" value="회원정보수정">
			</form>
		</div>
	</div>
</body>
</html>
