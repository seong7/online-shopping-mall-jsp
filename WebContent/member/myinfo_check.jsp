<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<html>
<head>
</head>
<body>
<div class="page_section section_myinfo">
<div class="head_aticle">
<h2 class="tit">���� ���� ����</h2>
</div>
<div class="conf_pw">
<form name="confirmForm" method="post" action="myinfo_check_Proc.jsp">
<div class="field_pw">
<input type="text" id="login_id_input" class="login_input" name="id" placeholder="���̵� �Է����ּ���." >
<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="��й�ȣ�� �Է����ּ���.">

</div>
<div class="group_btn">
<span class="inner_groupbtn">
</br>
<button type="submit" class="btn btn_positive">Ȯ��</button>
</span>
</div>
</form>
</div>
</div>