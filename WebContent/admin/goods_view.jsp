<!-- goods_view.jsp -->
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Product.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	ProductBean bean = mgr.getProduct(p_code);
%>
<html>
<head>
<!-- <title>-������-��ǰ ���</title>  -->



</head>
<body topmargin="100">	

<!-- <title>-������-��ǰ ���</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%> 

<!--------------->
<!--  �۾� ����  -->
<!--------------->
	
        <div id="manager">  
        
            <h1 class="title">��ǰ �󼼺���</h1>

            <form name="frm" method="post" action="goods_Proc.jsp?flag=update"
                enctype="multipart/form-data" >
                <!-- enctype="multipart/form-data" �϶����� post������� ������. 
            ��ſ� action�� ���ؼ� action="productProc.jsp?flag=insert" �� ������Ѵ�.-->        
        
        		<!--  input hidden ���� flag �� �ѱ�� flag=update ���� ���� 
        		<input type="hidden" value="update" name="flag">	-->
        
        
        
                <h3 class="inner_title">�⺻����</h3>
                
                <input id="chgread1" class="btn" type="button" value="����">
                
                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>��ǰ�ڵ�</th>
                                    <td><input name="p_code" value="<%=bean.getP_code()%>" readonly>                                                            	
                                    <th>��ǰ��</th>
                                    <td><input class="1 readChange" name="p_name" value="<%=bean.getP_name()%>" disabled></td>
                                </tr>
                                <tr>
                                    <th>��ǰ����</th>
                                    <td><input class="2 readChange" name="p_price" value="<%=bean.getP_price()%>" disabled>��</td>
                                    
                                    <th>�Ǹſ���</th>
                                    <td>
                                    	<%if(bean.getP_on_sale()==1){%>
                                    	<input  class="3 readChange radio" type="radio" name="p_on_sale" value="1"checked disabled>�Ǹ�
                                        <input  class="4 readChange radio" type="radio" name="p_on_sale" value="0" disabled>�����
                                        <%}else{%>
                                        <input  class="3 readChange radio" type="radio" name="p_on_sale" value="1" disabled>�Ǹ�
                                        <input  class="4 readChange radio" type="radio" name="p_on_sale" value="0" checked disabled>�����
                                        <%} %>
                                    </td>
                                </tr>						
                                <tr>
                                    <th>�����(1)</th>
                                    <td>
                                        <select name="rm_code1" class="5a readChange"disabled>
                                            <option value="" disabled selected>������</option>
                                            <option value=""></option>
                                        </select>
                                        <input class="5b readChange rm_pct" name="rm_percentage1" placeholder="������" disabled>%
                                    
                                    </td>
                                    
                                    <th>�����(2)</th>
                                    <td>
                                        <select name="rm_code2" class="6a readChange" disabled>
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="6b readChange rm_pct" name="rm_percentage2" placeholder="������" disabled>%
                                    </td>
                                </tr>
                                <tr>
                                    <th>�����(3)</th>
                                    <td>
                                        <select name="rm_code3" class="7a readChange" disabled>
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="7b readChange rm_pct" name="rm_percentage3" placeholder="������" disabled>%
                                    </td>                                
                                    <th>�����(4)</th>
                                    <td>
                                        <select class="8a readChange"name="rm_code4" disabled>
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="8b readChange rm_pct" name="rm_percentage4" placeholder="������" disabled>%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">��������</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>�����̹���</th>
                                    <td><%=bean.getP_main_pht_name()%>
                                    <input class="9 readChange" type="file" name="upFile1" disabled></td>
                                </tr>
                                <tr>
                                    <th>�����̹���</th>                                                                    
                                    <td> <%=bean.getP_detail_pht_name()%>
                                    <input class="10 readChange" type="file" name="upFile2" disabled></td>
                                </tr>
                                <tr>
                                    <th>���̹���</th>
                                    <td> <%=bean.getP_info_pht_name()%>
                                    <input class="11 readChange" type="file" name="upFile3" disabled></td>
                                </tr>
                            </table>
                            

            <div class="submit_wrapper">
                <input class="btn" type="button" value="�������" onclick="location.href='goods_master.jsp'">
                <input class="btn readChange" type="submit" value="�����Ϸ�" disabled>                
                <input class="btn" type="button" value="�����ϱ�" onclick="location.href='goods_Proc.jsp?flag=delete&pcode=<%=bean.getP_code()%>'">
                <input class="btn" type="reset" value="�ٽþ���">
                <input type="hidden"  value="<%=bean.getP_code()%>" name="pcode">
                
            </div>
            </form>        
        </div>		
<!----------------->
<!--  �۾� ���� �� -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (��ư�޴� + manager) : admin_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + manager) : admin_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
</body>

<script>
	window.onload = function(){
		function btnInit(){
			const button = document.querySelector('#chgread1');
			let flag = 0;
			button.addEventListener('click', function(){
				const reads = document.querySelectorAll('.readChange');
				if(flag===0){
					console.log("DDD");
					reads.forEach(function(items){
						items.disabled = false;
					});
					flag = 1;
					button.value = '����';
					console.log(button);
				}else{
					reads.forEach(function(items){
						items.disabled = true;
					});
					flag = 0;
					console.log("FFF");
					button.value = '����';
					console.log(button);
				}
			});
		}
		btnInit();
	}
</script>
</html>