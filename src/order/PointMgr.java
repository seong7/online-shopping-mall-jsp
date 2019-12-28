package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class PointMgr {
	
	private DBConnectionMgr pool;

	public PointMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//����Ʈ ���� ��ü ��������
	public Vector<PointBean> getPointList(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<PointBean> vlist = new Vector<PointBean>();
		try {
			con = pool.getConnection();
			sql = "select * from point_tb where id=? "
					+ "order by pt_index DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PointBean point = new PointBean();
				point.setPt_index(rs.getInt(1));
				point.setId(rs.getString(2));
				point.setO_index(rs.getInt(3));
				point.setPt_detail(rs.getString(4));
				point.setPt_date(rs.getString(5));
				point.setPt_point(rs.getInt(6));
				point.setPt_category(rs.getString(7));
				vlist.addElement(point);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//���� ����Ʈ �������� 
	public int getPoint(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int point=0;
		try {
			con = pool.getConnection();
			sql = "select sum(pt_point) from point_tb where id=? "
					+ "order by pt_index DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				point = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return point;
	}
	
	//����Ʈ �����ϱ� 
	public void insertPoint(PointBean point) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			//o_ index�� ����
			con = pool.getConnection();
			sql = "select max(o_index) from order_tb";//���� ���� o_index�� 
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			int ref = 0;
			if(rs.next())
				ref = rs.getInt(1);
			pstmt.close();
			rs.close();
		////////////////////////////////////////////////////////////////
			sql = "INSERT point_tb(id, o_index, pt_detail, pt_date, "
					+ "pt_point, pt_category) VALUES (?, ?, ?,NOW(),?,?)";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, point.getId());
				pstmt.setInt(2, ref);
				pstmt.setString(3, point.getPt_detail());
				pstmt.setInt(4, point.getPt_point());
				pstmt.setString(5, point.getPt_category());
				pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
