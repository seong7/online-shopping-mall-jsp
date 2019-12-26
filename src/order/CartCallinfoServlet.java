package order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class CartCallinfoServlet
 */
@WebServlet("/order/call_cart")
public class CartCallinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		 

		String data = request.getParameter("data");
		JSONParser parser = new JSONParser();
		JSONArray arr = null;
		try {
		     arr = (JSONArray)parser.parse(data);
		} catch (ParseException e) {
		     System.out.println("변환에 실패");
		     e.printStackTrace();
		}
		 
//		 
//		System.out.println(arr);
//		System.out.println(arr.get(0));
//		System.out.println(arr.get(1));
//		System.out.println(arr.size());
//		

		JSONArray jsonarray = new JSONArray();
		PrintWriter pw = response.getWriter();
		int code;
		String id;
		CartBean bean; 
		CartMgr mgr = new CartMgr();
		for(int i=0; i<arr.size();i++) {
			JSONObject obj = (JSONObject) arr.get(i);
			code = Integer.parseInt((String) obj.get("code"));
			id = (String) obj.get("id");
			bean =  mgr.getCartOneOrder(id, code);
			JSONObject objectbuffer = new JSONObject();
			objectbuffer.put("code",bean.getP_code());
			objectbuffer.put("qty",bean.getC_qty());
			jsonarray.add(objectbuffer);
		}
		pw.println(jsonarray);
		pw.flush();
		pw.close();
	}

}
