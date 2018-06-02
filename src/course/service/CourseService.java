package course.service;

import java.sql.SQLException;
import java.util.List;


import course.dao.CourseDao;
import course.domain.Course;

public class CourseService {
	private CourseDao courseDao=new CourseDao();
	/**
	 * 按课程类别查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findByCtname(String ctname, int pc) {
		try {
			return courseDao.findByCtname(ctname, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 按学科门类查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findBySubject(String subject, int pc) {
		try {
			return courseDao.findBySubject(subject, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 按学院查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findByDept(String dept, int pc) {
		try {
			return courseDao.findByDept(dept, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 按专业查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findByMajor(String major, int pc) {
		try {
			return courseDao.findByMajor(major, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 搜索关键字模糊查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findBySearchName(String searchname, int pc) {
		try {
			return courseDao.findBySearchName(searchname, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 按查全部
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findByAll(String all, int pc) {
		try {
			return courseDao.findByAll(all, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 按最新查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findByDate(int pc) {
		try {
			return courseDao.findByDate(pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 按热门查
	 * @param bname
	 * @param pc
	 * @return
	 */
	public page.PageBean<Course> findByPageView(int pc) {
		try {
			return courseDao.findByPageView(pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 添加课程
	 * @param book
	 */
	public void add(Course course) {
		try {
			courseDao.add(course);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 修改课程
	 * @param course
	 */
	public void edit(Course course) {
		try {
			courseDao.edit(course);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除课程
	 * @param courseId
	 */
	public void delete(String courseId) {
		try {
			courseDao.delete(courseId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
