package manage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.CommandHandler;
import auth.User;

public class ListPersonHandler implements CommandHandler {

	private ListPersonService personService = new ListPersonService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			
			int no = Integer.parseInt(request.getParameter("subject"));
			User user = (User) request.getSession().getAttribute("authUser");
			
			List<Person> content = personService.getPersonList(Integer.parseInt(user.getId()), no);
			request.setAttribute("person", content);
			return  "/WEB-INF/view/listPerson.jsp";
			
		} catch (Exception e) {
			
			return null;
		}
	}
}
