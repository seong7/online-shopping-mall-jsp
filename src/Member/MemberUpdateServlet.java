package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession key = request.getSession();
		String id = (String) key.getAttribute("id");
		try {
            // 3.1 drvier 설정
            Class.forName("com.mysql.jdbc.Driver");
 
            // 3.2 DB 접속 (localhost 서버명 , ds20170412 데이터베이스명, root 아이디, class604
            // 암호)
            //Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.01", "root",
              //      "1234");
 
            // 3.3 SQL 작성.
            String sql = "SELECT * FROM `member1` WHERE mem_id=? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
 
            // 3.4 DB에 SQL 수행
            ResultSet rs = pstmt.executeQuery();
 
            // 3.5 rs에 값이 있느냐?
            if (rs.next()) { // 값이 있다.
                request.setAttribute("a", rs.getString("mem_id"));
                request.setAttribute("b", rs.getString("mem_name"));
                request.setAttribute("c", rs.getInt("mem_age"));
                request.setAttribute("d", rs.getString("mem_phone"));
            }
 
            request.setAttribute("title", "회원정보수정");
 
            request.getRequestDispatcher("/WEB-INF/memberedit1.jsp").forward(request, response);
 
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
 
	}