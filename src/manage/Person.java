package manage;

public class Person {

	private int student_id;
	private String student_name;
	private String major;
	private String phone;
	private String email;
	
	public Person(int id, String name, String major, String phone, String email) {
		
		student_id = id;
		student_name = name;
		this.major = major;
		this.phone = phone;
		this.email = email;
		
	}

	public int getStudent_id() {
		return student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public String getMajor() {
		return major;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}
	
	
}
