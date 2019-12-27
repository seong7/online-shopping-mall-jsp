package product;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.StockMgr;

/**
 * Servlet implementation class ProductstockwasteServlet
 */
@WebServlet("/product/stockwaste")
public class ProductstockwasteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String[] codes_temp = request.getParameterValues("code[]");
		String[] date = request.getParameterValues("date[]");
		String[] enters_temp = request.getParameterValues("enter[]");
		int[] code = Arrays.asList(codes_temp).stream().mapToInt(Integer::parseInt).toArray();
		int[] enter = Arrays.asList(enters_temp).stream().mapToInt(Integer::parseInt).toArray();
		StockMgr mgr = new StockMgr();
		mgr.waste(date, code, enter);
		response.getWriter().write("수정 완료");
	}

}
