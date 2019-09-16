package auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		
		response.sendRedirect("login.do");
		return null;
	}

	
}
