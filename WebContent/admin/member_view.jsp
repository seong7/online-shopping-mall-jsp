<!-- member view -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- <title>-������-��ǰ ���</title> -->


<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 
<!--------------->
<!--  �۾� ����  -->
<!--------------->
<link rel="stylesheet" type="text/css" href="./css/member_view.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/ju/dt-1.10.20/datatables.min.css"/>
<!-- 
<script type="text/javascript" src="https://cdn.datatables.net/v/ju/dt-1.10.20/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>
 <link rel="stylesheet" type="text/css" href="./css/datatable.css"> -->



	<main>
	<div id="daumWrap2"></div>
	  <div id="manager">   
       <h3 class="inner_title">ȸ�� ����</h3>
		<table class="mgr_table verHead" id="search_table">
		<tr >
			<th>�̸�</th>
			<td><input class="disabled" id="member_name" readonly></td>
			<th>���̵�</th>
			<td><input class="disabled" id="member_id" value=<%=request.getParameter("id")%> readonly></td>
		</tr>
		<tr>
			<th>�������</th>
			<td><input class="member_inputs disabled" id="member_birthday"  readonly></td>
			<th>������</th>
			<td><input class="member_inputs disabled" id="member_joindate" readonly></td>
		</tr>
		<tr>
			<th>����ó</th>
			<td><input class="member_inputs disabled" id="member_contact" readonly></td>
			<th>�̸���</th>
			<td><input class="member_inputs disabled" id="member_email" readonly></td>
		</tr>
		<tr>
			<th>��������Ʈ</th>
			<td><input class="disabled" id="member_point" readonly></td>
			<th>�����ȣ</th>
			<td><input class="disabled" id="member_zipcode" readonly></td>
		</tr>
		<tr>
			<th>�ּ�</th>
			<td colspan="3"><input class="disabled" id="member_address" readonly><input id="addr_btn" name="zip_btn" type="button" value="�ּ� ã��" disabled="disabled" onclick="openDaumZipAddress();"/></td>
		</tr>			
			<th>���ּ�</th>
			<td colspan="3"><input class="member_inputs disabled" id="member_address_detail" readonly></td>
		</tr>
		</table>
		<div id="view_btn_wrapper">
			<input class="btn" id="update" type="button" value="����"> 
			<input class="btn" id="delete" type="button" value="ȸ�� ���� ����">
			<input class="btn" id="search_order" type="button" value="�ֹ�����">
		</div>
		<!--
	<h3 class="inner_title">���ų���</h3>
		<table class="table table-striped table-bordered" id="order_table">
			<thead>
			<tr id="judgeRow">
				<th>��ȣ</th>
				<th>�ֹ��Ͻ�</th>
				<th>�ֹ���ȣ</th>
				<th>��ǰ��</th>
				<th>�ֹ��ݾ�</th>
				<th>�ֹ�����</th>
				<th>��ǰ����</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		  -->
		  </div>
		</main>
		<script src="js/member_view.js"></script>
		
		
</div> <!--  #btn_manager_wrapper (��ư�޴� + manager) : admin_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + manager) : admin_side.jsp ���� ����-->

	<%@ include file="../bottom.jsp" %>
	
	
</body>
</html>