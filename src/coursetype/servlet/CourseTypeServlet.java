package coursetype.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.domain.Admin;

import coursetype.domain.CourseType;
import coursetype.service.CourseTypeService;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class CourseTypeServlet extends BaseServlet {
	private CourseTypeService coursetypeService = new CourseTypeService();
	/**
	 * 查询所有分类，保存在Session中
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2. 保存到request中，转发到left.jsp
		 */
		List<CourseType> courseTypeName = coursetypeService.findAll();
		HttpSession session = req.getSession();
		session.setAttribute("courseTypeName", courseTypeName);
		return "/DeptServlet?method=findAll";
	}
	/**
	 * 查询所有分类,返回
	 */
	public String findAllB(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 2. 保存到request中，转发到left.jsp
		 */
		List<CourseType> coursetypeName = coursetypeService.findAll();
		req.setAttribute("coursetypeName", coursetypeName);
		return "/jsps/AdminCourseType.jsp";
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
		String courseTypeID = req.getParameter("courseTypeID");
		
		coursetypeService.delete(courseTypeID);//删除数据库的记录
		
		req.setAttribute("msg", "删除分类成功！");
		return "/CourseTypeServlet?method=findAllB";
	}

}
