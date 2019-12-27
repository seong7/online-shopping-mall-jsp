package member;

import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberloginServlet2
 */
@WebServlet("/member/login")
public class MemberloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected String getRemoteAddr(HttpServletRequest request){
	    return (null != request.getHeader("X-FORWARDED-FOR")) ? request.getHeader("X-FORWARDED-FOR") : request.getRemoteAddr();
	}
	private String getLocalServerIp()
	{
		try
		{
		    for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();)
		    {
		        NetworkInterface intf = en.nextElement();
		        for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();)
		        {
		            InetAddress inetAddress = enumIpAddr.nextElement();
		            if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress() && inetAddress.isSiteLocalAddress())
		            {
		            	return inetAddress.getHostAddress().toString();
		            }
		        }
		    }
		}
		catch (SocketException ex) {}
		return null;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("login_id");
		String pwd = request.getParameter("login_pwd");
		String ip = getLocalServerIp();
		MemberMgr mgr = new MemberMgr();
		int admin_result = mgr.adminlogin(id, pwd);
		if(admin_result==0) {
		int result = mgr.login(id, pwd);
		if(result==0) {
				System.out.println("로그인 실패");
			}else {
				HttpSession session = request.getSession();
			    session.setAttribute("idKey",id);
				System.out.println("로그인 성공 " +id);
				System.out.println("로그인 성공 " +pwd);
				SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String nowdate =  formatter.format(new Date());
				int connection = new MemberMgr().loginconnectiondata(id, nowdate, ip);
				response.getWriter().write(result + "");
			}
		}else {
			//관리자 로그인 성공 시 
			HttpSession session = request.getSession();
			session.setAttribute("adminKey", id);
			System.out.println("관리자 로그인 성공");
			
			response.getWriter().write(admin_result + "");
			
		}
	}
}
