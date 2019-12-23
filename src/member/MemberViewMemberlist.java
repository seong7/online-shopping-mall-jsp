package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class MemberViewMemberlit
 */
@WebServlet("/member/memberlist")
public class MemberViewMemberlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("select_type");
		String value = request.getParameter("select_value");
		System.out.println("서블릿단 : " +value);
		if(type.equals("ID")) {
			type ="id";
			}
		else if (type.equals("이름")) {
			type="NAME";
		}
		else {
			type="email";
		}
		MemberMgr mgr = new MemberMgr();
		Vector<MemberBean> vlist = mgr.getMemberList(type, value);
		JSONArray jsonarray = new JSONArray();
		PrintWriter pw = response.getWriter();

		for(int i=0; i<vlist.size();i++) {
			JSONObject objectbuffer = new JSONObject();
			MemberBean bean = vlist.get(i);
			objectbuffer.put("id", bean.getId());
			objectbuffer.put("name", bean.getNAME());
			objectbuffer.put("birthday", bean.getBirthday());
			objectbuffer.put("email", bean.getEmail());
			objectbuffer.put("contact", bean.getContact());
			objectbuffer.put("address", bean.getAddress() +" "+ bean.getAddress_detail());
			objectbuffer.put("joindate", bean.getJoin_date());
			jsonarray.add(objectbuffer);
		}
		
		pw.println(jsonarray);
		pw.flush();
		pw.close();
	}

}
