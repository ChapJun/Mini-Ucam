package course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.JdbcUtil;

public class CourseDao {

	public List<Course> selectById(Connection conn, int id) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement("select course.course_no, course_name, member_name, room_name, lecture_time "
					+ "from ucampus.course, ucampus.instructor, ucampus.section "
					+ "where course.course_no = section.course_no AND course.teacher_id = instructor.memberid "
					+ "AND student_id = ? order by course.course_no");
			
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			List<Course> result = new ArrayList<>();
			while(rs.next()) {
				result.add(convertCourse(rs));
			}
			
			return result;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Course convertCourse(ResultSet rs) throws SQLException {
		
		return new Course(rs.getInt("course_no"), rs.getString("course_name"), rs.getString("member_name"), rs.getString("room_name"),
						  rs.getString("lecture_time"));
	}
}
