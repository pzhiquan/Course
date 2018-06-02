package course.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import course.domain.Course;
import course.service.CourseService;


import cn.itcast.servlet.BaseServlet;
import dept.domain.Dept;

public class CourseServlet extends BaseServlet {
	private CourseService courseService=new CourseService();
	/**
	 * 获取当前页码
	 * @param req
	 * @return
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if(param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch(RuntimeException e) {}
		}
		return pc;
	}
	
	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 * @param req
	 * @return
	 */
	/*
	 * http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
	 * /goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index = url.lastIndexOf("&pc=");
		if(index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	
	/**
	 * 按课程分类查
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCtname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String ctname = new String(req.getParameter("ctname").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByCtname(ctname, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setLabel(ctname);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/course-list.jsp";
	}
	/**
	 * 按学科门类查
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findBySubject(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String subject = new String(req.getParameter("subject").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findBySubject(subject, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setLabel(subject);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/course-list.jsp";
	}
	/**
	 * 按学院查
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByDept(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String dept = new String(req.getParameter("dept").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByDept(dept, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setLabel(dept);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/course-list.jsp";
	}
	
	/**
	 * 按专业查
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByMajor(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String major = new String(req.getParameter("major").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByMajor(major, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setLabel(major);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/course-list.jsp";
	}
	/**
	 * 搜索关键字模糊查
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findBySearchName(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String searchname = new String(req.getParameter("searchname").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findBySearchName(searchname, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setLabel(searchname+"的搜索结果");
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/course-list.jsp";
	}
	/**
	 * 搜索关键字模糊查
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByMSearchName(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String searchname = new String(req.getParameter("searchname").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findBySearchName(searchname, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		pb.setLabel(searchname+"的搜索结果");
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/manage.jsp";
	}
	/**
	 * 前台全课程
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String all = new String(req.getParameter("all").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByAll(all, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/main.jsp";
	}
	/**
	 * 管理页面全课程
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByAllM(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 3. 获取查询条件
		 */
		req.setCharacterEncoding("utf-8");
		String all = new String(req.getParameter("all").getBytes("iso-8859-1"), "utf-8");
		/*
		 * 4. 使用pc和ctname调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByAll(all, pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/manage.jsp";
	}
	/**
	 * 删除课程
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String courseId = req.getParameter("courseId");
		
		courseService.delete(courseId);//删除数据库的记录
		
		req.setAttribute("msg", "删除课程成功！");
		return "/CourseServlet?method=findByAllM&all=1";
	}
	
	/**
	 * 查询最新课程,返回
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByDate(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 4. 使用pc调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByDate(pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，
		 */
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/new-course.jsp";
	}
	public String findByPageView(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
		int pc = getPc(req);
		/*
		 * 2. 得到url：...
		 */
		String url = getUrl(req);
		/*
		 * 4. 使用pc调用service#findByCategory得到PageBean
		 */
		page.PageBean<Course> pb = courseService.findByPageView(pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，
		 */
		
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "/jsps/hot-course.jsp";
	}
	
}
