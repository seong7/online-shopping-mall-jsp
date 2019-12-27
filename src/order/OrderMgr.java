package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class OrderMgr {
	
	private DBConnectionMgr pool;
	
	public OrderMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//***User 기능설계***
	//insert 
	public boolean insertOrder(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert order_tb(o_id,o_recpt_name,o_recpt_contact,"
					+ "o_recpt_zipcode,o_recpt_add,o_recpt_add_det,"
					+ "o_del_msg,o_date,o_prod_amount,o_del_fee,"
					+ "o_total_amount,o_pay_method, o_status) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?,?)";
			pstmt = con.prepareStatement(sql);
				pstmt.setString(1, order.getO_id());
				pstmt.setString(2, order.getO_recpt_name());
				pstmt.setString(3, order.getO_recpt_contact());
				pstmt.setString(4, order.getO_recpt_zipcode());
				pstmt.setString(5, order.getO_recpt_add());
				pstmt.setString(6, order.getO_recpt_add_det());
				pstmt.setString(7, order.getO_del_msg());
				pstmt.setInt(8, order.getO_prod_amount());
				pstmt.setInt(9, order.getO_del_fee());
				pstmt.setInt(10, order.getO_total_amount());
				pstmt.setString(11, order.getO_pay_method());
				pstmt.setString(12, order.getO_status());
				int cnt = pstmt.executeUpdate();
				if(cnt==1)
					flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//order detail insert 
	public boolean insertDetailOrder(OrderDetailBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
				//o_ index값 설정
				con = pool.getConnection();
				sql = "select max(o_index) from order_tb";//가장 높은 o_index값 
				pstmt = con.prepareStatement(sql);
				rs= pstmt.executeQuery();
				int ref = 0;
				if(rs.next())
					ref = rs.getInt(1);
				pstmt.close();
				rs.close();
			////////////////////////////////////////////////////////////////
				sql = "select count(p_code) from order_detail_tb "
						+ "WHERE o_index =?"; 
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				rs= pstmt.executeQuery();
				int refCount = 0;
				if(rs.next())
					refCount = rs.getInt(1);
				pstmt.close();
				rs.close();
			////////////////////////////////////////////////////////////////
				sql = "insert order_detail_tb(o_index, p_code, o_qty) " + 
					"VALUES (?,?,?)";
				pstmt = con.prepareStatement(sql);
				int cnt = 0;
				int p_codes[] = order.getP_code();
				int o_qtys[] = order.getO_qty();
				for (int i = 0; i < p_codes.length; i++) {
					pstmt.setInt(1, ref);
					pstmt.setInt(2, p_codes[i]);
					pstmt.setInt(3, o_qtys[i]);
					cnt = pstmt.executeUpdate();
					System.out.print("ref:"+ref);
					System.out.print("p_codes: "+p_codes[i]);
					System.out.print("o_qtys: "+o_qtys[i]);
				}
				if(cnt==1)
					flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//Order list 
	public Vector<OrderBean> getOrder(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from order_tb where o_id=? "
					+ "order by o_index DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setO_index(rs.getInt(1));
				order.setO_id(rs.getString(2));
				order.setO_recpt_name(rs.getString(3));
				order.setO_recpt_contact(rs.getString(4));
				order.setO_recpt_zipcode(rs.getString(5));
				order.setO_recpt_add(rs.getString(6));
				order.setO_recpt_add_det(rs.getString(7));
				order.setO_del_msg(rs.getString(8));
				order.setO_date(rs.getString(9));
				order.setO_date(rs.getString(9));
				order.setO_prod_amount(rs.getInt(10));
				order.setO_del_fee(rs.getInt(11));
				order.setO_total_amount(rs.getInt(12));
				order.setO_pay_method(rs.getString(13));
				order.setO_mgr_note(rs.getString(14));
				order.setO_status(rs.getString(15));
				order.setO_del_num(rs.getString(16));
				order.setO_del_date(rs.getString(17));
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Order detail code, 수량 확인 
	public Vector<OrderDetailBean> getOrderCode(int o_index) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderDetailBean> vlist = new Vector<OrderDetailBean>();
		try {
			con = pool.getConnection();
			sql = "select count(p_code) from order_detail_tb "
					+ "WHERE o_index =?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_index);
			rs= pstmt.executeQuery();
			int ref = 0;
			if(rs.next())
				ref = rs.getInt(1);
			//System.out.print(ref);
			pstmt.close();
			rs.close();
			/////////////////////////////////////////////////////////////////
			sql = "SELECT p_code,o_qty from order_detail_tb "
					+ "WHERE o_index = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_index);
			rs = pstmt.executeQuery();
			int i=0;
			while(rs.next()) {
				OrderDetailBean order = new OrderDetailBean();
				int p_code = rs.getInt(1); 
				int o_qty = rs.getInt(2);
//				System.out.print("p_code: "+p_code);
				int p_codes[] = new int[ref];
				int o_qtys[] = new int[ref];
				p_codes[i] = p_code;
				o_qtys[i] = o_qty;
//				System.out.print(p_codes[i]);
//				System.out.print("pcode1: "+p_codes[i]);
//				System.out.print("qty1: "+o_qtys[i]);
				order.setP_code(p_codes);
				order.setO_qty(o_qtys);
				vlist.addElement(order);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	

	//***Admin 기능설계***
	//Order Total Count(오더갯수)
	public int getTotalCount(String keyField, String keyWord,
			String keyDate1, String keyDate2) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if((keyWord.trim().equals("")||keyWord==null)&&
			(keyDate1.trim().equals("")||keyDate1==null)&&
			(keyDate2.trim().equals("")||keyDate2==null)) {//검색이 아닌경우
				sql = "select count(*) from order_tb";
				pstmt = con.prepareStatement(sql);
			}else if((!keyDate1.trim().equals("")||keyDate1!=null) &&
					  (!keyDate2.trim().equals("")||keyDate2!=null)&&
					  (keyWord.trim().equals("")||keyWord==null)){//기간 검색인 경우
				sql = "select count(*) from order_tb WHERE "
							+ "o_date BETWEEN ? and ?"; 
					pstmt = con.prepareStatement(sql); 
					  pstmt.setString(1, keyDate1);
					  pstmt.setString(2, keyDate2); 
			}else if(!keyWord.trim().equals("")||keyWord!=null){//검색어인 경우
				//select count(*) from tblBoard WHERE NAME LIKE '%aaa%';
				sql = "select count(*) from order_tb where " + keyField;
				sql +=" like ?"; 
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyWord);
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
	//All List(검색기능 포함)
	public Vector<OrderBean> getOrderList(String keyField, 
			String keyWord, String keyDate1, String keyDate2, 
			int start, int cnt) {//limit start, cnt로 검색 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist =new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			if((keyWord.trim().equals("")||keyWord==null)&&
			((keyDate1.trim().equals("")||keyDate1==null))&&
			((keyDate2.trim().equals("")||keyDate2==null))){//검색이 아닌 경우
				sql = "select * from order_tb order by o_index desc, "
						+ "o_index limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);//게시물 시작번호
				pstmt.setInt(2, cnt);//가져올 게시물 개수
			} else if((!keyDate1.trim().equals("")||keyDate1!=null) &&
					  (!keyDate2.trim().equals("")||keyDate2!=null)&&
					  (keyWord.trim().equals("")||keyWord==null)){//기간 검색인 경우
				sql = "select * from order_tb WHERE o_date BETWEEN " +
					  "? and ? order by o_index desc, o_index LIMIT ?,?"; 
					pstmt = con.prepareStatement(sql); 
					  pstmt.setString(1, keyDate1);
					  pstmt.setString(2, keyDate2); 
					  pstmt.setInt(3, start);//게시물 시작번호 
					  pstmt.setInt(4, cnt);//가져올 게시물개수 
			}else if(!keyWord.trim().equals("")||keyWord!=null){//검색어 검색인 경우
				sql = "select * from order_tb where "+ keyField 
						+" like ? order by o_index desc, o_index limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, keyWord);
				pstmt.setInt(2, start);//게시물 시작번호
				pstmt.setInt(3, cnt);//가져올 게시물 개수
			}
				 
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setO_index(rs.getInt(1));
				order.setO_id(rs.getString(2));
				order.setO_recpt_name(rs.getString(3));
				order.setO_recpt_contact(rs.getString(4));
				order.setO_recpt_zipcode(rs.getString(5));
				order.setO_recpt_add(rs.getString(6));
				order.setO_recpt_add_det(rs.getString(7));
				order.setO_del_msg(rs.getString(8));
				order.setO_date(rs.getString(9));
				order.setO_date(rs.getString(9));
				order.setO_prod_amount(rs.getInt(10));
				order.setO_del_fee(rs.getInt(11));
				order.setO_total_amount(rs.getInt(12));
				order.setO_pay_method(rs.getString(13));
				order.setO_mgr_note(rs.getString(14));
				order.setO_status(rs.getString(15));
				order.setO_del_num(rs.getString(16));
				order.setO_del_date(rs.getString(17));
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	//Order detail(1개 주문정보 가져오기)
	public Vector<OrderBean> getOrderDetail(int o_index) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from order_tb where o_index=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_index);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setO_index(rs.getInt(1));
				order.setO_id(rs.getString(2));
				order.setO_recpt_name(rs.getString(3));
				order.setO_recpt_contact(rs.getString(4));
				order.setO_recpt_zipcode(rs.getString(5));
				order.setO_recpt_add(rs.getString(6));
				order.setO_recpt_add_det(rs.getString(7));
				order.setO_del_msg(rs.getString(8));
				order.setO_date(rs.getString(9));
				order.setO_date(rs.getString(9));
				order.setO_prod_amount(rs.getInt(10));
				order.setO_del_fee(rs.getInt(11));
				order.setO_total_amount(rs.getInt(12));
				order.setO_pay_method(rs.getString(13));
				order.setO_mgr_note(rs.getString(14));
				order.setO_status(rs.getString(15));
				order.setO_del_num(rs.getString(16));
				order.setO_del_date(rs.getString(17));
				vlist.addElement(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//Order update
	public boolean updateOrder(OrderBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "UPDATE order_tb SET o_recpt_name=?, o_recpt_contact =?, o_recpt_add=?, " + 
					"o_recpt_add_det=?, o_del_msg = ?, o_date =?, o_prod_amount = ?, " + 
					"o_del_fee = ?, o_total_amount = ?, o_pay_method = ?, o_mgr_note =?, " + 
					"o_status = ?, o_del_num =?, o_del_date = ? WHERE o_index=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getO_recpt_name());
			pstmt.setString(2,bean.getO_recpt_contact());
			pstmt.setString(3,bean.getO_recpt_add());
			pstmt.setString(4,bean.getO_recpt_add_det());
			pstmt.setString(5,bean.getO_del_msg());
			pstmt.setString(6,bean.getO_date());
			pstmt.setInt(7,bean.getO_prod_amount());
			pstmt.setInt(8,bean.getO_del_fee());
			pstmt.setInt(9,bean.getO_total_amount());
			pstmt.setString(10,bean.getO_pay_method());
			pstmt.setString(11,bean.getO_mgr_note());
			pstmt.setString(12,bean.getO_status());
			pstmt.setString(13,bean.getO_del_num());
			pstmt.setString(14,bean.getO_del_date());
			pstmt.setInt(15,bean.getO_index());
			int cnt = pstmt.executeUpdate();
			if(cnt==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Order delete
	public boolean deleteOrder(int o_index) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from order_tb where o_index = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_index);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//Refund insert
	//Refund update
	//Refund delete 
	//페이징 및 블럭 테스트를 위한 게시물 저장 메소드 (게시물 1,000개 저장)
	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert order_tb(o_id,o_recpt_name,o_recpt_contact,o_recpt_zipcode,o_recpt_add,o_recpt_add_det," + 
					"o_del_msg,o_date,o_prod_amount,o_del_fee,o_total_amount,o_pay_method)" + 
					"VALUES('u1', 'bbb', 'ccc', 12345, 'ccc', 'ccc','ccc', NOW(),0, 0, 0,'ccc')";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
			
	
	//어드민창의 값 빼오기위한 mgr
	public Vector<AdminOrderBean> getAdminOrder(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<AdminOrderBean> alist = new Vector<AdminOrderBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT O.o_index, O.o_del_date, O.o_status,  O.o_total_amount, "
					+ "P.p_name, COUNT(*), R.rt_qty, O.o_pay_method,O.o_date"
					+ " FROM order_tb O JOIN order_detail_tb D ON O.o_index = D.o_index "
					+ "JOIN product_mst_tb P ON P.p_code = D.p_code LEFT OUTER "
					+ "JOIN return_tb R ON R.o_index = D.o_index "
					+ "WHERE o_id = ? GROUP BY D.o_index;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminOrderBean bean = new AdminOrderBean();
				bean.setO_index(rs.getInt(1));
				bean.setO_del_date(rs.getString(2));
				bean.setO_status(rs.getString(3));
				bean.setO_total_amount(rs.getInt(4));
				bean.setP_name(rs.getString(5));
				bean.setProduct_count(rs.getInt(6));
				bean.setRt_qty(rs.getInt(7));
				bean.setO_paymethod(rs.getString(8));
				bean.setO_date(rs.getString(9));
				alist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
			//main
			public static void main(String[] args) {
				//OrderMgr mgr = new OrderMgr();
				//mgr.post1000();
				System.out.println("성공~~");
			}
		//counting order status "deliver-ing"
			public int countDeliver(String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				int count = 0;
				try {
					con = pool.getConnection();
					sql = "SELECT COUNT(*) FROM order_tb WHERE o_status = '배송중' and o_id= ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();					
					if (rs.next()) {
						count = rs.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return count;
				
			}	
			
			//counting order status "pay-complete"
			public int countPayComplete(String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				int count = 0;
				try {
					con = pool.getConnection();
					sql = "SELECT COUNT(*) FROM order_tb WHERE o_status = '결제완료'";
					pstmt = con.prepareStatement(sql);					
					rs = pstmt.executeQuery();					
					if (rs.next()) {
						count = rs.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return count;				
			}	
}