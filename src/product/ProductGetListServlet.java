package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
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

/**
 * Servlet implementation class ProductGetListServlet
 */
@WebServlet("/product/getproductlist")
public class ProductGetListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=EUC-KR");
		String searchValue = ""; 
		
		JSONArray arrayObj = new JSONArray();
		ProductMgr mgr = new ProductMgr();
	    LocalDate now = LocalDate.now();
		LocalDate dday;
		System.out.println(now);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String type = "flag";
		System.out.println("ÇÁ·¤±× µé¾î¿È" + type);
		Vector<ProductBean> vlist = mgr.getstockdata(type, searchValue);
		for(int i=0; i<vlist.size(); i++){
			ProductBean bean = vlist.get(i);
			JSONObject obj = new JSONObject();
			obj.put("index", i+1);
			obj.put("code", bean.getP_code());
			obj.put("name", bean.getP_name());
			obj.put("enter", bean.getSt_enter_qty());
			obj.put("ava", bean.getSt_ava_qty());
			obj.put("waste", bean.getSt_waste_qty());
			dday = LocalDate.parse(bean.getSt_exp_date());
			System.out.println(dday);
			long ddayResult = ChronoUnit.DAYS.between(now, dday);
		    System.out.println(ddayResult);
		    obj.put("dday", ddayResult);
			obj.put("date", bean.getSt_exp_date());
			arrayObj.add(obj);
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(arrayObj); 
		pw.flush();
		pw.close();
	}
}
