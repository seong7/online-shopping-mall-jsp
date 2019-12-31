<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="./admin_side.jsp"%>
	
	<link rel="stylesheet" type="text/css" href="./css/notice_list.css"> 

<%
	request.setCharacterEncoding("EUC-KR");
	int num = UtilMgr.parseInt(request, "num");
	NoticeBean bean = mgr.getNotice(num);	
	String n_id = bean.getN_id();
	int n_index=bean.getN_index();
%>

	<div id="manager">
		<h1 class="title">공지사항</h1>

		<form name="Frm" method="post" action ="notice_Proc.jsp?flag=update" enctype="multipart/form-data">
			<input type= "hidden" name = "n_index" value="<%=bean.getN_index()%>">
			<input type= "hidden" name = "n_id" value="<%=bean.getN_id()%>">
			<input type= "hidden" name = "n_category" value="<%=bean.getN_category()%>">
			<input type= "hidden" name =" n_file_size" value="<%=bean.getN_file_size()%>">
				
			<h3 class="inner_title">공지사항 수정</h3>	
			<table class="mgr_table verHead notice_view_table" > 				
					<tr>
						<th>이 름</th>
						<%if(n_id.equals("m1") || n_id.equals("m2")|| n_id.equals("m3")){ %>
						<td>관리자</td><%}else{%><td>관리자아님</td><%}%>					
					</tr>
					
					<tr>
						<th>작성일</th>
						<td><%=bean.getN_date() %></td>
					</tr>
					
					<tr>
						 <th> 제 목</th>
						 <td><input  id="notice_write_title" name=n_title  value="<%=bean.getN_title() %>"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
						<select name="n_category">
							<option><%=bean.getN_category()%></option>
							<option value="주문/결제">주문/결제</option>
							<option value="회원문의">회원</option>
							<option value="취소/교환/반품">취소/교환/반품</option>
							<option value="배송문의">배송</option>
							<option value="기타">기타</option>
						</select>
						</td>
					<tr>
						  <th>첨부파일</th>
						  <td>
						  	<div class="filebox">
						  	<span id="img_file_name"><%=bean.getN_file_name()%></span>
					  	<label for="img_upload">업로드</label>
		     				<input type="file" name="noticeFile" id="img_upload">
                    </div>
						  </td>
					</tr>				
					<tr>
						<td id="input_td" colspan="2">
							<textarea name="n_content" ><%=bean.getN_content()%></textarea>
						</td>
					</tr>
			</table>
								
			<div class="submit_wrapper">
					<input class="btn" type="submit" value="수정하기">
					<input class="btn" type="button" value="수정취소" onClick="javascript:location.href='notice_list.jsp'">				
			</div>
				
		</form>



	</div>

	
<!----------------->
<!--  작업 영역 끝 -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (버튼메뉴 + manager) : admin_side.jsp 에서 열림-->
</div> <!-- #main (상단요약 + 버튼 + manager) : admin_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
	<script>
	window.onload = function(){
		function btnInit(){
			document.getElementById('img_upload').addEventListener('change',function(){
			    var fileValue = $("#img_upload").val().split("\\");
			    var fileName = fileValue[fileValue.length-1]; // 파일명
				document.getElementById('img_file_name').innerHTML = fileName;
			});
		}
		btnInit();
	}
	</script>
</body>
</html>