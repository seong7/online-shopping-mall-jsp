package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import product.ProductBean;
import product.ProductMgr;

/**
 * Servlet implementation class AdminGetIpSevlet
 */
@WebServlet("/admin/getip")
public class AdminGetIpSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=EUC-KR");
		String searchValue = ""; 
		
		JSONArray arrayObj = new JSONArray();
		AdminMgr mgr = new AdminMgr();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Vector<IpBean> vlist = mgr.getipdata();
		for(int i=0; i<vlist.size(); i++){
			IpBean bean = vlist.get(i);
			JSONObject obj = new JSONObject();
			obj.put("index", bean.getC_index());
			obj.put("id", bean.getC_id());
			obj.put("time", bean.getC_time());
			obj.put("ip", bean.getC_ip());
			arrayObj.add(obj);
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(arrayObj); 
		pw.flush();
		pw.close();
	}

}
