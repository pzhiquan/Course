package coursetype.service;

import java.sql.SQLException;
import java.util.List;


import coursetype.dao.CourseTypeDao;
import coursetype.domain.CourseType;



public class CourseTypeService {
	private CourseTypeDao courseTypeDao = new CourseTypeDao();
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<CourseType> findAll() {
		try {
			return courseTypeDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 修改课程类别
	 * @return
	 */
	public void change(CourseType courseType) {
		try {
			 courseTypeDao.change(courseType);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 增加课程类别
	 * @return
	 */
	public void add(CourseType courseType) {
		try {
			 courseTypeDao.add(courseType);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除课程类别
	 * @param courseId
	 */
	public void delete(String courseTypeID) {
		try {
			courseTypeDao.delete(courseTypeID);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
