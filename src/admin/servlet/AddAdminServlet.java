package admin.servlet;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import admin.domain.Admin;
import admin.service.AdminService;

import cn.itcast.commons.CommonUtils;
import course.domain.Course;
import course.service.CourseService;
import dept.domain.Dept;
import dept.service.DeptService;

public class AddAdminServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		/*
		 * 添加管理员
		 */
		/*
		 * 1. commons-fileupload的上传三步
		 */
		// 创建工具
		FileItemFactory factory = new DiskFileItemFactory();
		/*
		 * 2. 创建解析器对象
		 */
		ServletFileUpload sfu = new ServletFileUpload(factory);
		
		/*
		 * 3. 解析request得到List<FileItem>
		 */
		List<FileItem> fileItemList = null;
		try {
			fileItemList = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			// 如果出现这个异步，说明单个文件超出了80KB
			error("上传的文件超出了80KB", request, response);
			return;
		}
		
		/*
		 * 4. 把List<FileItem>封装到Book对象中
		 * 4.1 首先把“普通表单字段”放到一个Map中，再把Map转换成Book和Category对象，再建立两者的关系
		 */
		Map<String,Object> map = new HashMap<String,Object>();
		for(FileItem fileItem : fileItemList) {
			if(fileItem.isFormField()) {//如果是普通表单字段
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}
		}
		Admin admin = CommonUtils.toBean(map, Admin.class);//把Map中大部分数据封装到admin对象中
		String deptName=admin.getDeptName();
		DeptService deptService=new DeptService();
		Dept dept=deptService.findByName(deptName);
		// 调用service完成保存
		admin.setAdminId(CommonUtils.uuid());
		String deptId = dept.getDeptID();
		admin.setDeptId(deptId);
		AdminService adminService = new AdminService();
		adminService.add(admin);
		
		// 保存成功信息转发到msg.jsp
		request.setAttribute("msg", "添加管理员成功！");
		request.getRequestDispatcher("/jsps/Addadmin.jsp").forward(request, response);
	}
	
	/*
	 * 保存错误信息，转发到add.jsp
	 */
	private void error(String msg, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/jsps/Addcourse.jsp").
				forward(request, response);
	}

}
