package member;

import java.sql.Connection;
import java.sql.SQLException;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class JoinService {

	private StudentDao studentDao = new StudentDao();
	private InstructorDao instructorDao = new InstructorDao();
	
	public void join(JoinRequest joinReq, String seq) {
		
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			if(seq.equals("교수")) {
				
				Instructor member = instructorDao.selectById(conn, joinReq.getId());
				
				if(member != null) {
					
					JdbcUtil.rollback(conn);
					throw new DuplicateIdException();
				}
				
				instructorDao.insert(conn, new Instructor(joinReq.getId(), joinReq.getName(), joinReq.getPassword(),
						joinReq.getPhone(), joinReq.getEmail(), joinReq.getMajor()));
				
				
				
			} else {
				
				Student member = studentDao.selectById(conn, joinReq.getId());
				
				if(member != null) {
					
					JdbcUtil.rollback(conn);
					throw new DuplicateIdException();
				}
				
				studentDao.insert(conn, new Student(joinReq.getId(), joinReq.getName(), joinReq.getPassword(),
						joinReq.getPhone(), joinReq.getEmail(), joinReq.getMajor()));
			}		
			
			conn.commit();
			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
		
	}
}
