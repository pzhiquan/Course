package admin.service;

import java.sql.SQLException;
import java.util.List;

import admin.dao.AdminDao;
import admin.domain.Admin;



public class AdminService {
	AdminDao adminDao=new AdminDao();
	/**
	 * 登录功能
	 * @param user
	 * @return
	 */
	public static Admin login(Admin admin) {
		try {
			return AdminDao.findByAdminnameAndPassword(admin.getAdminName(), admin.getPassWord());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 查管理员
	 * @param courseId
	 * @return 
	 */
	public List<Admin> findadmin() {
		try {
			return adminDao.findadmin();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 添加管理员
	 * @param courseId
	 * @return 
	 */
	public void add(Admin admin) {
		try {
			 adminDao.add(admin);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 修改管理员
	 * @param courseId
	 * @return 
	 */
	public void change(Admin admin) {
		try {
			 adminDao.change(admin);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除管理员
	 * @param adminId
	 */
	public void delete(String adminId) {
		try {
			adminDao.delete(adminId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 管理员用户名注册校验
	 * @param loginname
	 * @return
	 */
	public boolean ajaxValidateLoginname(String loginname) {
		try {
			return adminDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
