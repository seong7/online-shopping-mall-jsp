package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.DBConnectionMgr;

public class AdminMgr {

	private DBConnectionMgr pool;

	public AdminMgr() {
		pool = DBConnectionMgr.getInstance(); 
	
	}
	//Board Total Count(�� �Խù� ����)
		public int getTotalCount(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("")||keyWord==null) {
					//�˻��� �ƴѰ��
					sql = "select count(*) from tblBoard";
					pstmt = con.prepareStatement(sql);
				}else{
					//�˻��� ���
					sql = "select count(*) from tblBoard where " + keyField +" like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
				}
				rs = pstmt.executeQuery();
				if(rs.next())
					totalCount = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return totalCount;
		}
		
}
