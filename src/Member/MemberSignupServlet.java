package Member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class MemberSignupServlet
 */
@WebServlet("/MemberSignupServlet")
public class MemberSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		

		HttpSession session = request.getSession();
		Object obj =session.getAttribute("idKey");
		if(obj==null) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		String id = request.getParameter("signup_id_input");
		String pwd = request.getParameter("signup_pwd_check");
		String NAME = request.getParameter("signup_name");
		String birthday = request.getParameter("signup_birth");
		String email = request.getParameter("signup_email");
		String contact = request.getParameter("signup_phone");
		String zipcode = request.getParameter("address_section_zipcode");
		String address = request.getParameter("signup_addr");
		String address_detail = request.getParameter("signup_addr_detail");
		
		String join_date = format.format(cal.getTime());
		MemberBean bean = new MemberBean();
		bean.setId(id);
		bean.setPwd(pwd);
		bean.setNAME(NAME);
		bean.setBirthday(birthday);
		bean.setEmail(email);
		bean.setContact(contact);
		bean.setZipcode(Integer.parseInt(zipcode));
		bean.setAddress(address);
		bean.setAddress_detail(address_detail);
		bean.setJoin_date(join_date);
		MemberMgr mgr = new MemberMgr();
		int result = mgr.signup_user(bean);
		if(result == 1) {
				session.setAttribute("idKey", bean.getId());
				System.out.println("세션에 id를 저장하였습니다(idKey : "+bean.getId()+")");
				response.getWriter().write(result+ "");
			}
		}
		else {
			session.invalidate();
			response.sendRedirect("http://localhost/online-shopping-mall/top.jsp");
		}
	}
}
