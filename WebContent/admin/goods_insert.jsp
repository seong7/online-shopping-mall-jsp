<!-- goods_insert.jsp -->
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<!-- <title>-������-��ǰ ���</title>  -->
</head>
<body topmargin="100">
	<form method="post" action="goods_Proc.jsp?flag=insert"
		enctype="multipart/form-data">
		<!-- enctype="multipart/form-data" �϶����� post������� ������. 
	��ſ� action�� ���ؼ� action="productProc.jsp?flag=insert" �� ������Ѵ�.-->


<!-- <title>-������-��ǰ ���</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

	<jsp:include page="./admin_side.jsp"/>


<!--------------->
<!--  �۾� ����  -->
<!--------------->
	
        <div id="manager">  
        
            <h1 class="title">��ǰ ���</h1>

            <form method="post" action="goods_insertProc.jsp?flag=insert"
                enctype="multipart/form-data">
                <!-- enctype="multipart/form-data" �϶����� post������� ������. 
            ��ſ� action�� ���ؼ� action="productProc.jsp?flag=insert" �� ������Ѵ�.-->
        
                <h3 class="inner_title">�⺻����</h3>


                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>��ǰ�ڵ�</td>
                                    <td><input name="p_code" placeholder="�ڵ������˴ϴ�." readonly></td>
                                
                                    <th>��ǰ��</td>
                                    <td><input name="p_name"></td>
                                </tr>
                                <tr>
                                    <th>��ǰ����</td>
                                    <td><input name="p_price">��</td>
                                
                                    <th>�Ǹſ���</td>
                                    <td>
                                        <input class="radio" type="radio" name="p_on_sale" value="1">�Ǹ�
                                        <input class="radio" type="radio" name="p_on_sale" value="0" checked>�����
                                    </td>
                                </tr>						
                                <tr>
                                    <th>�����(1)</td>
                                    <td>
                                        <select name="rm_code1">
                                            <option value="" disabled selected>������</option>
                                            <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage1" placeholder="������">%
                                    
                                    </td>
                                    
                                    <th>�����(2)</td>
                                    <td>
                                        <select name="rm_code2">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage2" placeholder="������">%
                                    </td>
                                </tr>
                                <tr>
                                    <th>�����(3)</td>
                                    <td>
                                        <select name="rm_code3">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage3" placeholder="������">%
                                    </td>
                                
                                    <th>�����(4)</td>
                                    <td>
                                        <select name="rm_code4">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="rm_pct" name="rm_percentage4" placeholder="������">%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">��������</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>�����̹���</td>
                                    <td><input type="file" name="upFile1"></td>
                                </tr>
                                <tr>
                                    <th>�����̹���</td>
                                    <td><input type="file" name="upFile2"></td>
                                </tr>
                                <tr>
                                    <th>���̹���</td>
                                    <td><input type="file" name="upFile3"></td>
                                </tr>
                            </table>

            <div class="submit_wrapper">
                <input class="btn" type="submit" value="��ǰ���">
                <input class="btn" type="reset" value="�ٽþ���">
            </div>
            </form>
        
        </div>	
	
	
<!----------------->
<!--  �۾� ���� �� -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (��ư�޴� + manager) : admin_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + manager) : admin_side.jsp ���� ����-->
	<jsp:include page="../bottom.jsp"/>

</body>
</html>