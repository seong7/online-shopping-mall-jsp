package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StockMgr {
	

		private DBConnectionMgr pool;
		
		public StockMgr() {
			pool = DBConnectionMgr.getInstance();
		}
		
		//insert 
		public void insertStock(StockBean bean) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert stock_tb(p_code, st_exp_date, st_enter_qty, st_ava_qty, st_waste_qty) "
					+ "VALUES (?,?,?,0,0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bean.getP_code());
				pstmt.setString(2, bean.getSt_exp_date());
				pstmt.setInt(3, bean.getSt_enter_qty());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
}
