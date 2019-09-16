package lecture;

import java.util.Date;

public class Article {

	private Integer number;
	private Writer writer;
	private String title;
	private Date regDate;
	private Date modifiedDate;
	private int readCount;
	private int course_no;
	
	public Article(Integer number, Writer writer, String title, Date regDate, Date modifiedDate, int readCount, int course_no) {
	
		this.number = number;
		this.writer = writer;
		this.title = title;
		this.regDate = regDate;
		this.modifiedDate = modifiedDate;
		this.readCount = readCount;
		this.course_no = course_no;
	}

	public Integer getNumber() {
		return number;
	}

	public Writer getWriter() {
		return writer;
	}

	public String getTitle() {
		return title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public int getReadCount() {
		return readCount;
	}
	
	public int getCourseNo() {
		return course_no;
	}
	
	
}
