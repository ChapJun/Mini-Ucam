package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;

public class ArticleContentDao {

	public ArticleContent insert(Connection conn, ArticleContent content) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement("insert into lecture_content "
					+ "(lecture_no, content, path) values (?,?,?)");
			
			pstmt.setLong(1, content.getNumber());
			pstmt.setString(2, content.getContent());
			pstmt.setString(3, content.getPath());
			
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0) {
				return content;
			}
			else {
				return null;
			}
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		
	}
	
	public void delete(Connection conn, int no) throws SQLException {
		
		try (PreparedStatement pstmt = conn.prepareStatement("delete from lecture_content where lecture_no = ?")) {
			
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}
		
	}
	
	public int update(Connection conn, int no, String content, String path) throws SQLException {
		
		try (PreparedStatement pstmt = conn.prepareStatement("update lecture_content set content = ?, path = ? "
				+ "where lecture_no = ?")) {
			
			pstmt.setString(1, content);
			pstmt.setString(2, path);
			pstmt.setInt(3, no);
			
			return pstmt.executeUpdate();
			
		}
	}
	
	public ArticleContent selectById(Connection conn, int no) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
				
			pstmt = conn.prepareStatement("select * from lecture_content where lecture_no = ?");
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			ArticleContent content = null;
			
			if(rs.next()) {
				
				content = new ArticleContent(rs.getInt("lecture_no"), rs.getString("content"), rs.getString("path"));
			}
			
			return content;
			
		} finally {
			
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
	}
	
	
}
