package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//post.jsp에 입력한 게시물을 저장 처리하기 위한 기능의 메소드
@WebServlet("/admin/noticePost")
public class NoticePostServlet extends HttpServlet {

	@Override	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		AdminMgr mgr = new AdminMgr();
		mgr.insertBoard(request);
		response.sendRedirect("notice_list.jsp");
	}
}