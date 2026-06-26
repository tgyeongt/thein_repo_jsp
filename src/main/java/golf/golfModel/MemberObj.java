package golf.golfModel;

//regist_month, c_no, c_name, class_name, class_area, tuition, grade
public class MemberObj {
	private String regist_month;
	private String c_no;
	private String c_name;
	private String class_name;
	private String class_area;
	private int tuition;
	private String grade;

	public String getRegist_month() {
		return regist_month;
	}
	public String getC_no() {
		return c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public String getClass_area() {
		return class_area;
	}
	public int getTuition() {
		return tuition;
	}
	public String getGrade() {
		return grade;
	}
	public void setRegist_month(String regist_month) {
		this.regist_month = regist_month;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public void setClass_area(String class_area) {
		this.class_area = class_area;
	}
	public void setTuition(int tuition) {
		this.tuition = tuition;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}


}
