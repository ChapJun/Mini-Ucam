package article;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;

public class ListArticleHandler implements CommandHandler {

	private ListArticleService listService = new ListArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String pageNoVal = request.getParameter("pageNo");
		
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		ArticlePage articlePage = listService.getArticlePage(pageNo);
		request.setAttribute("articlePage", articlePage);
		return "/WEB-INF/view/listArticle.jsp";
	}

}
