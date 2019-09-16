package course;

public class InsCourse {
	
	private int course_no;
	private String course_name;
	private String room_name;
	private String lecture_time;
	
	public InsCourse(int no, String course, String room, String time) {
		
		course_no = no;
		course_name = course;
		room_name = room;
		lecture_time = time;
	}
	
	public int getCourse_no() {
		return course_no;
	}
	public String getCourse_name() {
		return course_name;
	}

	public String getRoom_name() {
		return room_name;
	}

	public String getLecture_time() {
		return lecture_time;
	}
}
