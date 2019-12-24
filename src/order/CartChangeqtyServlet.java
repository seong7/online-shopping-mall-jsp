package order;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberMgr;

/**
 * Servlet implementation class CartChangeqtyServlet
 */
@WebServlet("/order/qtychange")
public class CartChangeqtyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String[] p_temp = request.getParameterValues("p_code[]");
		String[] c_temp = request.getParameterValues("c_qty[]");
		int[] p_code = Arrays.asList(p_temp).stream().mapToInt(Integer::parseInt).toArray();
		int[] c_qty = Arrays.asList(c_temp).stream().mapToInt(Integer::parseInt).toArray();
		String id = request.getParameter("id");
		CartMgr mgr = new CartMgr();
		mgr.updateCart(c_qty, p_code, id);
		response.getWriter().write("수정 완료");
			
	}
}
