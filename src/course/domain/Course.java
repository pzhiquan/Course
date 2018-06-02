package course.domain;

import java.sql.Date;

public class Course {
	private String courseId;//主键
	private String courseName;//课程名称
	private String courseType;//课程类别
	private String subject;//学科门类
	private String major;//专业
	private String teacher;//课程老师
	private String dept;//课程院别
	private String adress;//课程网址
	private int pageView;//课程网址
	private Date creatTime;//创建日期
	private String creatMan;//课程创建人（管理员）
	private String courseImages;//课程图片
	private String courseDescription;//课程简介
	public int getPageView() {
		return pageView;
	}
	public void setPageView(int pageView) {
		this.pageView = pageView;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public String getCreatMan() {
		return creatMan;
	}
	public void setCreatMan(String creatMan) {
		this.creatMan = creatMan;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseType() {
		return courseType;
	}
	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getCourseImages() {
		return courseImages;
	}
	public void setCourseImages(String courseImages) {
		this.courseImages = courseImages;
	}
	public String getCourseDescription() {
		return courseDescription;
	}
	public void setCourseDescription(String courseDescription) {
		this.courseDescription = courseDescription;
	}
}
