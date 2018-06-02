package major.dao;

import java.sql.SQLException;
import java.util.List;

import major.domain.Major;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;



import cn.itcast.jdbc.TxQueryRunner;


public class MajorDao {
	private QueryRunner qr = new TxQueryRunner();
	public List<Major> findAll() throws SQLException {
		/*
		 * 1. 查询出所有专业
		 */
		String sql = "select * from major";
		return qr.query(sql,new BeanListHandler<Major>(Major.class));
		
	}
	/**
	 * 修改专业
	 * @param 
	 * @throws SQLException 
	 */
	public void change(Major major) throws SQLException {
		String sql = "update major set MajorName=? where MajorID=?";
		Object[] params = {major.getMajorName(),major.getMajorID()};
		qr.update(sql, params);
	}
	/**
	 * 增加专业
	 * @param 
	 * @throws SQLException 
	 */
	public void add(Major major) throws SQLException {
		String sql = "insert into major (MajorID,MajorName) value(?,?)";
		Object[] params = {major.getMajorID(),major.getMajorName()};
		qr.update(sql, params);
	}
	/**
	 * 删除专业
	 * @param 
	 * @throws SQLException 
	 */
	public void delete(String majorID) throws SQLException {
		String sql = "delete from major where MajorID=?";
		qr.update(sql, majorID);
	}
}
