<%@page import="Order.UtilMgr"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.OrderDetailBean"%>
<%@page import="Order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="Order.OrderMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//�� �Խù� ����
		int numPerPage=10;//�������� ���ڵ� ����(5,10,15,30 �ɼ��߰�)
		int pagePerBlock = 15;//�������� �� ����
		int totalPage = 0;//�� ������ ����
		int totalBlock = 0;//�� �� ����
		int nowPage = 1;//���� ������ 
		int nowBlock = 1;//���� �� 
		
		//page�� ������ �Խù� ���� �� 
		if(request.getParameter("numPerPage")!=null&&
		!request.getParameter("numPerPage").equals("null")){
		numPerPage = UtilMgr.parseInt(request, "numPerPage");
		//numPerPage = Integer.parseInt(request.getParameter("numPerPage")); ��밡�� 
		}

		int start = 0;//���̺� �Խù� ���� ��ȣ 
		int cnt = 5;
		
		//�˻��� �ʿ��� ���� 
		String keyField = "";
		String keyWord = "";
		
		//�˻��϶� 
		if(request.getParameter("keyWord")!=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
				
		//�˻� �Ŀ� �ٽ� ó�� ȭ������ 
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
		keyField = "";  keyWord = "";
		}
		
		totalRecord = orderMgr.getTotalCount(keyField, keyWord);
		//out.print(totalRecord);

%>
<html>
<head>
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	
	function list() {//����Ʈ�� �̵�
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {//�������� ���̴� ����
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
		
	function block(block) {//prev...or ...next�� nowPage���� ����
			document.readFrm.nowPage.value = 
				<%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
		}
		
	function pageing(page) {//pageStart ���� ������??
			document.readFrm.nowPage.value = page;
			document.readFrm.submit();
		}
</script>
</head>
<body>
<div align="center"><br/>
<form  name="searchFrm">
	<table  width="600" cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> �ֹ��� ID</option>
    				<option value="subject">�ֹ���ȣ</option>
    				<option value="content"> �ֹ�����</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="ã��" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
</form>

<table>
	 <tr>
          <th>��ȣ</th>
          <th>�ֹ��� ID</th>
          <th>�ֹ��Ͻ�</th>
          <th>�ֹ���ȣ</th>
          <th>��ǰ��</th>
          <th>�ֹ��ݾ�</th>
          <th>�ֹ�����</th>
           <th>��ǰ����</th>
     </tr>
	<%
		Vector<OrderBean> vlist = 
		orderMgr.getOrderList(keyField, keyWord, start, cnt);
		if(vlist.isEmpty()){
	%>
	<tr>
		<td colspan="5">
			�ֹ��Ͻ� ��ǰ�� �����ϴ�.
		</td>
	</tr>
		<%} else{
			for(int i=0;i<vlist.size();i++){
			OrderBean order = vlist.get(i);
			int o_index = order.getO_index();
			%>
			<tr>
				<td><%=totalRecord-start-i %></td>
					<td><%=order.getO_id()%></td>
					<td><%=order.getO_date()%></td>
					<td><%=order.getO_index()%></td>
					<%
					Vector<OrderDetailBean> dvlist= orderMgr.getOrderCode(o_index);
					for(int j=0;j<dvlist.size();j++){
					OrderDetailBean detailOrder = dvlist.get(j);
					int p_code = detailOrder.getP_code();
					ProductBean pbean = pMgr.getProduct(p_code);
					%>
					<td><%=pbean.getP_name() %></td>
					<td><%=order.getO_total_amount()%></td>
					<td><%=order.getO_status()%></td>
			</tr>
			<%
						}//---for
					}//---for
				}//---else
				%>
	<tr>
		<td></td>
	</tr>
</table>
</div>
</body>
</html>