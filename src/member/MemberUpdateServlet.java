package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String newPassword = request.getParameter("newPassword");
		String checkPassword = request.getParameter("checkPassword");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String addr_detail = request.getParameter("addr_detail");
		
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(newPassword);
		System.out.println(checkPassword);
		System.out.println(name);
		System.out.println(birthday);
		System.out.println(email);
		System.out.println(contact);
		System.out.println(zipcode);
		System.out.println(address);
		System.out.println(addr_detail);

		response.setContentType("text/html;charset=UTF-8");
		response.sendRedirect("http://localhost:8081/online-shopping-mall/index.jsp");
		
	}

}
