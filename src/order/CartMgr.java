	package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class CartMgr {
	//id, ����, �ڵ� �������� 
	private DBConnectionMgr pool;
	
	public CartMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//Cart Insert(
	
	//id, ����, �ڵ� �������� 
	public Vector<CartBean> getCart(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CartBean> vlist = new Vector<CartBean>();
		try {
			con = pool.getConnection();
			sql = "select * from cart_tb where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartBean cart = new CartBean();
				cart.setId(rs.getString(1));
				cart.setP_code(rs.getInt(2));
				cart.setC_qty(rs.getInt(3));
				vlist.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//īƮ ����
	public void deleteCart(String id, int p_code[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			for (int i = 0; i < p_code.length; i++) {
				con = pool.getConnection();
				sql = "DELETE from cart_tb WHERE id=? and p_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, p_code[i]);
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	
}
