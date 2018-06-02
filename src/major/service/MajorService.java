package major.service;

import java.sql.SQLException;
import java.util.List;

import subject.domain.Subject;

import major.dao.MajorDao;
import major.domain.Major;


public class MajorService {
	private MajorDao majorDao = new MajorDao();
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Major> findAll() {
		try {
			return majorDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 修改专业
	 * @return
	 */
	public void change(Major major) {
		try {
			majorDao.change(major);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 增加专业
	 * @return
	 */
	public void add(Major major) {
		try {
			majorDao.add(major);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除专业
	 * @param courseId
	 */
	public void delete(String majorID) {
		try {
			majorDao.delete(majorID);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
