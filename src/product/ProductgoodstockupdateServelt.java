package product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.StockMgr;
import order.CartMgr;

/**
 * Servlet implementation class ProductgoodstockupdateServelt
 */
@WebServlet("/product/stockmodalupdate")
public class ProductgoodstockupdateServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		int code = Integer.parseInt(request.getParameter("code"));
		int ava = Integer.parseInt(request.getParameter("ava"));
		int enter = Integer.parseInt(request.getParameter("enter"));
		int waste = Integer.parseInt(request.getParameter("waste"));
		String date = request.getParameter("date");
		
		int result = new StockMgr().setstockqtydate(code, enter, ava, waste, date);
		
		response.getWriter().write(result + "");
	}

}
