package Member;

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

import Order.AdminOrderBean;
import Order.OrderBean;
import Order.OrderMgr;

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
		objectbuffer.put("zipcode", userDetail.getZipcode());
		objectbuffer.put("joindate", userDetail.getJoin_date());
		objectbuffer.put("point", userDetail.getPoint());
		jsonarray.add(objectbuffer); //ȸ������ data in (json array[0])
		
		Vector<AdminOrderBean> alist = ordermgr.getAdminOrder(member_id);
		
		
		for(int z=0; z<alist.size(); z++) {
			JSONObject objectbuffer2 = new JSONObject();
			AdminOrderBean bean = alist.get(z);
			objectbuffer2.put("index", z+1);													//��ȣ
			objectbuffer2.put("o_del_date", bean.getO_del_date());				//�ֹ��Ͻ�
			objectbuffer2.put("o_index", bean.getO_index());							//�ֹ���ȣ
			objectbuffer2.put("p_name", bean.getP_name()+ "�� " + bean.getProduct_count() +"��");		//��ǰ ��
			objectbuffer2.put("o_total_amount", bean.getO_total_amount());																									//�ֹ��ݾ�
			objectbuffer2.put("o_status", bean.getO_status());						//�ֹ�����
			objectbuffer2.put("return_state", bean.getRt_qty());//��ǰ����
			jsonarray.add(objectbuffer2);
		}
		
		pw.println(jsonarray);
		pw.flush();
		pw.close();
	}

}
