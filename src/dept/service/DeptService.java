package dept.service;

import java.sql.SQLException;
import java.util.List;

import major.domain.Major;



import dept.dao.DeptDao;
import dept.domain.Dept;



public class DeptService {
	private DeptDao deptDao = new DeptDao();
	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Dept> findAll() {
		try {
			return deptDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 查询单个单位
	 * @return
	 */
	public Dept findByName(String deptName) {
		try {
			return deptDao.findByName(deptName);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 修改学院
	 * @return
	 */
	public void change(Dept dept) {
		try {
			deptDao.change(dept);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 增加学院
	 * @return
	 */
	public void add(Dept dept) {
		try {
			deptDao.add(dept);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除学院
	 * @param courseId
	 */
	public void delete(String deptID) {
		try {
			deptDao.delete(deptID);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
