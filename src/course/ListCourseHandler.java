package course;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.CommandHandler;
import auth.User;
public class ListCourseHandler implements CommandHandler {
	
	private ListCourseService courseService = new ListCourseService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		try {
			
			HttpSession session = request.getSession(false);
			
			if(session == null) {
				return null;
			}
			
			 User user = (User) session.getAttribute("authUser");
			
			List<Course> course = courseService.getCourseList(Integer.getInteger(user.getId()));
			request.setAttribute("course", course);
			return  "/WEB-INF/view/listCourse.jsp";
			
		} catch(authUserNotFoundException e) {
			return null;
		}
		
	}
}
