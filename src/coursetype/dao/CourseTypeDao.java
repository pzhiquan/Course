package coursetype.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import org.apache.commons.dbutils.handlers.BeanListHandler;



import coursetype.domain.CourseType;

import cn.itcast.jdbc.TxQueryRunner;

public class CourseTypeDao {
	private QueryRunner qr = new TxQueryRunner();
	public List<CourseType> findAll() throws SQLException {
		/*
		 * 1. 查询出所有课程类别
		 */
		String sql = "select * from coursetype";
		return qr.query(sql,new BeanListHandler<CourseType>(CourseType.class));
		
	}
	/**
	 * 修改课程类别
	 * @param courseType
	 * @throws SQLException 
	 */
	public void change(CourseType courseType) throws SQLException {
		String sql = "update coursetype set CourseTypeName=? where CourseTypeID=?";
		Object[] params = {courseType.getCourseTypeName(),courseType.getCourseTypeID()};
		qr.update(sql, params);
	}
	/**
	 * 增加课程类别
	 * @param courseType
	 * @throws SQLException 
	 */
	public void add(CourseType courseType) throws SQLException {
		String sql = "insert into coursetype (CourseTypeID,CourseTypeName) value(?,?)";
		Object[] params = {courseType.getCourseTypeID(),courseType.getCourseTypeName()};
		qr.update(sql, params);
	}
	/**
	 * 删除课程类别
	 * @param courseId
	 * @throws SQLException 
	 */
	public void delete(String courseTypeID) throws SQLException {
		String sql = "delete from coursetype where CourseTypeID=?";
		qr.update(sql, courseTypeID);
	}
}
