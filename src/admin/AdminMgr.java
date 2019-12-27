package admin;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import admin.NoticeBean;
import member.DBConnectionMgr;

public class AdminMgr {

	private DBConnectionMgr pool;

	public static final String SAVEFOLDER = "C:/Jsp/online-shopping-mall-jsp/webContent/img/notice/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;

	public AdminMgr() {
		pool = DBConnectionMgr.getInstance(); 
	
	}
	//notice Insert
		public boolean insertNotice(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag = false;
			
			try {
				MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
				String FileUp = multi.getFilesystemName("FileUp");
				File f= multi.getFile("FileUp");
				
				con = pool.getConnection();
				sql = "insert notice_tb(n_id,n_category,n_title,n_content,n_date,n_file_name,n_file_size)values(?,?,?,?,now(),?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("n_id"));
				pstmt.setString(2, multi.getParameter("n_category"));
				pstmt.setString(3, multi.getParameter("n_title"));
				pstmt.setString(4, multi.getParameter("n_content"));
				if(multi.getFilesystemName("FileUp") != null) {
					int n_file_size=(int)f.length();
					pstmt.setString(5,multi.getParameter(FileUp));
					pstmt.setInt(6, n_file_size);
				}
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
		
		//Board Total Count(총 게시물 개수)
		public int getTotalCount(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
				sql = "select count(*)from notice_tb";
				pstmt = con.prepareStatement(sql);
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
		
		//Board List(리스트)
		public Vector<NoticeBean> getNoticeList(String keyField, String keyWord, int start, int cnt){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<NoticeBean> vlist = new Vector<NoticeBean>();
			try {
				con = pool.getConnection();
				sql="select * from notice_tb order by n_index desc";
				pstmt=con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					NoticeBean bean = new NoticeBean();
					bean.setN_index(rs.getInt("n_index"));
					bean.setN_id(rs.getString("n_id"));
					bean.setN_category(rs.getString("n_category"));
					bean.setN_title(rs.getString("n_title"));
					bean.setN_content(rs.getString("n_content"));
					bean.setN_date(rs.getString("n_date"));
					bean.setN_file_name(rs.getString("n_file_name"));
					bean.setN_file_size(rs.getInt("n_file_size"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//notice Get
		public NoticeBean getNotice(int n_index) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			NoticeBean bean = new NoticeBean();
			try {
				con = pool.getConnection();
				sql = "select * from notice_tb where n_index = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setN_index(rs.getInt("n_index"));
					bean.setN_id(rs.getString("n_id"));
					bean.setN_category(rs.getString("n_category"));
					bean.setN_title(rs.getString("n_title"));
					bean.setN_content(rs.getString("n_content"));
					bean.setN_date(rs.getString("n_date"));
					bean.setN_file_name(rs.getString("n_file_name"));
					bean.setN_file_size(rs.getInt("n_file_size"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
		//notice Delete 
		public boolean deleteNotice(int n_index) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "select n_file_name from notice_tb where n_index=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				rs = pstmt.executeQuery();
				if(rs.next()&&rs.getString(1)!=null) {
					if(!rs.getString(1).equals("")) {
						File f = new File(SAVEFOLDER+rs.getString(1));
						if(f.exists()) {
							//파일삭제기능
							UtilMgr.delete(SAVEFOLDER+rs.getString(1));
						}
					}
				}
				pstmt.close();
				sql = "delete from notice_tb where n_index=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, n_index);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return flag;
		}

		//Notice Update
		public boolean updateNotice(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag=false;
			try {
				MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
				con = pool.getConnection();
				
				int n_index = Integer.parseInt(multi.getParameter("n_index"));
				if(multi.getFilesystemName("filename")!=null) {
					NoticeBean bean = getNotice(n_index);
					String n_file_name = bean.getN_file_name ();
					if(n_file_name!=null&&!n_file_name.equals("")) {
						File f = new File(SAVEFOLDER+n_file_name);
						if(f.exists()) {
							UtilMgr.delete(SAVEFOLDER+n_file_name);
						}//---if2
					}//---if1
					n_file_name = multi.getFilesystemName("n_file_name");
					int n_file_size = (int)multi.getFile("n_file_name").length();
					sql = "update notice_tb set n_id=?, n_title, n_content=?, n_file_name=?, n_file_size=? where n_index = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("n_id"));
					pstmt.setString(2, multi.getParameter("n_title"));
					pstmt.setString(3, multi.getParameter("n_content"));
					pstmt.setString(4, n_file_name);
					pstmt.setInt(5, n_file_size);
					pstmt.setInt(6, n_index);
				}else {
				sql = "update notice_tb set n_id=?, n_title=?, n_content=?, where n_index = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("n_id"));
				pstmt.setString(2, multi.getParameter("n_title"));
				pstmt.setString(3, multi.getParameter("n_content"));
				pstmt.setInt(4, n_index);
				}
				int cnt = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}

		public Vector<IpBean> getipdata(){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<IpBean> vlist = new Vector<IpBean>();
			try {
				con = pool.getConnection();
				sql = "SELECT * FROM page_connection_tb";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					IpBean bean = new IpBean();
					bean.setC_index(rs.getInt(1));
					bean.setC_id(rs.getString(2));
					bean.setC_time(rs.getString(3));
					bean.setC_ip(rs.getString(4));
					vlist.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
}

