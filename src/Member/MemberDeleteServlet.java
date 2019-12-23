package Member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/deletemember")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("member_id");
		MemberMgr mgr = new MemberMgr();
		PrintWriter pw = response.getWriter();
		response.getWriter().write(new MemberMgr().deleteMember(user_id)+ "");
		
	}

}
