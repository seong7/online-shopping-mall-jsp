package Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ProductMgr {
	
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/WebContent/productdata/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product Detail
		public ProductBean getProduct(int p_code) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			ProductBean bean = new ProductBean();
			try {
				con = pool.getConnection();
				sql = "select * from product_mst_tb where p_code=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, p_code);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setP_code(rs.getInt(1));
					bean.setP_name(rs.getString(2));
					bean.setP_price(rs.getInt(3));
					bean.setP_main_pht_name(rs.getString(4));
					bean.setP_main_pht_size(rs.getInt(5));
					bean.setP_detail_pht_name(rs.getString(6));
					bean.setP_detail_pht_size(rs.getInt(7));
					bean.setP_info_pht_name(rs.getString(8));
					bean.setP_info_pht_size(rs.getInt(9));
					bean.setP_date(rs.getString(10));
					bean.setP_on_sale(rs.getInt(11));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		

	//alllist
	//bestlist
	//reviewlist
	//priceuplist
	//pricedownlist
	//searchlist
	//

}
