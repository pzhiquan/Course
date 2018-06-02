package course.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import page.Expression;
import page.PageBean;
import page.PageConstants;
import course.domain.Course;

import cn.itcast.jdbc.TxQueryRunner;


public class CourseDao {
	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 * 按课程类别模糊查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Course> findByCtname(String ctname, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("CourseType", "like", "%" + ctname + "%"));
		return findByCriteria(exprList, pc);
	}
	/**
	 * 按学科门类模糊查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Course> findBySubject(String subject, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("Subject", "like", "%" + subject + "%"));
		return findByCriteria(exprList, pc);
	}
	/**
	 * 搜索关键字模糊查
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Course> findBySearchName(String searchname, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("CourseName", "like", "%" + searchname + "%"));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 按学院模糊查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Course> findByDept(String dept, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("Dept", "like", "%" + dept + "%"));
		return findByCriteria(exprList, pc);
	}
	/**
	 * 按专业查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Course> findByMajor(String major, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("Major", "like", "%" + major + "%"));
		return findByCriteria(exprList, pc);
	}
	/**
	 * 全部查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Course> findByAll(String all, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("CourseType", "!=", all ));
		return findByCriteria(exprList, pc);
	}
	
	/**
	 * 通用的查询方法
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	private page.PageBean<Course> findByCriteria(List<Expression> exprList, int pc) throws SQLException {
		/*
		 * 1. 得到ps
		 * 2. 得到tr
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where 1=1"); 
		List<Object> params = new ArrayList<Object>();//SQL中有问号，它是对应问号的值
		for(Expression expr : exprList) {
			/*
			 * 添加一个条件上，
			 * 1) 以and开头
			 * 2) 条件的名称
			 * 3) 条件的运算符，可以是=、!=、>、< ... is null，is null没有值
			 * 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName())
				.append(" ").append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if(!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数 
		 */
		String sql = "select count(*) from course" + whereSql;
		Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
		int tr = number.intValue();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from course" + whereSql + " order by orderBy limit ?,?";
		params.add((pc-1) * ps);//当前页首行记录的下标
		params.add(ps);//一共查询几行，就是每页记录数
		
		List<Course> beanList = qr.query(sql, new BeanListHandler<Course>(Course.class), 
				params.toArray());
		
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Course> pb = new PageBean<Course>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		return pb;
	}
	/**
	 * 查询最新方法
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	public page.PageBean<Course> findByDate(int pc) throws SQLException {
		/*
		 * 1. 得到ps
		 * 2. 得到tr
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		List<Object> params = new ArrayList<Object>();

		/*
		 * 3. 总记录数 
		 */
		String sql = "select count(*) from course order by CreateTime";
		Number number = (Number)qr.query(sql, new ScalarHandler());
		int tr = number.intValue();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from course order by CreateTime desc limit ?,?";
		
		params.add((pc-1) * ps);//当前页首行记录的下标
		params.add(ps);//一共查询几行，就是每页记录数
		
		List<Course> beanList = qr.query(sql, new BeanListHandler<Course>(Course.class), params.toArray());
		
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Course> pb = new PageBean<Course>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		return pb;
	}
	/**
	 * 查询热门方法
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException 
	 */
	public page.PageBean<Course> findByPageView(int pc) throws SQLException {
		/*
		 * 1. 得到ps
		 * 2. 得到tr
		 * 3. 得到beanList
		 * 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.BOOK_PAGE_SIZE;//每页记录数
		List<Object> params = new ArrayList<Object>();

		/*
		 * 3. 总记录数 
		 */
		String sql = "select count(*) from course order by PageView";
		Number number = (Number)qr.query(sql, new ScalarHandler());
		int tr = number.intValue();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from course order by PageView desc limit ?,?";
		
		params.add((pc-1) * ps);//当前页首行记录的下标
		params.add(ps);//一共查询几行，就是每页记录数
		
		List<Course> beanList = qr.query(sql, new BeanListHandler<Course>(Course.class), params.toArray());
		
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Course> pb = new PageBean<Course>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		
		return pb;
	}
	/**
	 * 添加课程
	 * @param book
	 * @throws SQLException 
	 */
	public void add(Course course) throws SQLException {
		String sql = "insert into course(CourseID,CourseName,CourseType,Subject,Major," +
				"Teacher,Dept,Adress,CreateMan,CreateTime,CourseImages,CourseDescription,PageView)" +
				" values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {course.getCourseId(),course.getCourseName(),course.getCourseType(),
				course.getSubject(),course.getMajor(),course.getTeacher(),
				course.getDept(),course.getAdress(),course.getCreatMan(),
				course.getCreatTime(),course.getCourseImages(),course.getCourseDescription(),course.getPageView()};
		qr.update(sql, params);
	}
	/**
	 * 修改课程
	 * @param book
	 * "insert into course(CourseID,CourseName,CourseType,Subject,Major," +
				"Teacher,Dept,Adress,CreateMan,CreateTime,CourseImages,CourseDescription)" +
				" values(?,?,?,?,?,?,?,?,?,?,?,?)";
	 * @throws SQLException 
	 */
	public void edit(Course course) throws SQLException {
		String sql = "update course set CourseName=?,CourseType=?,Subject=?,Major=?,"+
					"Teacher=?,Dept=?,Adress=?,CreateMan=?,CreateTime=?,CourseImages=?,CourseDescription=? where CourseID=?";
		Object[] params = {course.getCourseName(),course.getCourseType(),
				course.getSubject(),course.getMajor(),course.getTeacher(),
				course.getDept(),course.getAdress(),course.getCreatMan(),
				course.getCreatTime(),course.getCourseImages(),course.getCourseDescription(),course.getCourseId()};
		qr.update(sql, params);
	}
	/**
	 * 删除课程
	 * @param courseId
	 * @throws SQLException 
	 */
	public void delete(String courseId) throws SQLException {
		String sql = "delete from course where CourseID=?";
		qr.update(sql, courseId);
	}

}
