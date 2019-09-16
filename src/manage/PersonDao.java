package manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;

public class PersonDao {
	
	public List<Person> selectById(Connection conn, int Instructor_id, int course_no) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select memberid, member_name, major, phone, email "
					+ "from ucampus.student where memberid in "
					+ "(select section.student_id from ucampus.course, ucampus.section "
					+ "where course.course_no = section.course_no AND course.teacher_id = ? AND section.course_no = ?)");
			
			pstmt.setInt(1, Instructor_id);
			pstmt.setInt(2, course_no);
			
			rs = pstmt.executeQuery();
			
			List<Person> result = new ArrayList<>();
			
			while(rs.next()) {
				result.add(convertPerson(rs));
			}
			
			return (List<Person>) result;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Person convertPerson(ResultSet rs) throws SQLException {
		
		return new Person(rs.getInt("memberid"), rs.getString("member_name"), rs.getString("major"),
							rs.getString("phone"), rs.getString("email"));
	}
}
