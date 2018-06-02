package subject.dao;



import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import coursetype.domain.CourseType;

import subject.domain.Subject;

import cn.itcast.jdbc.TxQueryRunner;

public class SubjectDao {
	private QueryRunner qr = new TxQueryRunner();
	public List<Subject> findAll() throws SQLException {
		/*
		 * 1. 查询出所有学科门类
		 */
		String sql = "select * from subject";
		return qr.query(sql,new BeanListHandler<Subject>(Subject.class));
	}
	/**
	 * 修改学科门类
	 * @param 
	 * @throws SQLException 
	 */
	public void change(Subject subject) throws SQLException {
		String sql = "update subject set SubjectName=? where SubjectID=?";
		Object[] params = {subject.getSubjectName(),subject.getSubjectID()};
		qr.update(sql, params);
	}
	/**
	 * 增加学科门类
	 * @param 
	 * @throws SQLException 
	 */
	public void add(Subject subject) throws SQLException {
		String sql = "insert into subject (SubjectID,SubjectName) value(?,?)";
		Object[] params = {subject.getSubjectID(),subject.getSubjectName()};
		qr.update(sql, params);
	}
	/**
	 * 删除学科门类
	 * @param 
	 * @throws SQLException 
	 */
	public void delete(String subjectID) throws SQLException {
		String sql = "delete from subject where SubjectID=?";
		qr.update(sql, subjectID);
	}
}
