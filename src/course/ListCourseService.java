package course;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;

public class ListCourseService {

	private CourseDao courseDao = new CourseDao();
	
	public List<Course> getCourseList(int id) {
		
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			List<Course> content = courseDao.selectById(conn, id);
			
			if(content == null) {
				throw new authUserNotFoundException();
			}
			
			return content;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
