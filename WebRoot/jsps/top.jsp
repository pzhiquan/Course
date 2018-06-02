<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 

		
			<nav class="navbar navbar-default navbar-fixed-top header ">
				<div class="container" id="nav">
							<div class="navbar-header">	
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
 								<span class="sr-only">Toggle Navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								</button>
								<a href="/bs-course/index.jsp" class="navbar-brand logo-style">网络课程管理系统</a>
							</div>
						
			<!-- 导航栏 -->
				<div id="navbar"  class="collapse navbar-collapse">
					<ul  class="nav navbar-nav navbar-left" style="margin-top:0;">
						<li data-toggle="modal" data-target="#course-type" ><a href="#" id="coursetype">课程类别</a></li>
						<li data-toggle="modal" data-target="#discipline-fields" id="disciplinef"><a href="#">学科门类</a></li>
						<li data-toggle="modal" data-target="#college-courses" id=""><a href="#">学院课程</a></li>	
						<li data-toggle="modal" data-target="#major-courses"><a href="#">专业课程</a></li>	
					</ul>
				
			
			
			<!-- 搜索栏 -->
					<form class="navbar-form navbar-left" action="<c:url value='/CourseServlet'/>" id="form1">
						<input type="hidden" name="method" value="findBySearchName"/> 
				         <div class="input-group">
					      <input type="text" class="form-control" aria-label="..."  placeholder="-请输入课程关键字-" name="searchname">
					      <span class="input-group-btn">
					        <a href="javascript:document.getElementById('form1').submit();" class="button button-glow button-border button-rounded button-primary">Go</a>
							
						  </span>
						  
					      </div>
    				</div>

				</div>
      				</form>

				</div>
			</nav>
	<div id="clear" ></div>
	
	<div style="clear:both;"></div>
	
	

