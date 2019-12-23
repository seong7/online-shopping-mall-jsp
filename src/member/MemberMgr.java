package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import order.OrderBean;

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
		int flag = 0;
		try {
			con = pool.getConnection();
			sql = "select * from USER_TB where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) { 
				flag = 1; 
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
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
			pstmt.setString(3, bean.getNAME());
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
			System.out.println("바뀐플래그");
			if(rs.next()) 
				flag = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	

	//패스워드 체크

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
						bean.setNAME(rs.getString("name"));
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

				
	//회원정보 수정하기
			public boolean updateMember(MemberBean bean) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				boolean flag = false;
				try {
					con = pool.getConnection();
					sql = "update user_tb set pwd=?,NAME=?,birthday=?,email=?,zipcode=?,address=?,address_detail=? where id=?";
					pstmt = con.prepareStatement(sql);
					System.out.println(bean.getAddress());
					System.out.println(bean.getAddress_detail());
					System.out.println(bean.getBirthday());
					System.out.println(bean.getContact());
					System.out.println(bean.getEmail());
					System.out.println(bean.getId());
					System.out.println(bean.getPwd());
					System.out.println(bean.getZipcode());
					System.out.println(bean.getNAME());					
					pstmt.setString(1, bean.getPwd());
					pstmt.setString(2, bean.getNAME());
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
			public Vector<MemberBean> getAllMemberList(){
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				Vector<MemberBean> vlist = new Vector<>();
				try {
					con = pool.getConnection();
					sql = "select * from user_tb";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						MemberBean bean = new MemberBean();
						bean.setId(rs.getString("id"));
						bean.setNAME(rs.getString("NAME"));
						bean.setBirthday(rs.getString("birthday"));
						bean.setEmail(rs.getString("email"));
						bean.setContact(rs.getString("contact"));
						bean.setZipcode(rs.getInt("zipcode"));
						bean.setAddress(rs.getString("address"));
						bean.setAddress_detail(rs.getString("address_detail"));
						bean.setJoin_date(rs.getString("join_date"));
						vlist.addElement(bean);
						}
				} catch (Exception e) {
						e.printStackTrace();
				} finally {
						pool.freeConnection(con, pstmt, rs);
				}
						return vlist;
				}
			public Vector<MemberBean> getMemberList(String type, String value) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				System.out.println("db안에서 value는 : " + value);
				Vector<MemberBean> vlist = new Vector<MemberBean>();
				try {
					con = pool.getConnection();
					sql = "select * from user_tb where " + type + " like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+value+"%");
					rs = pstmt.executeQuery();
					while(rs.next()){
						MemberBean bean = new MemberBean();
						bean.setId(rs.getString("id"));
						bean.setNAME(rs.getString("NAME"));
						bean.setBirthday(rs.getString("birthday"));
						bean.setEmail(rs.getString("email"));
						bean.setContact(rs.getString("contact"));
						bean.setZipcode(rs.getInt("zipcode"));
						bean.setAddress(rs.getString("address"));
						bean.setAddress_detail(rs.getString("address_detail"));
						bean.setJoin_date(rs.getString("join_date"));
						vlist.addElement(bean);
						}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
					return vlist;
			}
			public MemberBean getMemberDetail(String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				MemberBean bean = new MemberBean();
				try {
					con = pool.getConnection();
					sql = "SELECT U.id, U.pwd, U.name, U.birthday, U.email, U.contact, U.zipcode, U.address, U.address_detail, U.join_date, SUM(pt_point) "
							+ "FROM user_tb U JOIN POINT_tb P ON U.id = P.id "
							+ "WHERE U.id=?;";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					while(rs.next()){
						bean.setId(rs.getString(1));
						bean.setPwd(rs.getString(2));
						bean.setNAME(rs.getString(3));
						bean.setBirthday(rs.getString(4));
						bean.setEmail(rs.getString(5));
						bean.setContact(rs.getString(6));
						bean.setZipcode(rs.getInt(7));
						bean.setAddress(rs.getString(8));
						bean.setAddress_detail(rs.getString(9));
						bean.setJoin_date(rs.getString(10));
						bean.setPoint(rs.getInt(11));
						}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
					return bean;
			}
			//admin 회원정보 수정(for ajax)
			public int updateMemberAdmin(MemberBean bean) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				int flag = 0;
				try {
					con = pool.getConnection();
					sql = "update user_tb set birthday=?, join_date=?, contact=? , email=?,zipcode=?,address=?,address_detail=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bean.getBirthday());
					pstmt.setString(2, bean.getJoin_date());
					pstmt.setString(3, bean.getContact());
					pstmt.setString(4, bean.getEmail());
					pstmt.setInt(5, bean.getZipcode());
					pstmt.setString(6, bean.getAddress());
					pstmt.setString(7, bean.getAddress_detail());
					pstmt.setString(8, bean.getId());
					if(pstmt.executeUpdate()==1)
						flag = 1;
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
				return flag;
			}
			public int deleteMember(String userid) {
				Connection con = null;
				PreparedStatement pstmt = null;
				String sql = null;
				int flag = 0;
				try {
					con = pool.getConnection();
					sql = "delete from user_tb where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, userid);
					if(pstmt.executeUpdate()==1)
						flag = 1;
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt);
				}
				return  flag;
			}
			
			//관리자 로그인
			
			public int adminlogin(String id, String pwd) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				int flag = 0;
				try {
					con = pool.getConnection();
					sql = "SELECT * from manager_tb where mgr_id=? and mgr_pwd=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, pwd);
					rs = pstmt.executeQuery();
					System.out.println("관리자로그인");
					if(rs.next()) 
						flag = 1;
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return flag;
			}
}

