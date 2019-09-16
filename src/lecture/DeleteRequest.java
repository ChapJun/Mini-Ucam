package lecture;

public class DeleteRequest {

	private String userId;
	private int articleNumber;
	
	public DeleteRequest(String id, int no) {
		
		userId = id;
		articleNumber = no;
	}
	public String getUserId() {
		return userId;
	}
	public int getArticleNumber() {
		return articleNumber;
	}
	
	
}
