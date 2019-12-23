package member;

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

import order.AdminOrderBean;
import order.OrderBean;
import order.OrderMgr;
import product.ProductBean;
import product.ProductMgr;

/**
 * Servlet implementation class MemberViewMemberDetail
 */
@WebServlet("/member/memberdetail")
public class MemberViewMemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("member_id");
		MemberMgr membermgr = new MemberMgr();
		OrderMgr ordermgr  = new OrderMgr();
		ProductMgr productmgr = new ProductMgr();
		MemberBean userDetail = membermgr.getMemberDetail(member_id);
		
		JSONArray jsonarray = new JSONArray();
		PrintWriter pw = response.getWriter();
		JSONObject objectbuffer = new JSONObject();
		
		objectbuffer.put("id", userDetail.getId());
		objectbuffer.put("name", userDetail.getNAME());
		objectbuffer.put("birthday", userDetail.getBirthday());
		objectbuffer.put("email", userDetail.getEmail());
		objectbuffer.put("contact", userDetail.getContact());
		objectbuffer.put("address", userDetail.getAddress());
		objectbuffer.put("address_detail", userDetail.getAddress_detail());
		objectbuffer.put("joindate", userDetail.getJoin_date());
		objectbuffer.put("point", userDetail.getPoint());
		jsonarray.add(objectbuffer); //회원정보 data in (json array[0])
		
		Vector<AdminOrderBean> alist = ordermgr.getAdminOrder(member_id);
		
		
		for(int z=0; z<alist.size(); z++) {
			JSONObject objectbuffer2 = new JSONObject();
			AdminOrderBean bean = alist.get(z);
			objectbuffer2.put("index", z+1);													//번호
			objectbuffer2.put("o_del_date", bean.getO_del_date());				//주문일시
			objectbuffer2.put("o_index", bean.getO_index());							//주문번호
			objectbuffer2.put("p_name", bean.getP_name()+ "외 " + bean.getProduct_count() +"건");		//제품 명
			objectbuffer2.put("o_total_amount", bean.getO_total_amount());																									//주문금액
			objectbuffer2.put("o_status", bean.getO_status());						//주문상태
			objectbuffer2.put("return_state", bean.getRt_qty());//반품여부
			jsonarray.add(objectbuffer2);
		}
		
		pw.println(jsonarray);
		pw.flush();
		pw.close();
	}

}
