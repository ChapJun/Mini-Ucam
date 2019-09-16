package auth;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;
import course.ListCourseService;
import course.authUserNotFoundException;
import course.Course;
import course.InsCourse;
import course.InsListCourseService;

public class LoginHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
	private LoginService loginService = new LoginService();
	private ListCourseService courseSerivce = new ListCourseService();
	private InsListCourseService inscourseService = new InsListCourseService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(request.getMethod().equalsIgnoreCase("GET")) { // 대소문자 상관 없는 equals
			return processForm(request, response);
		} else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		String seq = trim(req.getParameter("seq"));
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		
		Map<String, Boolean> errors = new HashMap<>();
		
		req.setAttribute("errors", errors);
		
		if(id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		
		if(password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			
			User user = loginService.login(id, password, seq);
			req.getSession().setAttribute("authUser", user);
			
			if(seq.equals("교수")) {
				
				List<InsCourse> course = inscourseService.getCourseList(Integer.parseInt(user.getId()));
				
				req.getSession().setAttribute("course", course);
				res.sendRedirect(req.getContextPath() + "/main.jsp"); // professor
			}
			else {
				
				List<Course> course = courseSerivce.getCourseList(Integer.parseInt(user.getId()));
				
				req.getSession().setAttribute("course", course);
				res.sendRedirect(req.getContextPath() + "/main2.jsp"); // student
					
			}
			return null;
			
		} catch(LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		} catch(authUserNotFoundException e) {
			return FORM_VIEW;
		}
		
	}
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
	
}
