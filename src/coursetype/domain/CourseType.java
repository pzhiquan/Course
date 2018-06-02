package coursetype.domain;

public class CourseType {
	private String courseTypeID;//主键
	private  String courseTypeName;//课程类别名
	public String getCourseTypeID() {
		return courseTypeID;
	}
	public void setCourseTypeID(String courseTypeID) {
		this.courseTypeID = courseTypeID;
	}
	public String getCourseTypeName() {
		return courseTypeName;
	}
	public void setCourseTypeName(String courseTypeName) {
		this.courseTypeName = courseTypeName;
	}
}
