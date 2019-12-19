package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberViewMemberlit
 */
@WebServlet("/member/memberlist")
public class MemberViewMemberlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		
		String select_type = request.getParameter("select_type");
		String select_value = request.getParameter("select_value");
		if(select_type.equals("ID")) {
			select_type ="id";
			}
		else if (select_type.equals("¿Ã∏ß")) {
			select_type="NAME";
		}
		else {
			select_type="email";
		}
		System.out.println("select_type : " + select_type);
		System.out.println("select_value : " + select_value);
		response.getWriter().write("1");
		
	}

}
