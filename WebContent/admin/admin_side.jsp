<%@page import="member.MemberBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");

		String cpath = request.getContextPath();
		int countPayComplete = oMgr.countPayComplete(id);
		
		if(admin_id==null || admin_id.length()==0){
			response.sendRedirect(cpath+"/index.jsp");
		}else{			
		}
%>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/admin_style.css">
<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
  

  	<!-- top, bottom 제외 페이지 전체-->
    <div id="main">
  
        <header>


        <!-- 요약창 부분 -->
        <div id="manager_summ">
              <ul id="manager_summ_ul">
                  <li id="summ_first">
                  	
                  	                  
                      <div class="top">
                          <span id="name" class="bold">관리자</span>
                          <span id="name_top" class="text">님</span>
                      </div>
                      <div class="bottom">
                          <span id="name_bottom" class="text">환영합니다.</span>
                      </div>
                  </li>                  
                  <li id="summ_last">
                      <div class="top">
                          <span id="del_top" class="text">배송 대기중인 주문</span>
                      </div>
                      <div class="bottom">
                          <span id="del" class="bold"><a href="order_list.jsp"><%=countPayComplete%></a></span>
                          <span id="del_bottom" class="text">건</span>
                      </div>
                  </li>
              </ul>
          </div>


    </header>


    
    <div id="btn_manager_wrapper">  
    <!-- (버튼메뉴 + manager) -->


        <div id="admin_side">

            <div id="section">
                관리자모드
            </div>
    
            <!-- 메뉴 부분 -->
            <div id="manager_btn_wrapper">
                <ul>
                    <a id="btn_first" href="#">
                        <li>
                            <span class="text">통계</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- chart.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="member_list.jsp">
                        <li>
                            <span class="text">회원관리</span>
        
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
        
                            <!-- member_list.jsp / member_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                       
                        </li>
                    </a>
                    <a href="order_list.jsp">
                        <li>
                            <span class="text">주문관리</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
        
                             <!-- order_list.jsp / order_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
        
                        </li>
                    </a>
                    <a href="goods_master.jsp">
                        <li>
                            <span class="text">제품관리</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- goods_master.jsp, goods_insert.jsp, goods_view.jsp, goods_stock.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="member_connect.jsp">
                        <li>
                            <span class="text">접속관리</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- 접속관리 페이지 누락됨 :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <span class="text">QnA</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- qna_list.jsp / qna_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a href="notice_list.jsp">
                        <li>
                            <span class="text">공지사항</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- notice_list.jsp / notice_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                    <a id="btn_last" href="#">
                        <li>
                            <span class="text">FAQ</span>
                            
                            <!-- default 아이콘 -->
                            <span class="icon"><i class="fas fa-chevron-left"></i></span>
                        
                             <!-- faq_list.jsp / faq_view.jsp :: -->
                            <!-- <span class="icon"><i class="fas fa-chevron-right"></i></span> -->
                        
                        </li>
                    </a>
                </ul>
            </div>
        

        </div>   <!-- #btn_wrapper -->


    <!--</div>   #btn_manager_wrapper (버튼메뉴 + manager) : 하위 페이지에서 닫아야함-->
    
   <!--</div>  #main (상단요약 + 버튼 + manager) : 하위페이지에서 닫아야함-->

