package article;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;

public class ModifyArticleHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/modifyForm.jsp";
	
	private ReadArticleService readService = new ReadArticleService();
	private ModifyArticleService modifyService = new ModifyArticleService();
	
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
	
	
	private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		try {
			
			String noVal = req.getParameter("no");
			int no = Integer.parseInt(noVal);
			
			ArticleData articleData = readService.getArticle(no, false);
			User authUser = (User) req.getSession().getAttribute("authUser");
			
			if(!canModify(authUser, articleData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, articleData.getArticle().getTitle(), articleData.getContent());
			
			req.setAttribute("modReq", modReq);
			return FORM_VIEW;
			
			
		} catch(ArticleNotFoundException e) {
			
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
	private boolean canModify(User authUser, ArticleData articleData) {
		
		String writer = articleData.getArticle().getWriter().getId();
		return authUser.getId().equals(writer);
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		User authUser = (User) req.getSession().getAttribute("authUser");
		String noVal = req.getParameter("no");
		int no = Integer.parseInt(noVal);
		
		ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, req.getParameter("title"), req.getParameter("content"));
		req.setAttribute("modReq", modReq);
		
		Map<String, Boolean> errors = new HashMap<>();
		
		req.setAttribute("errors", errors);
		
		modReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			modifyService.modify(modReq);
			return "/WEB-INF/view/modifySuccess.jsp";
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch(PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}

}
