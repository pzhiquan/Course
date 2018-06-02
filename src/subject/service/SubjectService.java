package subject.service;

import java.sql.SQLException;
import java.util.List;

import coursetype.domain.CourseType;

import subject.dao.SubjectDao;
import subject.domain.Subject;

public class SubjectService {
	private SubjectDao subjectDao = new SubjectDao();
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Subject> findAll() {
		try {
			return subjectDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 修改学科门类
	 * @return
	 */
	public void change(Subject subject) {
		try {
			subjectDao.change(subject);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 增加学科门类
	 * @return
	 */
	public void add(Subject subject) {
		try {
			subjectDao.add(subject);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除学科门类
	 * @param courseId
	 */
	public void delete(String subjectID) {
		try {
			subjectDao.delete(subjectID);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
}
