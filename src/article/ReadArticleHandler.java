package article;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;

public class ReadArticleHandler implements CommandHandler {

	private ReadArticleService readService = new ReadArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String noVal = request.getParameter("no");
		int articleNum = Integer.parseInt(noVal);
		
		try {
			
			ArticleData articleData = readService.getArticle(articleNum, true);
			request.setAttribute("articleData", articleData);
			return "/WEB-INF/view/readArticle.jsp";
			
		} catch(ArticleContentNotFoundException | ArticleNotFoundException e) {
			
			request.getServletContext().log("no article", e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}

	
}
