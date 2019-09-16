package course;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;

public class InsListCourseService {

	private InsCourseDao insDao = new InsCourseDao();
	
	public List<InsCourse> getCourseList(int id) {
		
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			List<InsCourse> content = insDao.selectById(conn, id);
			
			if(content == null) {
				throw new authUserNotFoundException();
			}
			
			return content;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
