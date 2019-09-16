package lecture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.CommandHandler;

public class ListArticleHandler implements CommandHandler {

	private ListArticleService listService = new ListArticleService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String pageNoVal = request.getParameter("pageNo");
		int course_No = Integer.parseInt(request.getParameter("subject"));
		
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		ArticlePage articlePage = listService.getArticlePage(pageNo, course_No);
		request.setAttribute("articlePage", articlePage);
		
		return "/WEB-INF/view/listLecture.jsp";
	}

}
