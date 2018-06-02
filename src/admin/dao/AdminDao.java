package admin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import course.domain.Course;


import admin.domain.Admin;


import cn.itcast.jdbc.TxQueryRunner;

public class AdminDao {
	private static QueryRunner qr = new TxQueryRunner();
	/**
	 * 按用户名和密码查询
	 * @param loginname
	 * @param loginpass
	 * @return
	 * @throws SQLException 
	 */
	public static Admin findByAdminnameAndPassword(String AdminName, String Password) throws SQLException {
		String sql = "select * from Admin where AdminName=? and Password=?";
		return qr.query(sql, new BeanHandler<Admin>(Admin.class), AdminName, Password);
	}
	/**
	 * 查询管理员信息
	 * @param admin
	 * @throws SQLException 
	 */
	public List<Admin> findadmin() throws SQLException {
		String sql = "select * from admin JOIN dept on admin.DeptID=dept.DeptID";
		return qr.query(sql, new BeanListHandler<Admin>(Admin.class));
	}
	/**
	 * 添加管理员
	 * @param admin
	 * @throws SQLException 
	 */
	public void add(Admin admin) throws SQLException {
		String sql = "insert into admin (AdminName,RealName,Password,DeptID,AdminID) value(?,?,?,?,?)";
		Object[] params = {admin.getAdminName(),admin.getRealName(),admin.getPassWord(),admin.getDeptId(),admin.getAdminId()};
		qr.update(sql, params);
	}
	
	
	
	/**
	 * 修改管理员信息
	 * @param admin
	 * @throws SQLException 
	 */
	public void change(Admin admin) throws SQLException {
		String sql = "update admin set AdminName=?,RealName=?,Password=?,DeptID=? where AdminID=?";
		Object[] params = {admin.getAdminName(),admin.getRealName(),admin.getPassWord(),admin.getDeptId(),admin.getAdminId()};
		qr.update(sql, params);
	}
	/**
	 * 删除管理员
	 * @param courseId
	 * @throws SQLException 
	 */
	public void delete(String adminId) throws SQLException {
		String sql = "delete from admin where AdminID=?";
		qr.update(sql, adminId);
	}
	/**
	 * 校验用户名是否注册
	 * @param loginname
	 * @return
	 * @throws SQLException 
	 */
	public boolean ajaxValidateLoginname(String loginname) throws SQLException {
		String sql = "select count(1) from admin where AdminName=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}
	
}
