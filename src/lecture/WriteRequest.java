package lecture;

import java.util.Map;

public class WriteRequest {

	private Writer writer;
	private String title;
	private String content;
	private String path;
	private int course_No;
	
	public WriteRequest(Writer writer, String title, String content, String path, String course_No) {
		
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.path = path;
		this.course_No = Integer.parseInt(course_No);
	}

	public Writer getWriter() {
		return writer;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	
	public String getPath() {
		return path;
	}
	
	public int getCourseNo() {
		return course_No;
	}
	
	public void validate(Map<String, Boolean> errors) {
		
		if(title == null || title.trim().isEmpty()) { // 제목이 없을 때
			errors.put("title", Boolean.TRUE);
		}
	}
}
