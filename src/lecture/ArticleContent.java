package lecture;

public class ArticleContent {

	private Integer number;
	private String content;
	private String path;
	
	public ArticleContent(Integer number, String content, String path) {
		
		this.number = number;
		this.content = content;
		this.path = path;
	}

	public Integer getNumber() {
		return number;
	}

	public String getContent() {
		return content;
	}
	
	public String getPath() {
		return path;
	}
	
}
