<%@page import="Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="Member.MemberMgr"/>
<%
		String id = (String)session.getAttribute("idKey");
		MemberBean bean = mgr.getMember(id);
%>
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
<html>
<head>
<title>ȸ������ ����</title>
</head>
<body>
<div class="page_section_myinfo">
	<div class="head_aticle">
	<h2 class="tit">���� ���� ����</h2>
	<hr>
	</div>
<div class="myinfo">
	<h4>*�ʼ��Է»���</h4>
	<form name="myinfoForm" method="post" action="mypage_myinfo_Proc.jsp" accept-charset="EUC-KR">
	<table class="Member_comm">
		<tbody>
			<tr>
				<td class="member_id1">*���̵�</td>
				<td class="member_id2"><input name="id" value="<%=bean.getId()%>" readonly></td>	
			</tr>
			<tr>
				<td class="member_ori_pwd1">���� ��й�ȣ</td>
				<td class="member_ori_pwd2"><input type="password" name="pwd">
				<!-- <p class="txt_guide" style="display: block;">
					<span class="txt_guide_pwd">���� ��й�ȣ�� Ȯ�����ּ���</span></p> -->
				</td>
			</tr>
			<tr class="member_new_pwd">
				<td class="new_pwd1">�� ��й�ȣ</td>
				<td class="new_pwd2"><input type="password" name="newPassword"></td>
			</tr>
			<tr class="member_new_pwd_check">
				<td class="pwd_check1">�� ��й�ȣ Ȯ��</td>
				<td class="pwd_check2"><input type="password" name="checkPassword"></td>
			</tr>
			<tr>
				<td class="member_name1">*�̸�</td>
				<td class="member_name2"><input name="name" value="<%=bean.getNAME()%>"></td>
			</tr>
			<tr>
				<td class="member_birthday1">�������</td>
				<td class="member_birthday2"><input name="birthday"  placeholder="Ex)1900-01-01"></td>			
			</tr>
			<tr>
				<td class="member_email1">�̸���</td>
				<td class="member_email2"><input name="email" placeholder="Ex)mills@gmail.com"></td>
			</tr>
			<tr>
				<td class="member_contact1">����ó</td>
				<td class="member_contact2"><input name="contact" placeholder="Ex)010-0000-0000"></td>
			</tr>
		<div id="address_section">
			<tr>
				<td class="member_zipcode1">*�����ȣ</td>
				<td class="member_zipcode2">
					<input name="zipcode"  type="text" value="<%=bean.getZipcode() %>" readOnly/>
					<input name="zip_btn"  type="button" onClick="openDaumZipAddress()" value = "�ּ� ã��"/></br>
					<input name="address"  type="text" value="<%=bean.getAddress() %>" readOnly/>
				</td>					
			</tr>
			<tr>
				<td class="member_addr_detail1">���ּ�</td>
				<td class="member_addr_detail2"><input name="addr_detail" type="text" value="<%=bean.getAddress_detail()%>" ></td>
			</tr>		
		</div>		
	</tbody>
	</table>
	<input type ="submit" class="myinfo_btn" value="ȸ����������">
</div>
</div>
</form>
</body>
</html>