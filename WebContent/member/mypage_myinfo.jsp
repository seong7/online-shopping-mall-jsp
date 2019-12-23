<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>

      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
            function openDaumZipAddress() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
        
                        // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                        // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                        var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                        var extraRoadAddr = ''; // ���� �׸� ����
             
                        // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                        // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                        if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }
        
                        // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                        document.getElementById('input_zipcode').value = data.zonecode;
                        document.getElementById('input_addr').value = roadAddr + " " + data.jibunAddress;
                        
                        // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                        if(roadAddr !== ''){
                            document.getElementById("input_detail").value = extraRoadAddr;
                        } else {
                            document.getElementById("input_detail").value = '"';
                        }
        
                        // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                        if(data.autoRoadAddress) {
                        	alert('�Է����ּ���');
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
		MemberBean bean = null;	
	
		if(access==null || access.length()==0){
			if(id==null || id.length()==0){
				response.sendRedirect(cpath+"/index.jsp");
				return;   // return �� �־����
			}else{
				response.sendRedirect(cpath+"/member/myinfo_check.jsp");
				return;
			}
		}else{
			session.removeAttribute("myinfo_access");
			bean = mgr.getMember(id);
		}
	%>

       <div id="mypage">

			<h1 class="title">���� ���� ����</h1>


			<form name="myinfoForm" method="post" action="mypage_myinfo_Proc.jsp">
				<table class="mypage_table verHead" id="myinfo_table">
					<tr>
						<th>���̵�</th>
						<td>
							<input name="id" id="myinfo_id" value="<%=bean.getId()%>" readonly>
						</td>
					</tr>
					<tr>
						<th>�̸�</th>
						<td>
							<input name="NAME" id="myinfo_name" value="<%=bean.getNAME()%>">
						</td>
					</tr>
					<tr>
						<th>�� ��й�ȣ</th>
						<td>
							<input type="password" id="myinfo_pwd1" name="newPwd">
						</td>
					</tr>
					<tr>
						<th>�� ��й�ȣ Ȯ��</th>
						<td>
							<input type="password" id="myinfo_pwd2" name="pwd">
						</td>
					</tr>
					
					<tr>
						<th>�������</th>
						<td>
							<input name="birthday" id="myinfo_birthday" placeholder="Ex)1900-01-01" value="<%=bean.getBirthday()%>">
						</td>
					</tr>
					<tr>
						<th>�̸���</th>
						<td>
							<input name="email" id="myinfo_email" placeholder="Ex)mills@gmail.com" value="<%=bean.getEmail()%>">
						</td>
					</tr>						
					<tr>
						<th>����ó</th>
						<td>
							<input name="contact" id="myinfo_contact"  placeholder="Ex)010-0000-0000" value="<%=bean.getContact()%>">
						</td>
					</tr>
					<!-- <div id="address_section"> -->
						<tr>
							<th id="address_th">�����ȣ</th>
							<td id="address_td">
								<input id="zip_btn" class="btn" name="zip_btn" type="button" onclick="openDaumZipAddress();"value="�ּ�" />
								<input class="input_zipcode" name="zipcode"type="text" value="<%=bean.getZipcode()%>" readonly /> 
								<input class="input_zipcode" name="address" type="text" value="<%=bean.getAddress()%>" readonly />
								<input class="input_zipcode" id="myinfo_detail_addr" name="address_detail" type="text" value="<%=bean.getAddress_detail()%>" placeholder="���ּҸ� �Է��ϼ���.">
							</td>
						</tr>
					<!-- </div> -->
                </table>
                <div class="mypage_btn_wrapper">
                    <input id="adrress_submit" class="btn mypage_submit" type="button" onclick="info_check();"value="ȸ����������">
                </div>
			</form>
		</div>
		<script type="text/javascript" src="./js/mypage_myinfo.js"></script>


	</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
	</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>