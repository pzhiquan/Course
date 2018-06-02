package major.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import subject.domain.Subject;

import major.domain.Major;
import major.service.MajorService;
import cn.itcast.servlet.BaseServlet;



public class MajorServlet extends BaseServlet {
	private MajorService majorService = new MajorService();
	/**
	 * 查询所有分类，保存在Session中
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类
		 * 
		 */
		List<Major> majorName =majorService.findAll();
		HttpSession session = req.getSession();
		
		session.setAttribute("majorName", majorName);
		return "/SubjectServlet?method=findAll";
		
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
		List<Major> majorName = majorService.findAll();
		req.setAttribute("MajorName", majorName);
		return "/jsps/AdminMajor.jsp";
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
		String majorID = req.getParameter("majorID");
		
		majorService.delete(majorID);//删除数据库的记录
		
		req.setAttribute("msg", "删除专业成功！");
		return "/MajorServlet?method=findAllB";
	}
}
