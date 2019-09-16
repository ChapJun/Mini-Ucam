package member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.DuplicateIdException;
import member.JoinRequest;
import member.JoinService;
import mvc.CommandHandler;

public class JoinHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/joinForm.jsp";
	private JoinService joinService = new JoinService();
	
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
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		
		JoinRequest joinReq = new JoinRequest();
		String seq = req.getParameter("seq");

		joinReq.setId(req.getParameter("id"));
		joinReq.setName(req.getParameter("name"));
		joinReq.setPassword(req.getParameter("password"));
		joinReq.setPhone(req.getParameter("phone"));
		joinReq.setEmail(req.getParameter("email"));
		joinReq.setMajor(req.getParameter("major"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if(!errors.isEmpty()) // 빈 값이거나 이미 있는 아이디 일 경우
			return FORM_VIEW;
		
		try {
			joinService.join(joinReq, seq);
			return "/WEB-INF/view/joinSuccess.jsp";
		} catch (DuplicateIdException e) {
			// TODO: handle exception
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
		
	}
}
