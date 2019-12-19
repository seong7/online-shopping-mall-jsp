package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberMgr {

	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int duplicationCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from USER_TB where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) { 
				return 0; 
			} else {
				return 1; 
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return -1;
	}
	//INSERT INTO `user_tb` (`id`, `pwd`, `NAME`, `birthday`, `email`, `contact`, `zipcode`, `address`, `address_detail`, `join_date`) VALUES
	public int signup_user(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO USER_TB(id,pwd,NAME,birthday,email,contact,zipcode,address,address_detail,join_date)VALUES (?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getBirthday());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getContact());
			pstmt.setInt(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getAddress_detail());
			pstmt.setString(10, bean.getJoin_date());
			System.out.println(bean.getJoin_date());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return 1;
	}
	
	public int login(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int flag = 0;
		try {
			con = pool.getConnection();
			sql = "SELECT * from USER_TB where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			System.out.println("¹Ù²ïÇÃ·¡±×");
			if(rs.next()) 
				flag = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	

	//??????ë³? ?????? ë¹?ë²?????

			public boolean checkPwd(String pwd) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				boolean flag = false;
				try {
					con = pool.getConnection();
					sql = "select pwd from user_tb where pwd=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, pwd);
					rs = pstmt.executeQuery();
					flag = rs.next();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return flag;
			}
	//??????ë³? ê°??¸ì?¤ê¸°
			public MemberBean getMember(String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				MemberBean bean = new MemberBean();
				try {
					con = pool.getConnection();
					sql = "select * from user_tb where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						bean.setId(rs.getString("id"));
						bean.setPwd(rs.getString("pwd"));
						bean.setName(rs.getString("name"));
						bean.setBirthday(rs.getString("birthday"));
						bean.setEmail(rs.getString("email"));
						bean.setContact(rs.getString("contact"));
						bean.setZipcode(rs.getInt("zipcode"));
						bean.setAddress(rs.getString("address"));
						bean.setAddress_detail(rs.getString("address_detail"));
						}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return bean;
			}

				
			//??????ë³? ??????ê¸?
			public boolean updateMember(MemberBean bean) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				boolean flag = false;
				try {
					con = pool.getConnection();
					sql = "update user_tb set pwd=?,name=?,birthday=?,email=?,zipcode=?,address=?,address_detail=? where id=?";
					pstmt = con.prepareStatement(sql);
					System.out.println(bean.getAddress());
					System.out.println(bean.getAddress_detail());
					System.out.println(bean.getBirthday());
					System.out.println(bean.getContact());
					System.out.println(bean.getEmail());
					System.out.println(bean.getId());
					System.out.println(bean.getPwd());
					System.out.println(bean.getZipcode());
					System.out.println(bean.getName());										
					pstmt.setString(1, bean.getPwd());
					pstmt.setString(2, bean.getName());
					pstmt.setString(3, bean.getBirthday());
					pstmt.setString(4, bean.getEmail());
					pstmt.setInt(5, bean.getZipcode());
					pstmt.setString(6, bean.getAddress());
					pstmt.setString(7, bean.getAddress_detail());
					pstmt.setString(8, bean.getId()) ;
					if(pstmt.executeUpdate()==1)
						flag = true;
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
				return flag;
			}
}
