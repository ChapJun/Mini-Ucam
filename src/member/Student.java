package member;

public class Student {
	private String id;
	private String name;
	private String password;
	private String phone;
	private String email;
	private String major;
	
	public Student(String id, String name, String pw, String phone, String email, String major) {
		
		this.id = id;
		this.name = name;
		password = pw;
		this.email = email;
		this.phone = phone;
		this.major = major;
	}
	
	public String getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getMajor() {
		return major;
	}
	
	public boolean matchPassword(String pwd) {
		return password.equals(pwd);
	}
}
