package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;

public class StudentDao {

	public Student selectById(Connection conn, String id) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select * from student where memberid = ?");
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			Student member = null;
			
			if(rs.next()) {
				
				member = new Student(rs.getString("memberid"), rs.getString("member_name"),
						rs.getString("password"), rs.getString("phone"), rs.getString("email"),
						rs.getString("major"));
				
			}
			
			return member;
			
			
		} finally {
			
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
	}
	
	public void insert(Connection conn, Student mem) throws SQLException {
		
		try (PreparedStatement pstmt = conn.prepareStatement("insert into student values(?,?,?,?,?,?)")) {
			
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			pstmt.setString(4, mem.getPhone());
			pstmt.setString(5, mem.getEmail());
			pstmt.setString(6, mem.getMajor());
			
			System.out.println(mem.getEmail());
			
			pstmt.executeUpdate();
		}
	}
}
