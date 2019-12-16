package Admin;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {
	
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/webContent/img/product/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//insertProduct
		public boolean insertProduct(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			//String sql2 = null;
			String sql3 = null;
			boolean flag = false;
			try {
				MultipartRequest multi = 
						new MultipartRequest(req,UPLOAD,MAXSIZE,ENCTYPE,
								new DefaultFileRenamePolicy());
				String upFile1 = multi.getFilesystemName("upFile1");
				String upFile2 = multi.getFilesystemName("upFile2");
				String upFile3 = multi.getFilesystemName("upFile3");
				File f1 = multi.getFile("upFile1");
				File f2 = multi.getFile("upFile2");
				File f3 = multi.getFile("upFile3");					
				
				con = pool.getConnection();
				sql = "insert product_mst_tb(p_code, p_name, p_price, p_on_sale, p_date, "
						+ "p_main_pht_name, p_main_pht_size, p_detail_pht_name, p_detail_pht_size, "
						+ "p_info_pht_name, p_info_pht_size)values(?,?,?,?,now(),?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(multi.getParameter("p_code")));
				pstmt.setString(2, multi.getParameter("p_name"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("p_price")));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("p_on_sale")));				
				
				if(multi.getFilesystemName("upFile1")!=null) {
					int size1 = (int)f1.length();
					pstmt.setString(5, upFile1);
					pstmt.setInt(6, size1);
				}else {
					pstmt.setString(5, "ready.gif");
					pstmt.setInt(6, 0);
				}
				if(multi.getFilesystemName("upFile2")!=null) {
					int size2 = (int)f2.length();
					pstmt.setString(7, upFile2);
					pstmt.setInt(8, size2);
				}else {
					pstmt.setString(7, "ready.gif");
					pstmt.setInt(8, 0);
				}
				if(multi.getFilesystemName("upFile3")!=null) {
					int size3 = (int)f3.length();
					pstmt.setString(9, upFile1);
					pstmt.setInt(10, size3);
				}else {
					pstmt.setString(9, "ready.gif");
					pstmt.setInt(10, 0);
				}							
				int cnt = pstmt.executeUpdate();				
				if(cnt==1) {
					flag = true;
					//유통기한 넣기
					//sql2 = "insert STOCK_TB(p_code, st_exp_date) values(?,?)";
					//pool.freeConnection(con, pstmt);
					//con = pool.getConnection();
					//pstmt= con.prepareStatement(sql2);
					//pstmt.setInt(1, Integer.parseInt(multi.getParameter("p_code")));
					//pstmt.setString(2 , multi.getParameter("st_exp_date"));	
					//pstmt.executeUpdate();
					
					//원재료 넣기
					sql3 = "insert RM_PCT_TB(p_code, rm_code, rm_percentage) values(?,?,?)";
					pool.freeConnection(con, pstmt);
					con = pool.getConnection();
					pstmt= con.prepareStatement(sql3);
					pstmt.setInt(1, Integer.parseInt(multi.getParameter("p_code")));
					pstmt.setInt(2, Integer.parseInt(multi.getParameter("rm_code1")));
					pstmt.setInt(3, Integer.parseInt(multi.getParameter("rm_percentage1")));					
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
}
