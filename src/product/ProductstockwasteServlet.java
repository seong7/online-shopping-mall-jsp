package product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductstockwasteServlet
 */
@WebServlet("/product/stockwaste")
public class ProductstockwasteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String[] codes = request.getParameterValues("code[]");
		String[] dates = request.getParameterValues("date[]");
		String[] enters = request.getParameterValues("enter[]");
		System.out.println("이름:"+codes); 
		System.out.println("코드:"+dates); 
		System.out.println("수량:"+enters); 
		System.out.println(codes[0]);
	}

}
