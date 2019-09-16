package lecture;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteService {

	private ArticleDao articleDao = new ArticleDao();
	private ArticleContentDao contentDao = new ArticleContentDao();
	
	public void delete(DeleteRequest deq) {
		
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Article article = articleDao.selectById(conn, deq.getArticleNumber());
			
			if(article == null)
				throw new ArticleNotFoundException();
			
			if(!canDelete(deq.getUserId(), article)) {
				throw new PermissionDeniedException();
			}
			
			articleDao.delete(conn, deq.getArticleNumber());
			contentDao.delete(conn, deq.getArticleNumber());
			
			conn.commit();
			
		} catch(SQLException e) {
			
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch(PermissionDeniedException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} finally {
			JdbcUtil.close(conn);
		}
	
	}
	
	private boolean canDelete(String id, Article article) {
		return article.getWriter().getId().equals(id);
	}
}
