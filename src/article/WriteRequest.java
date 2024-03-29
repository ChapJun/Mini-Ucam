package article;

import java.util.Map;

public class WriteRequest {

	private Writer writer;
	private String title;
	private String content;
	
	public WriteRequest(Writer writer, String title, String content) {
		
		this.writer = writer;
		this.title = title;
		this.content = content;
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
	
	public void validate(Map<String, Boolean> errors) {
		
		if(title == null || title.trim().isEmpty()) { // 제목이 없을 때
			errors.put("title", Boolean.TRUE);
		}
	}
}
