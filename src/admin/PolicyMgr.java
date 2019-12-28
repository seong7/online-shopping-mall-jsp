package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import order.OrderBean;

public class PolicyMgr {
	private DBConnectionMgr pool;
	
	public PolicyMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public double getRate() { //포인트율 가져오기 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		double point = 0;
		try {
			con = pool.getConnection();
			sql = "select * from policy_tb";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				point = rs.getInt(2)*0.01;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return point;
	}

}
