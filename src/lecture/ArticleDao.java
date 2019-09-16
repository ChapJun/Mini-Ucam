package lecture;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;


public class ArticleDao {

	public int selectCount(Connection conn) throws SQLException {
	
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from lecture");
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
			return 0 ;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public Article insert(Connection conn, Article article) throws SQLException {
		
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("insert into lecture "
					+ "(writer_id, writer_name, title, regdate, moddate, read_cnt, course_no) "
					+ "values (?,?,?,?,?,0,?)");
			
			pstmt.setString(1, article.getWriter().getId());
			pstmt.setString(2, article.getWriter().getName());
			pstmt.setString(3, article.getTitle());
			pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
			pstmt.setTimestamp(5, toTimestamp(article.getModifiedDate()));
			pstmt.setInt(6, article.getCourseNo());
			
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount > 0) {
				
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select last_insert_id() from lecture");
				
				if(rs.next()) {
					
					Integer newNum = rs.getInt(1);
					
					return new Article(newNum, article.getWriter(), article.getTitle(),
							article.getRegDate(), article.getModifiedDate(), 0, article.getCourseNo());
					
				}
			}
			
			return null;
			
		} finally {
			
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
			JdbcUtil.close(pstmt);
			
		}
		
	}
	
	public List<Article> select(Connection conn, int startRow, int size, int course_No) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select * from lecture where course_no = ? "
					+ "order by lecture_no desc limit ?, ?");
			
			pstmt.setInt(1, course_No);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, size);
			
			rs = pstmt.executeQuery();
			
			List<Article> result = new ArrayList<>();
			while(rs.next()) {
				
				result.add(convertArticle(rs));
			}
			
			return result;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	public Article selectById(Connection conn, int no) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select * from lecture where lecture_no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			Article article = null;
			
			if(rs.next()) {
				
				article = convertArticle(rs);
				
			}
			return article;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	public void delete(Connection conn, int no) throws SQLException {
		
		try (PreparedStatement pstmt = conn.prepareStatement("delete from lecture where lecture_no = ?")) {
			
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}
		
	}
	
	public int update(Connection conn, int no, String title) throws SQLException {
		
		try (PreparedStatement pstmt = conn.prepareStatement("update lecture set title = ?, moddate = now() "
				+ "where lecture_no = ?")) {
			
			pstmt.setString(1, title);
			pstmt.setInt(2, no);
			
			return pstmt.executeUpdate();
		}
		
	}
	
	public void increaseReadCount(Connection conn, int no) throws SQLException {
		
		try (PreparedStatement pstmt = conn.prepareStatement("update lecture set read_cnt = read_cnt+1 "
				+ "where lecture_no = ?")) {
			
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		}
		
	}
	
	private Article convertArticle(ResultSet rs) throws SQLException {
		
		return new Article(rs.getInt("lecture_no"), new Writer(rs.getString("writer_id"), rs.getString("writer_name")),
				rs.getString("title"), toDate(rs.getTimestamp("regdate")), toDate(rs.getTimestamp("moddate")), rs.getInt("read_cnt"),
				rs.getInt("course_no"));
	}
	
	private Date toDate(Timestamp time) {
		
		return new Date(time.getTime());
		
	}
	private Timestamp toTimestamp(Date date) {
		
		return new Timestamp(date.getTime());
	}
}
