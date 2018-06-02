package admin.servlet;

import java.io.IOException;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import admin.domain.Admin;
import admin.service.AdminService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;



public class AdminServlet extends BaseServlet {
	private AdminService adminService=new AdminService();
	/**
	 * ajax用户名是否注册校验
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateLoginname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取用户名
		 */
		String loginname = req.getParameter("loginname");
		/*
		 * 2. 通过service得到校验结果
		 */
		boolean b = adminService.ajaxValidateLoginname(loginname);
		/*
		 * 3. 发给客户端
		 */
		resp.getWriter().print(b);
		return null;
	}
	/**
	 * 登录功能
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login (HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		/*
		 * 1. 封装表单数据到Admin
		 */
		Admin formAdmin = CommonUtils.toBean(req.getParameterMap(), Admin.class);
		
		
		/*
		 * 2. 调用AdminService#login()方法
		 */
		Admin admin = AdminService.login(formAdmin);
		/*
		 * 3. 开始判断
		 */
		if(admin == null) {
			req.setAttribute("msg", "用户名或密码错误！");
			req.setAttribute("admin", formAdmin);
			return "/index.jsp";
		} else {
				// 保存用户到session
				req.getSession().setAttribute("sessionUser", admin);
				// 获取用户名保存到cookie中
				String adminname = admin.getAdminName();
				adminname = URLEncoder.encode(adminname, "utf-8");
				Cookie cookie = new Cookie("adminName", adminname);
				cookie.setMaxAge(60 * 60 * 24 * 10);//保存10天
				resp.addCookie(cookie);
				return "/CourseServlet?method=findByAllM&all=1";//重定向到管理员页
			}
		}



/**
 * 退出功能
 * @param req
 * @param resp
 * @return
 * @throws ServletException
 * @throws IOException
 */
		public String quit(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			req.getSession().invalidate();
			return "/index.jsp";
		}
		/**
		 * 查询全部管理员信息功能
		 * @param req
		 * @param resp
		 * @return
		 * @throws ServletException
		 * @throws IOException
		 */	
		
		public String findadmin(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			List<Admin> admin = adminService.findadmin();
			req.setAttribute("admin", admin);
			return "/jsps/admin.jsp";

		}
		/**
		 * 删除管理员
		 * @param req
		 * @param resp
		 * @return
		 * @throws ServletException
		 * @throws IOException
		 */
		public String delete(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			String adminId = req.getParameter("adminId");
			
			adminService.delete(adminId);//删除数据库的记录
			
			req.setAttribute("msg", "删除管理员成功！");
			return "/AdminServlet?method=findadmin&adminname=1";
		}
}
