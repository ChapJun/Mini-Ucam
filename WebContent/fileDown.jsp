<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.net.URLDecoder" %>
    <%@ page import = "java.io.File" %>
    <%@ page import = "java.io.FileInputStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일다운</title>
</head>
<body>

<%
	String file_name = URLDecoder.decode(request.getParameter("file_name"), "UTF-8");
	String saveDir = request.getSession().getServletContext().getRealPath("/fileBox");
	
	String file_Path = saveDir + "\\" + file_name;
	
	
	File outputFile = new File(file_Path);
	
	byte[] temp = new byte[1024*1024*10]; // 10M
	
	FileInputStream in = new FileInputStream(outputFile);
	
	String sMimeType = getServletContext().getMimeType(file_Path);
	
	if(sMimeType == null) {
	
		sMimeType = "application/octet-stream";
	}
	
	response.setContentType(sMimeType);
	
	String sEncoding = new String(file_name.getBytes("UTF-8"),"8859_1");
	
	String AA = "Content-Disposition";
	String BB = "attachment;filename="+sEncoding;
	
	response.setHeader(AA, BB);
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead = 0;
	
	while((numRead = in.read(temp, 0, temp.length)) != -1) {
		
		out2.write(temp, 0, numRead);
	}
	
	out2.flush();
	out2.close();
	in.close();
%>

<%= file_Path %>
</body>
</html>