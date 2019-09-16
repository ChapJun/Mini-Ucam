package article;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;

public class DeleteArticleHandler implements CommandHandler {

	private DeleteService deleteService = new DeleteService();
	private ReadArticleService readService = new ReadArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			
		
			String noVal = request.getParameter("no");
			int articleNum = Integer.parseInt(noVal);
		
			ArticleData articleData = readService.getArticle(articleNum, false);
			User authUser = (User) request.getSession().getAttribute("authUser");
		
			if(!canDelete(authUser, articleData)) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			DeleteRequest deq = new DeleteRequest(authUser.getId(), articleNum);
			deleteService.delete(deq);
			
			return "/WEB-INF/view/DeleteSuccess.jsp";
		
		} catch (ArticleNotFoundException e) {
			
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch(PermissionDeniedException e) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
	}
	
	private boolean canDelete(User authUser, ArticleData articleData) {
		
		String writer = articleData.getArticle().getWriter().getId();
		return authUser.getId().equals(writer);
	}

}
