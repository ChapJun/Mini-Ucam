package lecture;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.User;
import mvc.CommandHandler;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteArticleHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/WEB-INF/view/newLectureForm.jsp";
	private WriteArticleService writeService = new WriteArticleService();

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
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		User user = (User)req.getSession().getAttribute("authUser");
		
		WriteRequest writeReq = createWriteRequest(user, req);
		
		writeReq.validate(errors);
		
		if(!errors.isEmpty())
			return FORM_VIEW;
		
		int newArticleNo = writeService.write(writeReq);
		
		req.setAttribute("newArticleNo", newArticleNo);
		req.setAttribute("subject", writeReq.getCourseNo());
		
		return "/WEB-INF/view/newLectureSuccess.jsp";
	}
	
	private WriteRequest createWriteRequest(User user, HttpServletRequest req) {
		
		int maxSize = 10 * 1024 * 1024; // 10MB
		String saveDir = req.getSession().getServletContext().getRealPath("/fileBox");
		String encType = "UTF-8";

		try {
			
			File dir = new File(saveDir);
			
			if(!dir.exists())
				dir.mkdirs();
		
			MultipartRequest multipartRequest = new MultipartRequest(req, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
			
			Enumeration fileNames = multipartRequest.getFileNames();
			
			while(fileNames.hasMoreElements()) {
				
				String fileInput = (String)fileNames.nextElement();
				String fileName = multipartRequest.getFilesystemName(fileInput);
				
				if(fileName != null) {
					
					File newFile = multipartRequest.getFile(fileInput);
					
					if(!newFile.exists())
						newFile.createNewFile();
					
					return new WriteRequest(new Writer(user.getId(), user.getName()), multipartRequest.getParameter("title")
							, multipartRequest.getParameter("content"), fileName, multipartRequest.getParameter("subject"));
					
					
				} 
			}
			
			return new WriteRequest(new Writer(user.getId(), user.getName()), multipartRequest.getParameter("title")
					, multipartRequest.getParameter("content"), "", multipartRequest.getParameter("subject"));
				
		} catch (IOException e) {
			
			e.printStackTrace();
			return null;
		}
				
		
	}
}
