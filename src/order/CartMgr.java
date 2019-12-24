	package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class CartMgr {
	//id, 수량, 코드 가져오기 
	private DBConnectionMgr pool;
	
	public CartMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//id, 수량, 코드 가져오기 
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
	
	//카트 삭제
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
	
	//qty업데이트(cart에서 페이지 이동 시 호출)
	public void updateCart(int  c_qty[], int p_code[], String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				for (int i = 0; i < p_code.length; i++) {
					con = pool.getConnection();
					sql = "update cart_tb set c_qty=? WHERE id=? and p_code=?;";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, c_qty[i]);
					pstmt.setString(2, id);
					pstmt.setInt(3, p_code[i]);
					pstmt.executeUpdate();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
}
