<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");

		String cpath = request.getContextPath();
		
		
		if(id==null || id.length()==0){
			response.sendRedirect(cpath+"/index.jsp");
		}
%>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_style.css">
<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
  

  	<!-- top, bottom ���� ������ ��ü-->
    <div id="main">
  
        <header>


        <!-- ���â �κ� -->
        <div id="manager_summ">
              <ul id="manager_summ_ul">
                  <li id="summ_first">
                  	
                  	  <!-- �ӽ� �޸�  :: -->
                      <span style="font-size: 12px; color: red;">������ ����� ���â <br/>(��� ����: ���� / ����: ����)</span>
                  
                      <div class="top">
                          <span id="name" class="bold">�輺��</span>
                          <span id="name_top" class="text">��</span>
                      </div>
                      <div class="bottom">
                          <span id="name_bottom" class="text">ȯ���մϴ�.</span>
                      </div>
                  </li>
                  <li>
                      <div class="top">
                          <span id="point_top" class="text">��밡�� ����Ʈ</span>
                      </div>
                      <div class="bottom">
                          <span id="point" class="bold">1,000</span>
                          <span id="point_bottm" class="text">��</span>
                      </div>
                  </li>
                  <li id="summ_last">
                      <div class="top">
                          <span id="del_top" class="text">������� �ֹ�</span>
                      </div>
                      <div class="bottom">
                          <span id="del" class="bold">2</span>
                          <span id="del_bottom" class="text">��</span>
                      </div>
                  </li>
              </ul>
          </div>


    </header>


    
    <div id="btn_manager_wrapper">  
    <!-- (��ư�޴� + manager) -->


        <div id="admin_side">

            <div id="section">
                �����ڸ��
            </div>
    
            <!-- �޴� �κ� -->
            <div id="manager_btn_wrapper">
                <ul>
                    <a id="btn_first" href="#">
                        <li>
                            <span class="text">���</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- chart.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">ȸ������</span>
        
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
        
                            <!-- member_list.jsp / member_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                       
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">�ֹ�����</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
        
                             <!-- order_list.jsp / order_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">��ǰ����</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- goods_master.jsp, goods_insert.jsp, goods_view.jsp, goods_stock.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">���Ӱ���</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- ���Ӱ��� ������ ������ :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">QnA</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- qna_list.jsp / qna_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">��������</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- notice_list.jsp / notice_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a id="btn_last" href="#">
                        <li>
                            <span class="text">FAQ</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- faq_list.jsp / faq_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                </ul>
            </div>
        

        </div>   <!-- #btn_wrapper -->


    <!--</div>   #btn_manager_wrapper (��ư�޴� + manager) : ���� ���������� �ݾƾ���-->
    
   <!--</div>  #main (��ܿ�� + ��ư + manager) : �������������� �ݾƾ���-->

