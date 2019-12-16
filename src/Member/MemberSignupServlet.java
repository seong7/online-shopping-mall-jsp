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

/**
 * Servlet implementation class MemberSignupServlet
 */
@WebServlet("/MemberSignupServlet")
public class MemberSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
//		if ("POST".equalsIgnoreCase(request.getMethod())) 
//		{
//		  String test = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
//		  System.out.println(test);
//		}

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
		

		System.out.println(id);
		System.out.println(pwd);
		System.out.println(NAME);
		System.out.println(birthday);
		System.out.println(email);
		System.out.println(contact);
		System.out.println(zipcode);
		System.out.println(address);
		System.out.println(address_detail);
		
		
		String join_date = format.format(cal.getTime());;
		UserBean bean = new UserBean();
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
		response.getWriter().write(new MemberMgr().signup_user(bean)+ "");
		
	}

}
