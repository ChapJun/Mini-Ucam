package auth;

public class User {

	private String id;
	private String name;
	private String seq;
	
	public User(String id, String name, String seq) {
		this.id = id;
		this.name = name;
		this.seq = seq;
	}
	
	public String getId() {
		return this.id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getSeq() {
		return seq;
	}
}
