package manage;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import jdbc.ConnectionProvider;

public class ListPersonService {

	private PersonDao personDao = new PersonDao();
	
	public List<Person> getPersonList(int instructor_id, int course_no) {
		
		try(Connection conn = ConnectionProvider.getConnection()) {
			
			List<Person> content = personDao.selectById(conn, instructor_id, course_no);
			
			return content;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
