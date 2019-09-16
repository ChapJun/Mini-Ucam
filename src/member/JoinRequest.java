package member;

import java.util.Map;

public class JoinRequest {

	private String id;
	private String name;
	private String password;
	private String phone;
	private String email;
	private String major;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	public void validate(Map <String, Boolean> errors) {
		
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, phone, "phone");
		checkEmpty(errors, email, "email");
		checkEmpty(errors, major, "major");
		
	}
	
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
	
		if(value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
	}
	
}
