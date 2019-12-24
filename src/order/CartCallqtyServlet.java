package order;

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

@WebServlet("/order/qtycall")
public class CartCallqtyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		CartMgr mgr = new CartMgr();
		Vector<CartBean> result = mgr.getCart(id);

		JSONArray jsonarray = new JSONArray();
		PrintWriter pw = response.getWriter();
		
		for(int i=0; i<result.size(); i++) {
			JSONObject objectbuffer = new JSONObject();
			CartBean bean = result.get(i);
			objectbuffer.put("p_code",bean.getP_code());
			objectbuffer.put("c_qty",bean.getC_qty());
			jsonarray.add(objectbuffer);
		}

		
		pw.println(jsonarray);
		pw.flush();
		pw.close();
			
	}
}
