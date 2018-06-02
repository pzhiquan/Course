package subject.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import subject.domain.Subject;
import subject.service.SubjectService;
import cn.itcast.servlet.BaseServlet;

public class SubjectServlet extends BaseServlet {
	private SubjectService subjectService = new SubjectService();
	/**
	 * 查询所有分类，保存在Session中
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 
		 */
		List<Subject> subjectName =subjectService.findAll();
		HttpSession session = req.getSession();
		session.setAttribute("subjectName", subjectName);
		
		return "/CourseServlet?method=findByAll&all=1";
		
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
		List<Subject> subjectName = subjectService.findAll();
		req.setAttribute("SubjectName", subjectName);
		return "/jsps/AdminSubject.jsp";
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
		String subjectID = req.getParameter("subjectID");
		
		subjectService.delete(subjectID);//删除数据库的记录
		
		req.setAttribute("msg", "删除学科成功！");
		return "/SubjectServlet?method=findAllB";
	}
}
