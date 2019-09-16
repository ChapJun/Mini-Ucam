package article;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;

import member.StudentDao;
import member.Student;
import member.InstructorDao;
import member.Instructor;

public class LoginService {

	private StudentDao studentDao = new StudentDao();
	private InstructorDao instructorDao = new InstructorDao();
	
	public User login(String id, String password, String seq) {
		
		try (Connection conn = ConnectionProvider.getConnection()) {
			
			if(seq.equals("교수")) {
				
				Instructor member = instructorDao.selectById(conn, id);
				
				if(member == null) {
					throw new LoginFailException();
				}
				
				if(!member.matchPassword(password)) {
					throw new LoginFailException();
				}
				return new User(member.getId(), member.getName());
			}
			else {
				
				Student member = studentDao.selectById(conn, id);
				
				if(member == null) {
					throw new LoginFailException();
				}
				
				if(!member.matchPassword(password)) {
					throw new LoginFailException();
				}
				return new User(member.getId(), member.getName());
			}
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
}
