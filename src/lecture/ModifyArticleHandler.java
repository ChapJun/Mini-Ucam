package lecture;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Enumeration;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.User;
import mvc.CommandHandler;
import sun.font.CreatedFontTracker;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ModifyArticleHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/modifyLecture.jsp";
	
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
			
			String subno_Val = req.getParameter("subject");
			int sub_No = Integer.parseInt(subno_Val);
			
			ArticleData articleData = readService.getArticle(no, false);
			User authUser = (User) req.getSession().getAttribute("authUser");
			
			if(!canModify(authUser, articleData)) {
				res.sendError(HttpServletResponse.SC_FORBIDDEN);
				return null;
			}
			
			ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, articleData.getArticle().getTitle(),
					articleData.getContent().getContent(), articleData.getContent().getPath(), sub_No);
			
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
		
		ModifyRequest modReq = createModifyRequest(authUser, req);
		
		req.setAttribute("modReq", modReq);
		req.setAttribute("subject", modReq.getSub());
		Map<String, Boolean> errors = new HashMap<>();
		
		req.setAttribute("errors", errors);
		
		modReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			modifyService.modify(modReq);
			return "/WEB-INF/view/modifyLectureSuccess.jsp";
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch(PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
	}
		
		
	private ModifyRequest createModifyRequest(User user, HttpServletRequest req) {
		
		int maxSize = 10 * 1024 * 1024; // 10MB
		String saveDir = req.getSession().getServletContext().getRealPath("/fileBox");
		String encType = "UTF-8";
		
		try {
			
			MultipartRequest multi = new MultipartRequest(req, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
			
			String noVal = multi.getParameter("no");
			int no = Integer.parseInt(noVal);
			
			String subno_Val = multi.getParameter("subject");
			int sub_No = Integer.parseInt(subno_Val);
			
			File dir = new File(saveDir);
			
			if(!dir.exists())
				dir.mkdirs();
			
			Enumeration fileNames = multi.getFileNames();
			
			while(fileNames.hasMoreElements()) {  // 수정할거라면
				
				String fileInput = (String)fileNames.nextElement();
				String fileName = multi.getFilesystemName(fileInput);
				
				if(fileName != null) {
					
					File newFile = multi.getFile(fileInput);
					
					if(!newFile.exists())
						newFile.createNewFile();
					
					if(multi.getParameter("origin") != null) {
						
						String originFile = req.getSession().getServletContext().getRealPath("/fileBox")
								+ "\\" + multi.getParameter("origin");
					
						
						File origin = new File(originFile);
						
						if(origin.exists())
							origin.delete();
					}
				
					
					return new ModifyRequest(user.getId(), no, multi.getParameter("title"), 
							multi.getParameter("content"), fileName, sub_No);
				
				}
			
			}
			
			if(multi.getParameter("origin") == null) 
				return new ModifyRequest(user.getId(), no, multi.getParameter("title"), 
						multi.getParameter("content"), "", sub_No);
			else
				return new ModifyRequest(user.getId(), no, multi.getParameter("title"), 
					multi.getParameter("content"), multi.getParameter("origin"), sub_No);
			
		} catch (IOException e) {
				
				e.printStackTrace();
				return null;
			
		}
	
	}
			
}
