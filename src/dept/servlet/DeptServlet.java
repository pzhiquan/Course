package dept.servlet;

import java.io.IOException;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import major.domain.Major;

import cn.itcast.servlet.BaseServlet;
import dept.domain.Dept;
import dept.service.DeptService;


public class DeptServlet extends BaseServlet {
	private DeptService deptService = new DeptService();
	/**
	 * 查询所有分类，保存在Session中
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2. 保存到request中，转发到left.jsp
		 */
		List<Dept> deptName =deptService.findAll();
		HttpSession session = req.getSession();
		session.setAttribute("deptName", deptName);
		return "/MajorServlet?method=findAll";
	}
	/**
	 * 查询所有分类,返回
	 */
	public String findAllB(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2.
		 */
		List<Dept> deptName = deptService.findAll();
		req.setAttribute("DeptName", deptName);
		return "/jsps/AdminDept.jsp";
	}
	
	/**
	 * 删除分类
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String deptID = req.getParameter("deptID");
		
		deptService.delete(deptID);//删除数据库的记录
		
		req.setAttribute("msg", "删除学院成功！");
		return "/DeptServlet?method=findAllB";
	}
}
