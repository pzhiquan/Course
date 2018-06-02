<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 

		
			<nav class="navbar navbar-default navbar-fixed-top header ">
				<div id="nav">
							<div class="navbar-header">	
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
 								<span class="sr-only">Toggle Navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								</button>
								<a href="#" class="navbar-brand logo-style" style="font-size: 23px!important;">管理员:${sessionUser.adminName}</a>
							</div>
						
			<!-- 导航栏 -->
				<div id="navbar"  class="collapse navbar-collapse">
					<ul  class="nav navbar-nav navbar-left" style="margin-top:0;">
						<li data-toggle="modal" data-target="#course-revise"><a href="#" >管理课程</a></li>
						<li ><a href="<c:url value='/CourseTypeServlet?method=findAllB'/>" >课程类别修改</a></li>
						<li ><a href="<c:url value='/SubjectServlet?method=findAllB'/>">学科修改</a></li>
						<li ><a href="<c:url value='/DeptServlet?method=findAllB'/>">学院修改</a></li>	
						<li ><a href="<c:url value='/MajorServlet?method=findAllB'/>">专业修改</a></li>
						<li data-toggle="modal" data-target="#admin-revise"><a href="#">管理员管理</a></li>	
					</ul>
				
		 
			
			<!-- 搜索栏 -->
					<form class="navbar-form navbar-left" action="<c:url value='/CourseServlet'/>" id="form1">
				         <input type="hidden" name="method" value="findByMSearchName"/>
				         <div class="input-group">
					      <input type="text" class="form-control" aria-label="..."  placeholder="-请输入课程关键字-" name="searchname">
					      <span class="input-group-btn">
					        <a href="javascript:document.getElementById('form1').submit();" class="button button-glow button-border button-rounded button-primary">搜索</a>
						  </span>&nbsp;&nbsp;
						  <span class="input-group-btn">
					        <a href="<c:url value='/AdminServlet?method=quit'/>" class="button button-glow button-rounded button-raised button-primary">注销</a>
						  </span>
						  
					      </div>
    				</div>
				</div>
				</div>
      				</form>

				</div>
			</nav>
			<div id="course-revise" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-header">
		                    <button class="close" style="font-size:30px" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">管理课程</h4>
		                    </div>
		                
		                	<a href="/bs-course/jsps/Addcourse.jsp" class="button button-block button-rounded button-large">课程新增</a>
							<a href="<c:url value='/CourseServlet?method=findByAllM&all=1'/>" class="button button-block button-rounded button-large">课程修改</a>
						
					</div>
		        
		    	</div>
		   </div>
		   <div id="admin-revise" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-header">
		                    <button class="close" style="font-size:30px" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">管理员管理</h4>
		                    </div>
		                
		                	<a href="/bs-course/jsps/Addadmin.jsp" class="button button-block button-rounded button-large">管理员新增</a>
							<a href="<c:url value='/AdminServlet?method=findadmin&adminname=1'/>" class="button button-block button-rounded button-large">管理员信息修改</a>
						
					</div>
		        
		    	</div>
		   </div>
	<div id="clear" ></div>
	
	<div style="clear:both;"></div>
	
	

