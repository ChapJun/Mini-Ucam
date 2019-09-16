package lecture;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;

public class ListArticleService {

	private ArticleDao articleDao = new ArticleDao();
	private int size = 10;
	
	public ArticlePage getArticlePage(int pageNum, int course_no) {
		
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			int total = articleDao.selectCount(conn);
			
			List<Article> content = articleDao.select(conn, (pageNum-1) * size, size, course_no);
			
			return new ArticlePage(total, pageNum, size, content);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
}
