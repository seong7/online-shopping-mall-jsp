package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;


public class ProductMgr {
	
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/online-shopping-mall-jsp/webContent/img/product/";
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
	
	// get goods list (parameter)
	public Vector<ProductBean> getGoodsList(String list){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();
		
		switch(list) {
			case "best":
				
				/*  best ??  convesation needed */ 
				sql = "SELECT p.p_code, p_name, p_price, p.p_main_pht_name, p.p_on_sale "
						+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code "
						+ "GROUP BY p.p_code having p.p_on_sale=1 "
						+ "ORDER BY (SUM(s.st_enter_qty)-SUM(s.st_ava_qty)) DESC "
						+ "LIMIT 0, 8";
				break;
			
			case "indexBest":
				
				/*  best ??  convesation needed */ 
				sql = "SELECT p.p_code, p_name, p_price, p.p_main_pht_name, p.p_on_sale "
						+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code "
						+ "GROUP BY p.p_code having p.p_on_sale=1 "
						+ "ORDER BY (SUM(s.st_enter_qty)-SUM(s.st_ava_qty)) DESC "
						+ "LIMIT 0, 4";
				break;
				
			case "new":
				sql=  "SELECT p_code, p_name, p_price, p_main_pht_name "
						+ "FROM product_mst_tb WHERE p_on_sale=1 ORDER BY p_date DESC "
						+ "LIMIT 0, 8";
				break;
			
			case "indexNew":
				sql=  "SELECT p_code, p_name, p_price, p_main_pht_name "
						+ "FROM product_mst_tb WHERE p_on_sale=1 ORDER BY p_date DESC "
						+ "LIMIT 0, 4";
				break;
				
			case "all" :
				sql= "select p_code, p_name, p_price, p_main_pht_name from product_mst_tb "
						+ "WHERE p_on_sale=1 order by p_date";
				break;
			
			/* number of review  DESC */
			case "review" : 
				sql = "SELECT p.p_code, p.p_name, p.p_price, p.p_main_pht_name, p.p_on_sale "
						+ "FROM product_mst_tb p JOIN review_tb r ON p.p_code = r.p_code "
						+ "GROUP BY p.p_code having p_on_sale=1 ORDER BY COUNT(r.p_code) DESC";
				break;
			
			/* price DESC */
			case "priceH" :
				sql =  "SELECT p_code, p_name, p_price, p_main_pht_name "
					    + "FROM product_mst_tb where p_on_sale=1 ORDER BY p_price DESC";
				break;
				
			/* price ASC */
			case "priceL" :
				sql = "SELECT p_code, p_name, p_price, p_main_pht_name "
						+ "FROM product_mst_tb where p_on_sale=1	ORDER BY p_price";
				break;
		}
		
		try {
			con = pool.getConnection();	
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setP_code(rs.getInt(1));
				bean.setP_name(rs.getString(2));
				bean.setP_price(rs.getInt(3));
				bean.setP_main_pht_name(rs.getString(4));
				vlist.addElement(bean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//search list
	public Vector<ProductBean> getSearchList(String searchTerm){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();		
		try {
			con = pool.getConnection();
			sql = "select p_code, p_name, p_price, p_main_pht_name from PRODUCT_MST_TB where p_on_sale=1 and p_name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchTerm+"%");
//			System.out.println("DB sql  :   %" + searchTerm+ "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductBean bean = new ProductBean();		
				bean.setP_code(rs.getInt(1));
				bean.setP_name(rs.getString(2));
				bean.setP_price(rs.getInt(3));
				bean.setP_main_pht_name(rs.getString(4));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}	
	

	//model name list(for search bar ajax)
	public Vector<String> getProductList(String searchValue) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<String> vlist = new Vector<String>();
		String sql = null;
//		System.out.println("searchdata :" +searchValue);
		try {
			con = pool.getConnection();
			sql = "select p_name from PRODUCT_MST_TB where p_on_sale=1 and p_name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchValue+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vlist.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//good_stock
		public Vector<ProductBean> getstockdata(String type, String searchvalue){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<ProductBean> vlist = new Vector<ProductBean>();		
			try {
				System.out.print("type은"  +type);
				con = pool.getConnection();
				if(type.equals("flag")) {
					sql = "SELECT P.p_code, P.p_name, S.st_enter_qty, S.st_ava_qty, S.st_waste_qty, S.st_exp_date  from PRODUCT_MST_TB P JOIN STOCK_TB S ON P.p_code = S.p_code";
				}
				else if(type.equals("code")) {
					sql = "SELECT p_code, p_name from PRODUCT_MST_TB STOCK_TB WHERE p_code = ?";
				}else{
					sql = "SELECT p_code, p_name from PRODUCT_MST_TB STOCK_TB WHERE p_name LIKE ?";
				}
				pstmt = con.prepareStatement(sql);
				if(type.equals("flag")) {
					System.out.println("디비플래그");
				}
				else if(type.equals("code")) {
					pstmt.setInt(1, Integer.parseInt(searchvalue));
				}else {
					pstmt.setString(1, "%"+searchvalue+"%");
				}
				rs = pstmt.executeQuery();
				
				while(rs.next()) {				
					ProductBean bean = new ProductBean();		
					bean.setP_code(rs.getInt(1));
					bean.setP_name(rs.getString(2));
					if(type.equals("flag")) {
						bean.setSt_enter_qty(rs.getInt(3));
						bean.setSt_ava_qty(rs.getInt(4));
						bean.setSt_waste_qty(rs.getInt(5));
						bean.setSt_exp_date(rs.getString(6));
					}else {
						System.out.println("플래그 예외(검색)");
					}
					vlist.addElement(bean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}	
}
