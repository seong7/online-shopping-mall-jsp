package Member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberloginServlet2
 */
@WebServlet("/member/login")
public class MemberloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("login_id");
		String pwd = request.getParameter("login_pwd");
		System.out.println(id);
		System.out.println(pwd);
		MemberMgr mgr = new MemberMgr();
		int admin_result = mgr.adminlogin(id, pwd);
		if(admin_result==0) {
		int result = mgr.login(id, pwd);
		if(result==0) {
				System.out.println("로그인 실패");
			}else {
				HttpSession session = request.getSession();
			    session.setAttribute("idKey",id);
				System.out.println("로그인 성공 " +id);
				System.out.println("로그인 성공 " +pwd);
				
				response.getWriter().write(result + "");
			}
		}else {
			//관리자 로그인 성공 시 
			HttpSession session = request.getSession();
			session.setAttribute("adminKey", id);
			System.out.println("관리자 로그인 성공");
			
			response.getWriter().write(admin_result + "");
			
		}
	}
}
