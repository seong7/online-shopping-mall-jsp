<%@page import="member.MemberBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<jsp:useBean id="pointMgr" class="order.PointMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String cpath = request.getContextPath();
		MemberBean myPageSide_bean = null;
		int countDeliver = oMgr.countDeliver(id);
		int point = pointMgr.getPoint(id); //����Ʈ ��������. 

		if(id==null || id.length()==0){
			response.sendRedirect(cpath+"/index.jsp");
			return;
		}else{
			myPageSide_bean = mMgr.getMember(id);			
		}		
%>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/order/css/mypage_style.css">
<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
  
  	<!-- top, bottom ���� ������ ��ü-->
    <div id="main">
  
        <header>


        <!-- ���â �κ� -->
        <div id="mypage_summ">
              <ul id="mypage_summ_ul">
                  <li id="summ_first">
                      <div class="top">
                          <span id="name" class="bold"><%=myPageSide_bean.getNAME() %></span>
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
                          <span id="point" class="bold"><%=point %></span>
                          <span id="point_bottm" class="text">��</span>
                      </div>
                  </li>
                  <li id="summ_last">
                      <div class="top">
                          <span id="del_top" class="text">������� �ֹ�</span>
                      </div>
                      <div class="bottom">
                          <span id="del" class="bold"><a href="mypage_orderlist.jsp"><%=countDeliver%></a></span>
                          <span id="del_bottom" class="text">��</span>
                      </div>
                  </li>
              </ul>
          </div>


    </header>


    
    <div id="btn_mypage_wrapper">  
    <!-- (��ư�޴� + mypage) -->


        <div id="mypage_side">
        
        	<div id="section">
              	  ����������
            </div>
    
    
            <!-- �޴� �κ� -->
            <div id="mypage_btn_wrapper">
                <ul>
                    <a id="btn_first" href="../order/mypage_orderlist.jsp">
                        <li>
                            <span class="text">�ֹ�����</span>
        
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
        
                            <!-- mypage_orderlist.jsp / order_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                       
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">�������</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
        
                             <!-- mypage_review.jsp / review_write.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">����Ʈ����</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- mypage_point.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a id="btn_last" href="../member/myinfo_check.jsp">
                        <li>
                            <span class="text">ȸ������</span>
                            
                            <!-- default ������ -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- myinfo_check.jsp / mypage_myinfo.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                </ul>
            </div>
        

        </div>   <!-- #btn_wrapper -->


    <!-- </div>   #btn_mypage_wrapper (��ư�޴� + mypage) : ���� ���������� �ݾƾ���-->
    
   <!-- </div>  #main (��ܿ�� + ��ư + mypage) : �������������� �ݾƾ���-->
