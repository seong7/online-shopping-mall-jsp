package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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
					+ "VALUES (?,?,?,?,0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bean.getP_code());
				pstmt.setString(2, bean.getSt_exp_date());
				pstmt.setInt(3, bean.getSt_enter_qty());
				pstmt.setInt(4, bean.getSt_enter_qty());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//Search in goods_stock.jsp
		public Vector<StockBean> searchStock(String keyField, String keyWord, int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<StockBean> slist = new Vector<StockBean>();
			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("") || keyWord ==null) {								
				sql = "SELECT p.p_code, p_name, st_enter_qty, st_ava_qty, st_waste_qty, TIMESTAMPDIFF(day,NOW(),st_exp_date)+1, st_exp_date " 
					+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code " 
					+ "TIMESTAMPDIFF(day,NOW(),st_exp_date)+1 > 0 ORDER BY 6 limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, cnt);
			}else {
				sql= "SELECT p.p_code, p_name, st_enter_qty, st_ava_qty, st_waste_qty, TIMESTAMPDIFF(day,NOW(),st_exp_date)+1, st_exp_date "
					+"FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code "
					+"WHERE "+ keyField +" like ? and TIMESTAMPDIFF(day,NOW(),st_exp_date)+1 > 0 ORDER BY 6";				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, cnt);
			}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					StockBean bean = new StockBean();
					bean.setP_code(rs.getInt("p_code"));
					bean.setP_name(rs.getString("p_name"));
					bean.setSt_enter_qty(rs.getInt("st_enter_qty"));
					bean.setSt_ava_qty(rs.getInt("st_ava_qty"));
					bean.setSt_waste_qty(rs.getInt("st_waste_qty"));
					bean.setTimestampDiff(rs.getInt("TimestampDiff"));
					bean.setSt_exp_date(rs.getString("st_exp_date"));
					slist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return slist;
		}
		
		//Search in goods_stock.jsp
				public Vector<StockBean> searchStock2(String keyField, String keyWord, int start, int cnt){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<StockBean> slist = new Vector<StockBean>();
					try {
						con = pool.getConnection();
						if(keyWord.trim().equals("") || keyWord ==null) {								
						sql = "SELECT p.p_code, p_name, st_enter_qty, st_ava_qty, st_waste_qty, TIMESTAMPDIFF(day,NOW(),st_exp_date)+1, st_exp_date " 
							+ "FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code " 
							+ "TIMESTAMPDIFF(day,NOW(),st_exp_date)+1 < 0 ORDER BY 6 limit ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, start);
						pstmt.setInt(2, cnt);
					}else {
						sql= "SELECT p.p_code, p_name, st_enter_qty, st_ava_qty, st_waste_qty, TIMESTAMPDIFF(day,NOW(),st_exp_date)+1, st_exp_date "
							+"FROM product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code "
							+"WHERE "+ keyField +" like ? and TIMESTAMPDIFF(day,NOW(),st_exp_date)+1 < 0 ORDER BY 6";				
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
					}
						rs = pstmt.executeQuery();
						while(rs.next()) {
							StockBean bean = new StockBean();
							bean.setP_code(rs.getInt("p_code"));
							bean.setP_name(rs.getString("p_name"));
							bean.setSt_enter_qty(rs.getInt("st_enter_qty"));
							bean.setSt_ava_qty(rs.getInt("st_ava_qty"));
							bean.setSt_waste_qty(rs.getInt("st_waste_qty"));
							bean.setTimestampDiff(rs.getInt("TimestampDiff"));
							bean.setSt_exp_date(rs.getString("st_exp_date"));
							slist.addElement(bean);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return slist;
				}
		
		
		//total Count
		public int getTotalCount(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				if (keyWord.trim().equals("") || keyWord == null) {
					// �˻��� �ƴѰ��
					sql = "select count(*) from product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code "  
						+ "WHERE TIMESTAMPDIFF(day,NOW(),st_exp_date)+1 > 0 ";
					pstmt = con.prepareStatement(sql);
				} else {
					// �˻��� ���
					
					sql = "select count(*) from product_mst_tb p JOIN stock_tb s ON p.p_code = s.p_code WHERE " + keyField;
					sql += " like ? and TIMESTAMPDIFF(day,NOW(),st_exp_date)+1 > 0";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
				}
				rs = pstmt.executeQuery();
				if (rs.next())
					totalCount = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return totalCount;
		}
		
		//waste update mgr
				public void waste(String [] date, int [] code, int [] enter) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					try {
						con = pool.getConnection();
						sql = "UPDATE stock_tb SET st_ava_qty=0, st_waste_qty=? WHERE p_code=? AND st_exp_date=?";
						for(int i=0; i<code.length; i++) {
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, enter[i]);
							pstmt.setInt(2, code[i]);
							pstmt.setString(3, date[i]);
							pstmt.executeUpdate();
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
				}
				
				//stock qty update
				public int setstockqtydate(int code, int enter, int ava, int waste,String date) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					int flag = 0;
					try {
						con = pool.getConnection();
						sql = "UPDATE stock_tb SET st_enter_qty=?, st_ava_qty=?, st_waste_qty=? WHERE p_code=? AND st_exp_date=?;";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, enter);
						pstmt.setInt(2, ava);
						pstmt.setInt(3, waste);
						pstmt.setInt(4, code);
						pstmt.setString(5, date);
						flag = pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
					return flag;
				}
				
				public int getStockAva(int code) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int qty = 0;
					try {
						con = pool.getConnection();
						sql = "SELECT SUM(st_ava_qty) FROM stock_tb WHERE p_code = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, code);
						rs = pstmt.executeQuery();
						if(rs.next()) 
							qty = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return qty;
				}
				public void subtractStock(int p_code, int o_qty) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					ResultSet rs = null;
					try {
							//o_ index�� ����
							con = pool.getConnection();
							sql = "SELECT st_ava_qty,st_exp_date from stock_tb "
									+ "where p_code=? order by st_exp_date";
							pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, p_code);
							rs= pstmt.executeQuery();
							int ava_qty = 0;
							String exp_date;							
							while(rs.next()) {
								ava_qty = rs.getInt(1);//������ 
								exp_date = rs.getString(2);//��¥ 
								int remainStock = ava_qty-o_qty;
								if(remainStock>0) {//��� ���� ������ 
									sql = "UPDATE stock_tb SET st_ava_qty=? WHERE "
											+ "p_code=? AND st_exp_date=?";
									pstmt = con.prepareStatement(sql);
									pstmt.setInt(1,remainStock);
									pstmt.setInt(2, p_code);
									pstmt.setString(3, exp_date);
									pstmt.executeUpdate();
									break;
								}
							}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt,rs);
					}
				}
}
