package dept.dao;

import java.sql.SQLException;
import java.util.List;

import major.domain.Major;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.jdbc.TxQueryRunner;
import dept.domain.Dept;


public class DeptDao {
	private QueryRunner qr = new TxQueryRunner();
	public List<Dept> findAll() throws SQLException {
		/*
		 * 1. 查询出所有学院
		 */
		String sql = "select * from dept";
		return qr.query(sql,new BeanListHandler<Dept>(Dept.class));
		
	}
	public Dept findByName(String deptName) throws SQLException {
		/*
		 * 1. 查询出所有学院
		 */
		String sql = "select * from dept where DeptName = ?";
		return qr.query(sql,new BeanHandler<Dept>(Dept.class),deptName);
		
	}
	/**
	 * 修改学院
	 * @param 
	 * @throws SQLException 
	 */
	public void change(Dept dept) throws SQLException {
		String sql = "update dept set DeptName=? where DeptID=?";
		Object[] params = {dept.getDeptName(),dept.getDeptID()};
		qr.update(sql, params);
	}
	/**
	 * 增加学院
	 * @param 
	 * @throws SQLException 
	 */
	public void add(Dept dept) throws SQLException {
		String sql = "insert into dept (DeptID,DeptName) value(?,?)";
		Object[] params = {dept.getDeptID(),dept.getDeptName()};
		qr.update(sql, params);
	}
	/**
	 * 删除学院
	 * @param 
	 * @throws SQLException 
	 */
	public void delete(String deptID) throws SQLException {
		String sql = "delete from dept where DeptID=?";
		qr.update(sql, deptID);
	}
}
