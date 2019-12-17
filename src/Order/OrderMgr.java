package Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;




public class OrderMgr {
	
	private DBConnectionMgr pool;
	
	public OrderMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//***User 기능설계***
	//insert 
	public void insertOrder(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert order_tb(o_id,o_recpt_name,"
					+ "o_recpt_contact,o_recpt_zipcode,o_recpt_add,"
					+ "o_recpt_add_det,o_del_msg,o_date,"
					+ "o_prod_amount,o_del_fee,o_total_amount,"
					+ "o_pay_method,o_mgr_note,o_status, o_del_num,"
					+ "o_del_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, order.getO_id());
				pstmt.setString(2, order.getO_recpt_name());
				pstmt.setString(3, order.getO_recpt_contact());
				pstmt.setString(4, order.getO_recpt_zipcode());
				pstmt.setString(5, order.getO_recpt_add());
				pstmt.setString(6, order.getO_recpt_add_det());
				pstmt.setString(7, order.getO_del_msg());
				pstmt.setString(8, order.getO_date());
				pstmt.setInt(9, order.getO_prod_amount());
				pstmt.setInt(10, order.getO_del_fee());
				pstmt.setInt(11, order.getO_total_amount());
				pstmt.setString(12, order.getO_pay_method());
				pstmt.setString(13, order.getO_mgr_note());
				pstmt.setString(14, order.getO_status());
				pstmt.setString(15, order.getO_del_num());//송장번호
				pstmt.setString(16, order.getO_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	//Order list 
	public Vector<OrderBean> getOrder(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from order_tb where o_id=? "
					+ "order by o_index DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setO_index(rs.getInt(1));
				order.setO_id(rs.getString(2));
				order.setO_recpt_name(rs.getString(3));
				order.setO_recpt_contact(rs.getString(4));
				order.setO_recpt_zipcode(rs.getString(5));
				order.setO_recpt_add(rs.getString(6));
				order.setO_recpt_add_det(rs.getString(7));
				order.setO_del_msg(rs.getString(8));
				order.setO_date(rs.getString(9));
				order.setO_date(rs.getString(9));
				order.setO_prod_amount(rs.getInt(10));
				order.setO_del_fee(rs.getInt(11));
				order.setO_total_amount(rs.getInt(12));
				order.setO_pay_method(rs.getString(13));
				order.setO_mgr_note(rs.getString(14));
				order.setO_status(rs.getString(15));
				order.setO_del_num(rs.getString(16));
				order.setO_del_date(rs.getString(17));
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Order code, 수량 확인 
	public Vector<OrderDetailBean> getOrderCode(int o_index) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderDetailBean> vlist = new Vector<OrderDetailBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT p_code,o_qty from order_detail_tb "
					+ "WHERE o_index = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_index);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderDetailBean order = new OrderDetailBean();
				order.setP_code(rs.getInt(1));
				order.setO_qty(rs.getInt(2));
				vlist.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	

	//***Admin 기능설계***
	//All List
	//Order detail 
	//Order update
	//Order delete
	public OrderBean getOrderDetail(int O_index) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		OrderBean order = new OrderBean();
		try {
			con = pool.getConnection();
			sql = "";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return order;
	}
	//Refund insert
	//Refund update
	//Refund delete 
	
	
}