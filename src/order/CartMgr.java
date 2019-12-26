	package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class CartMgr {
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
	//카트 추가(제품 상세페이지->카트)
	public boolean addCart(String id, int p_code, int c_qty){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "SELECT p_code FROM cart_tb WHERE id=? "
					+ "AND p_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, p_code);
			rs= pstmt.executeQuery();
			int cnt = 0;
			if(rs.next()) {//해당아이디에 해당제품이 존재할때 (수량만 추가)
				pstmt.close();
				sql = "UPDATE cart_tb SET c_qty=c_qty+?  WHERE id =? "
						+ "AND p_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, c_qty);
				pstmt.setString(2, id);
				pstmt.setInt(3, p_code);
				cnt = pstmt.executeUpdate();
			}else {//해당아이디에 해당제품 없을 때(신규추가)
				pstmt.close();
				sql = "insert cart_tb(id, p_code, c_qty) VALUES (?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, p_code);
				pstmt.setInt(3, c_qty);
				cnt = pstmt.executeUpdate();
			}
			if(cnt==1)
				flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
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
						con = pool.getConnection();
						for (int i = 0; i < p_code.length; i++) {
						sql = "update cart_tb set c_qty=? WHERE id=? and p_code=?;";
						pstmt = con.prepareStatement(sql);
						System.out.println("검증시작");
						System.out.println("qty는" + c_qty[i]);
						System.out.println("id는" + id);
						System.out.println("pcode는" + p_code[i]);
						pstmt.setInt(1, c_qty[i]);
						pstmt.setString(2, id);
						pstmt.setInt(3, p_code[i]);
						pstmt.executeUpdate();

						}
						System.out.println("검증끝");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
		}
	
	public CartBean getCartOneOrder(String id, int code) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		CartBean clist = new CartBean();
		try {
			con = pool.getConnection();
			System.out.println(id);
			System.out.println(code);
			sql = "select * from cart_tb where id=? and p_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				clist.setId(rs.getString(1));
				clist.setP_code(rs.getInt(2));
				clist.setC_qty(rs.getInt(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return clist;
	}
		
}
