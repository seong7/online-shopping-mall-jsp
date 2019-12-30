<!-- member connect -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- <title>-관리자-제품 등록</title> -->



<%@ include file="../top.jsp" %>

<%@ include file="./admin_side.jsp"%> 
<link rel="stylesheet" type="text/css" href="./css/member_connect.css">
<!--------------->
<!--  작업 영역  -->
<!--------------->
    <div id="manager">  
   		<div class="form_wrapper">
            <h3 class="title">회원 정보 List</h3>
            <table id="connect_table" class="cell-border hover nowrap order-column cell-border ">
            	<thead>
	            <tr id="judgeRow">
	                <th>순번</th>
	                <th>ID</th>
	                <th>접속시간</th>
	                <th>IP</th>
	            </tr>
	            </thead>
        	</table>
     	</div>
    </div>	
    
    
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
<script src="js/member_connect.js"></script>
</body>
</html>