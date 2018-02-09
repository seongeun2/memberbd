package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class memDAO {
	private static memDAO instance = new memDAO();
	private memDAO() {
		
	}
	public static memDAO getInstance() {
		return instance;
	}
	
	
	//DB연결
	public static Connection getConnection(){
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbUser = "scott";
			String dbPass = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		}

	public void close(Connection con, ResultSet rs, PreparedStatement pstmt) {
		if(rs!=null) 
			try {
				rs.close();
			}catch(SQLException ex) {}
		if(pstmt!=null)
			try {
				pstmt.close();
			}catch(SQLException ex) {}
		if(con!=null)
			try {
				con.close();
			}catch(SQLException ex) {}
		}
	
	
	//회원등록 (insert)
	public void insert(memVO aaa) {
		String sql="";
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number=0;
		try {
			sql="select memser.nextval from dual";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				number = rs.getInt(1)+1;
			else
				number = 1;
			sql="insert into memberbd(memnum,memid,name,birth,email,passwd,reg_date,mem_level) "
					+ "values(?,?,?,?,?,?,sysdate,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, aaa.getMemid());
			pstmt.setString(3, aaa.getName());
			pstmt.setString(4, aaa.getBirth());
			pstmt.setString(5, aaa.getEmail());
			pstmt.setString(6, aaa.getPasswd());
			pstmt.setString(7, aaa.getMem_level());
			
		}catch(SQLException e1) {
			e1.printStackTrace();
		}finally {
			close(con,rs,pstmt);
		}
	}
	
	//회원목록
	public memVO memList(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memVO memList = null;
		String sql="";
		try {
			conn = getConnection();
			sql = "select * from board where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memList = new memVO();
				memList.setMemnum(rs.getInt("num"));
				memList.setMemid(rs.getString("id"));
				memList.setName(rs.getString("name"));
				memList.setBirth(rs.getString("birth"));
				memList.setReg_date(rs.getTimestamp("reg_date"));
				memList.setMem_level(rs.getString("level"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
	}finally {close(conn, rs, pstmt);}
	return memList;
	}
	
	
	
	
	
	
	
	
	
}
