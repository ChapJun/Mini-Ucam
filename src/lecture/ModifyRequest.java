package lecture;

import java.util.Map;

public class ModifyRequest {

	private String  userId;
	private int articleNumber;
	private String title;
	private String content;
	private String path;
	private int sub_No;
	
	public ModifyRequest(String userId, int num, String title, String con, String pa, int sub) {
		
		this.userId = userId;
		this.articleNumber = num;
		this.title = title;
		this.content = con;
		path = pa;
		this.sub_No = sub;
	}

	public String getUserId() {
		return userId;
	}

	public int getArticleNumber() {
		return articleNumber;
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
	
	public int getSub() {
		return sub_No;
	}
	
	public void validate(Map<String, Boolean> errors) {
		
		if(title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}
