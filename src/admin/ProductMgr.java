package admin;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.ProductBean;

public class ProductMgr {

	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/webContent/img/product/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10 * 1024 * 1024;

	public ProductMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	// insert Product
	public boolean insertProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		// String sql2 = null;
		String sql3 = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			String upFile1 = multi.getFilesystemName("upFile1");
			String upFile2 = multi.getFilesystemName("upFile2");
			String upFile3 = multi.getFilesystemName("upFile3");
			File f1 = multi.getFile("upFile1");
			File f2 = multi.getFile("upFile2");
			File f3 = multi.getFile("upFile3");

			con = pool.getConnection();
			sql = "insert product_mst_tb(p_name, p_price, p_on_sale, p_date, "
					+ "p_main_pht_name, p_main_pht_size, p_detail_pht_name, p_detail_pht_size, "
					+ "p_info_pht_name, p_info_pht_size)values(?,?,?,now(),?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("p_name"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("p_price")));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("p_on_sale")));

			if (multi.getFilesystemName("upFile1") != null) {
				int size1 = (int) f1.length();
				pstmt.setString(4, upFile1);
				pstmt.setInt(5, size1);
			} else {
				pstmt.setString(4, "ready.gif");
				pstmt.setInt(5, 0);
			}
			if (multi.getFilesystemName("upFile2") != null) {
				int size2 = (int) f2.length();
				pstmt.setString(6, upFile2);
				pstmt.setInt(7, size2);
			} else {
				pstmt.setString(6, "ready.gif");
				pstmt.setInt(7, 0);
			}
			if (multi.getFilesystemName("upFile3") != null) {
				int size3 = (int) f3.length();
				pstmt.setString(8, upFile3);
				pstmt.setInt(9, size3);
			} else {
				pstmt.setString(8, "ready.gif");
				pstmt.setInt(9, 0);
			}
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				flag = true;
				// 유통기한 넣기
				// sql2 = "insert STOCK_TB(p_code, st_exp_date) values(?,?)";
				// pool.freeConnection(con, pstmt);
				// con = pool.getConnection();
				// pstmt= con.prepareStatement(sql2);
				// pstmt.setInt(1, Integer.parseInt(multi.getParameter("p_code")));
				// pstmt.setString(2 , multi.getParameter("st_exp_date"));
				// pstmt.executeUpdate();


				// 원재료 넣기

//				sql3 = "insert RM_PCT_TB(p_code, rm_code, rm_percentage) values(?,?,?)";
//				pool.freeConnection(con, pstmt);
//				con = pool.getConnection();
//				pstmt = con.prepareStatement(sql3);
//				pstmt.setInt(1, Integer.parseInt(multi.getParameter("p_code")));
//				pstmt.setInt(2, Integer.parseInt(multi.getParameter("rm_code1")));
//				pstmt.setInt(3, Integer.parseInt(multi.getParameter("rm_percentage1")));
//				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// update product
	public boolean updateProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;			
		try {
			MultipartRequest multi = new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			String upFile1 = multi.getFilesystemName("upFile1");
			String upFile2 = multi.getFilesystemName("upFile2");
			String upFile3 = multi.getFilesystemName("upFile3");
			File f1 = multi.getFile("upFile1");
			File f2 = multi.getFile("upFile2");
			File f3 = multi.getFile("upFile3");
			int p_code = Integer.parseInt(multi.getParameter("pcode"));
			product.ProductMgr mgr = new product.ProductMgr();
			ProductBean bean = mgr.getProduct(p_code);
			String fa = bean.getP_main_pht_name();
			String fb = bean.getP_detail_pht_name();
			String fc = bean.getP_info_pht_name();
			int faa = bean.getP_main_pht_size();
			int fbb = bean.getP_detail_pht_size();
			int fcc = bean.getP_info_pht_size();
			con = pool.getConnection();
			sql = "update product_mst_tb set p_name=?, p_price=?, p_on_sale=?, "
					+ "p_main_pht_name=?, p_main_pht_size=?, p_detail_pht_name=?, p_detail_pht_size=?, "
					+ "p_info_pht_name=?, p_info_pht_size=? where p_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("p_name"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("p_price")));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("p_on_sale")));

			if (multi.getFilesystemName("upFile1") != null) {
				//YES upload file, DELETE uploaded file
				int size1 = (int) f1.length();					
				pstmt.setString(4, upFile1);
				pstmt.setInt(5, size1);						
				//delete code
				File fd1 = new File(UPLOAD + fa);
				if (fd1.exists() && !fa.equals("ready.gif")) {
					fd1.delete();}					
			} else if(!fa.isEmpty() && !fa.equals("ready.gif") && multi.getFilesystemName("upFile1")==null ){
				//NO upload file, YES uploaded file, will nothing happen	
				pstmt.setString(4, fa);
				pstmt.setInt(5, faa);
			} else if(multi.getFilesystemName("upFile1")==null && fa.equals("ready.gif"))
				pstmt.setString(4, fa);
				pstmt.setInt(5, faa);
			
			if (multi.getFilesystemName("upFile2")!= null) {
				int size2 = (int) f2.length();					
				pstmt.setString(6, upFile2);
				pstmt.setInt(7, size2);				
				//delete code
				File fd2 = new File(UPLOAD + fb);
				if (fd2.exists()&& !fb.equals("ready.gif")) {
					fd2.delete();}		
			} else if(!fb.isEmpty() && !fb.equals("ready.gif") && multi.getFilesystemName("upFile2")==null ){
				//NO upload file, YES uploaded file, will nothing happen
				pstmt.setString(6, fb);
				pstmt.setInt(7, fbb);
			}else if(multi.getFilesystemName("upFile2")==null && fb.equals("ready.gif"))
				pstmt.setString(6, fb);
				pstmt.setInt(7, fbb);
				
			if (multi.getFilesystemName("upFile3")!= null) {
				int size3 = (int) f3.length();					
				pstmt.setString(8, upFile3);
				pstmt.setInt(9, size3);				
				//delete code
				File fd3 = new File(UPLOAD + fc);
				if (fd3.exists()&& !fc.equals("ready.gif")) {
					fd3.delete();}		
			} else if(!fc.isEmpty() && !fc.equals("ready.gif") && multi.getFilesystemName("upFile3")==null ){					
				//NO upload file, YES uploaded file, will nothing happen
				pstmt.setString(8, fc);
				pstmt.setInt(9, fcc);
			} else if(multi.getFilesystemName("upFile3")==null && fc.equals("ready.gif"))
				pstmt.setString(8, fc);
				pstmt.setInt(9, fcc);				
			
			pstmt.setInt(10, Integer.parseInt(multi.getParameter("p_code")));
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}	

	// delete Product(more than 1)
	public boolean deleteproduct(int p_code[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			for (int i = 0; i < p_code.length; i++) {
				sql = "select p_main_pht_name, p_detail_pht_name, p_info_pht_name from product_mst_tb where p_code=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, p_code[i]);
				rs = pstmt.executeQuery();
				if (!rs.next())
					continue;
				String p_main_pht_name = rs.getString(1);
				String p_detail_pht_name = rs.getString(2);
				String p_info_pht_name = rs.getString(3);
				if(!p_main_pht_name.equals("ready.gif")) {
				File f1 = new File(UPLOAD + p_main_pht_name);
				if (f1.exists())
					f1.delete();
				}					
				if(!p_detail_pht_name.equals("ready.gif")) {
					File f2 = new File(UPLOAD + p_detail_pht_name);
					if (f2.exists())
						f2.delete();
					}
				if(!p_info_pht_name.equals("ready.gif")) {
					File f3 = new File(UPLOAD + p_info_pht_name);
					if (f3.exists())
						f3.delete();
					}

				pstmt.close();

				sql = "delete from product_mst_tb where p_code =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, p_code[i]);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// delete Product(only 1)
		public boolean deleteproduct1(int p_code) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();				
					sql = "select p_main_pht_name, p_detail_pht_name, p_info_pht_name from product_mst_tb where p_code=? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, p_code);
					rs = pstmt.executeQuery();	
					if (rs.next()) {
					String p_main_pht_name = rs.getString(1);
					String p_detail_pht_name = rs.getString(2);
					String p_info_pht_name = rs.getString(3);
					if(!p_main_pht_name.equals("ready.gif")) {
					File f1 = new File(UPLOAD + p_main_pht_name);
					if (f1.exists())
						f1.delete();
					}					
					if(!p_detail_pht_name.equals("ready.gif")) {
						File f2 = new File(UPLOAD + p_detail_pht_name);
						if (f2.exists())
							f2.delete();
						}
					if(!p_info_pht_name.equals("ready.gif")) {
						File f3 = new File(UPLOAD + p_info_pht_name);
						if (f3.exists())
							f3.delete();
						}				
					pstmt.close();

					sql = "delete from product_mst_tb where p_code =?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, p_code);
					pstmt.executeUpdate();
					}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
		}

	// printing product name
	public Vector<ProductBean> printPname() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> tlist = new Vector<ProductBean>();
		try {
			con = pool.getConnection();
			sql = "select distinct p_name from product_mst_tb";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); 
			while (rs.next()) { 
				String pname = rs.getString("p_name");				
				ProductBean bean = new ProductBean();
				bean.setP_name(pname);				
				tlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return tlist;
	}

	// pNameList
	public String[] readPname() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] list = null;
		try {
			con = pool.getConnection();
			sql = "select count(distinct p_name) from product_mst_tb";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				list = new String[rs.getInt(1)];
			rs.close();
			pstmt.close();
			sql = "select distinct p_name from product_mst_tb";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			for (int i = 0; rs.next(); i++) {
				list[i] = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}	

	// Searching product list by p_name, p_date in (goods_master.jsp)
	public Vector<ProductBean> searchproduct(String p_name, int p_date1, int p_date2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> slist = new Vector<>();
		System.out.println("-----admin--------");
		System.out.println("apname :"+p_name);
		System.out.println("apname :"+p_date1);
		System.out.println("apname :"+p_date2);
		System.out.println("-------------");
		try {
			//String p1 = Integer.toString(p_date1);
			//String p2 = Integer.toString(p_date2);
			con = pool.getConnection();			
			if(p_name.trim().equals("") && p_date1==0 && p_date2==0) {
				sql = "SELECT p.p_code, p.p_name, p.p_price, p.p_date, p.p_on_sale, IfNULL(SUM(s.st_ava_qty),99999) "
						+ "FROM product_mst_tb p left JOIN stock_tb s ON p.p_code = s.p_code GROUP BY p.p_code "
						+ "order BY 1";
				pstmt = con.prepareStatement(sql);
// p_name searching
			}else if(p_name.trim()!=null && p_date1==0 && p_date2==0){
				sql = 	"SELECT p.p_code, p.p_name, p.p_price, p.p_date, p.p_on_sale, SUM(s.st_ava_qty) "
						+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code GROUP BY p.p_code "
						+ "having p_name LIKE ? order by p.p_date desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + p_name + "%");
// p_date searching
			}else if(p_name.trim().equals("") || p_date1!=0 || p_date2!=0 ){
				sql = 	"SELECT p.p_code, p.p_name, p.p_price, p.p_date, p.p_on_sale, SUM(s.st_ava_qty) "
						+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code GROUP BY p.p_code "
						+ "having p_date BETWEEN ? AND ? order by p.p_date desc";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, p_date1);
				pstmt.setInt(2, p_date2);	
// p_name, p_date searching
			}else {
			// sql = "SELECT p_code, p_name, p_price, p_date, p_on_sale "
			// + "FROM product_mst_tb "
			// + "where p_name LIKE ? AND p_date BETWEEN ? AND ? ;";
			sql = "SELECT p.p_code, p.p_name, p.p_price, p.p_date, p.p_on_sale, SUM(s.st_ava_qty) "
					+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code " + "GROUP BY p.p_code "
					+ "having p_name LIKE ? AND p_date BETWEEN ? AND ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + p_name + "%");
			pstmt.setInt(2, p_date1);
			pstmt.setInt(3, p_date2);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setP_code(rs.getInt(1));
				bean.setP_name(rs.getString(2));
				bean.setP_price(rs.getInt(3));
				bean.setP_date(rs.getString(4));
				bean.setP_on_sale(rs.getInt(5));
				bean.setSt_ava_qty(rs.getInt(6));
				slist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return slist;
	}
	

	public Vector<ProductBean> getMertaterialListAll(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM rawmaterial_tb";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setRm_code(rs.getInt(1));
				bean.setRm_name(rs.getString(2));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void insertRmData(int p_code, int[] rm_code, int[] percent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO rm_pct_tb (p_code, rm_code, rm_percentage)\r\n" + 
					"VALUES (?,?,?), (?,?,?),(?,?,?),(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, rm_code[0]);
			pstmt.setInt(3, percent[0]);
			pstmt.setInt(4, p_code);
			pstmt.setInt(5, rm_code[1]);
			pstmt.setInt(6, percent[1]);
			pstmt.setInt(7, p_code);
			pstmt.setInt(8, rm_code[2]);
			pstmt.setInt(9, percent[2]);
			pstmt.setInt(10, p_code);
			pstmt.setInt(11, rm_code[3]);
			pstmt.setInt(12, percent[3]);
			
			int cnt = pstmt.executeUpdate();
			System.out.println("재료등록 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public int getProductCode(String p_name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "SELECT p_code from product_mst_tb where p_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return result;
	}
	

	public Vector<ProductBean> getRmDatas(int p_code){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM rm_pct_tb WHERE p_code=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setRm_code(rs.getInt(2));
				bean.setRm_percentage(rs.getInt(3));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public void updateRmData(int p_code, int[] rm_code, int[] percent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "UPDATE rm_pct_tb SET rm_percentage = ? WHERE p_code=? AND rm_code = ?";
			for(int i=0; i<4; i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, percent[i]);
				pstmt.setInt(2, p_code);
				pstmt.setInt(3, rm_code[i]);
				pstmt.executeUpdate();
			}
			System.out.println("수정완료!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
