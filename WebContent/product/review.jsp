
<!---------  mypage 와 goods_view 에 알맞에 review table 출력 --------->



<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="product.ReviewBean" %>
<%@ page import="java.util.Vector" %>

<jsp:useBean id="reviewListMgr" class="product.ReviewMgr"/>

<!-- 작업용 : 삭제 예정 -->
<link rel="stylesheet" type="text/css" href="../vscode__utf8/product/css/review.css">
<!-- 작업용 : 삭제 예정 -->

	<div id="review_wrapper">
	
	
	</div>
	<table class="horHead review_table" id="review_read_tb">
		<tr class="column_tr">
			<th>번호</th>
			
			<% if(reviewList.equals("mypage")){%>
			<!-- if mypage_review.jsp 일 때만 -->
			<th colspan="2">제품정보</th>
			<% } %>

			<th>평점</th>
			<th>내용</th>
			
			<% if(reviewList.equals("goods_view")){%>
			<!-- if goods_view.jsp 일 때만 -->
			<th>작성자</th>
			<% } %>
			
			<th>구매일</th>
		</tr>
		
		<%	

//////////////////////////////////////////////////////////////////////
/////////////////////  mypage_review.jsp 일 때 영역 //////////////////////
//////////////////////////////////////////////////////////////////////

			if(reviewList.equals("mypage")){
				
			// 리뷰 목록 가져오기 
			Vector<ReviewBean> mReBeanList = reviewListMgr.getReviewsById(id);
		
				if(mReBeanList.isEmpty()){
		%>
				
				<tr>
					<td colspan="6">
						작성된 리뷰가 없습니다.
					</td>
				</tr>
				
		<%		
				} // --if

				else{
					int i = 0;
					for(ReviewBean reBean: mReBeanList){
						i++;
						int o_index = reBean.getO_index();
						String p_name = reBean.getP_name();
						int rP_code = reBean.getP_code();
						int r_rate = reBean.getR_rate();
						String r_content = reBean.getR_content();
						String o_date = reBean.getO_date();
						String p_main_pht_name = reBean.getP_main_pht_name();
						
		%>
					<tr class="pointer_tr">
						<td>
							<%= i %>
						</td>
						<td>
							<img alt="제품사진" src="${pageContext.request.contextPath}/img/product/<%=p_main_pht_name%>">
						</td>
						<td class="btn_td">
							<a href="${pageContext.request.contextPath}/product/goods_view.jsp?p_code=<%=rP_code%>">
								<%=p_name %>
							</a>
						</td>
						<td>
							<% 
								for(int j=0; j<5; j++){
									if(j+1 <= r_rate){
							%>
										<i class="yStar fas fa-star"></i>
							<%		
									}else{
							%>
										<i class="nStar far fa-star"></i>
							<%		
									}
								}
							%>
						</td>
						<td>
							<%=r_content %>
						</td>
						<td>
							<%=o_date %>
						</td>
					</tr>
						
		<%			
					} // -- for
				} //-- else ( reviewBean Vector.size() > 0 )
			}// -- if
		%>
		
		
		<%	
		
//////////////////////////////////////////////////////////////////////
/////////////////////  goods_view.jsp 일 때 영역 //////////////////////
//////////////////////////////////////////////////////////////////////
		
			if(reviewList.equals("goods_view")){
				
			// 리뷰 목록 가져오기 
			Vector<ReviewBean> mReBeanList = reviewListMgr.getReviewsByPCode(p_code);
		
				if(mReBeanList.isEmpty()){
		%>
				
				<tr>
					<td colspan="5">
						작성된 리뷰가 없습니다.
					</td>
				</tr>
				
		<%		
				} // --if

				else{
					int i = 0;
					for(ReviewBean reBean: mReBeanList){
						i++;
						int r_rate = reBean.getR_rate();
						String r_content = reBean.getR_content();
						String o_date = reBean.getO_date();
						String p_main_pht_name = reBean.getP_main_pht_name();
						String reId = reBean.getId();
		%>
					<tr class="pointer_tr">
						<td>
							<%= i %>
						</td>
						<td>
							<% 
								for(int j=0; j<5; j++){
									if(j <= r_rate){
							%>
										<i class="yStar fas fa-star"></i>
							<%		
									}else{
							%>
										<i class="nStar far fa-star"></i>
							<%		
									}
								}
							%>
						</td>
						<td>
							<%=r_content %>
						</td>
						<td>
							<%=reId %>
						</td>
						<td>
							<%=o_date %>
						</td>
					</tr>
						
		<%			
					}
		%>
			
		<%		
				}
			}// if
		%>
		
		
		
	</table>