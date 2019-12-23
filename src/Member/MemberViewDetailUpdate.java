package Member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberViewDetailUpdate
 */
@WebServlet("/member/memberdetailupdate")
public class MemberViewDetailUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("member_id");
		String member_birthday = request.getParameter("member_birthday");
		String member_joindate = request.getParameter("member_joindate");
		String member_contact = request.getParameter("member_contact");
		String member_email = request.getParameter("member_email");
		String member_zipcode = request.getParameter("member_zipcode");
		String member_address = request.getParameter("member_address");
		String member_address_detail = request.getParameter("member_address_detail");
		
		MemberBean bean = new MemberBean();
		
		bean.setId(member_id);
		bean.setBirthday(member_birthday);
		bean.setJoin_date(member_joindate);
		bean.setContact(member_contact);
		bean.setEmail(member_email);
		bean.setZipcode(Integer.parseInt(member_zipcode));
		bean.setAddress(member_address);
		bean.setAddress_detail(member_address_detail);
		
		response.getWriter().write(new MemberMgr().updateMemberAdmin(bean)+ "");
	}

}
