package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ReviewMgr {

	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/webContent/img/review/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;

	public ReviewMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	/* 리뷰 작성 가능한 주문 건 가져오기 */
	public Vector <ReviewBean> getAvaReview(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector <ReviewBean> vlist = new Vector<ReviewBean>();
		
		try {
			con = pool.getConnection();
			sql = 	"SELECT od.o_index, p.p_main_pht_name, p.p_name, o.o_date, o.o_status, p.p_code " + 
					"FROM order_detail_tb od JOIN order_tb o ON od.o_index=o.o_index " + 
					"					     JOIN product_mst_tb p on od.p_code=p.p_code " + 
					"					     LEFT JOIN review_tb r ON od.o_index = r.o_index AND od.p_code = r.p_code " + 
					"WHERE CURDATE()-o.o_date<32 AND o.o_id=? AND r.r_content IS NULL ORDER BY o.o_date;"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReviewBean reBean = new ReviewBean();
				reBean.setO_index(rs.getInt(1));
				reBean.setP_main_pht_name(rs.getString(2));
				reBean.setP_name(rs.getString(3));
				reBean.setO_date(rs.getString(4));
				reBean.setO_status(rs.getString(5));
				reBean.setP_code(rs.getInt(6));
				vlist.addElement(reBean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
}
