<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>网络课程管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap.min.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css'/>">
	<link rel="stylesheet" type="text/css"  href="<c:url value='/css/top.css'/>">
	<link rel="stylesheet" type="text/css"  href="<c:url value='/css/figure.css'/>">
	<link rel="stylesheet" type="text/css"  href="<c:url value='/css/course.css'/>">
	<link rel="stylesheet" type="text/css"  href="<c:url value='/css/label.css'/>">
	<link rel="stylesheet" type="text/css"  href="<c:url value='/css/buttons.css'/>">
	
  </head>
<body class="main-bg">
	 <!--头部开始-->
	<%@include file="top-manage.jsp"%>

	<!-- 标签 -->
	<div class="container">
		<div class="row" style="position:relative;">
			<img class="label-img" src="/course/images/label.png" >
			<div class="labeldiv">
				<h4 class="label-title">课程新增</h4>
			</div>
		</div>
	</div>
	<div style="clear：both"></div>
	<!-- 主体内容 -->
	<form action="<c:url value='/AddCourseServlet'/>" enctype="multipart/form-data" method="post" id="form">
	<div class="container">
		<div class="col-md-10 col-md-push-1">
		<p style="font-weight: 900; color: red;font-size: 20px;margin: 0 auto;">${msg }</p>
			 <div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程名称</span>
										  <input type="text" class="form-control" value="" name="courseName" id="courseName" placeholder="" aria-describedby="sizing-addon1">
										
										
										  <span class="input-group-addon" id="sizing-addon1">学科门类</span>
										  
										  <select class="form-control" name="subject" id="subject">
										  <option>${course.subject}</option>
										  <c:forEach items="${subjectName }" var="subjectName" >
												<option>${subjectName.subjectName}</option>	
										  </c:forEach>
										</select>
										</div>
										
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程类别</span>
										  <select class="form-control" name="courseType" id="courseType">
										  <option>${course.courseType}</option>
										  <c:forEach items="${courseTypeName}" var="courseTypeName">
										  	<option>${courseTypeName.courseTypeName}</option>
										  </c:forEach>
										</select>
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1" >所属学院</span>
										  <select class="form-control" name="dept" id="dept">
										  <option>${course.dept}</option>
										  <c:forEach items="${deptName }" var="deptName">
										  	<option>${deptName.deptName}</option>
										  </c:forEach>
										</select>
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1" >课程专业</span>
										  <select class="form-control" name="major" id="major">
										  <option>${course.major}</option>
										  <c:forEach items="${majorName }" var="majorName">
										  	<option>${majorName.majorName}</option>
										  </c:forEach>
										</select>
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程老师</span>
										  <input type="text" class="form-control" name="teacher" id="teacher" placeholder="" value="" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程网址</span>
										  <input type="text" class="form-control" name="adress" id="adress" placeholder="" value="" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">创建人</span>
										  <input type="text" class="form-control" name="creatMan" id="creatMan" placeholder="" value="${sessionUser.adminName}" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">创建时间</span>
										  <input type="date" class="form-control" name="creatTime" id="creatTime" placeholder="" value="" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程图片</span>
										  <input type="file" class="form-control" name="courseImages" id="courseImages" placeholder="" value="" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程简介</span>
										  <input type="text" class="form-control" name="courseDescription" id="courseDescription" placeholder="" value="" aria-describedby="sizing-addon1">
										</div>
										<a href="#" id="btn" class="button button-block button-rounded  button-action button-large">提交课程</a>
										<a href="/bs-course/jsps/Addcourse.jsp"" class="button button-block button-rounded  button-caution button-large">重置</a>
								</div>
						</div>
					</form>                           
	



	<!-- 尾部 -->
		<div></div>

		
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/heigthChange.js'/>" type="text/javascript"></script>
<script type="text/javascript">
	$(function () {
		
		$("#btn").click(function() {
			var courseName= $("#courseName").val();
			var subject= $("#subject").val();
			var courseType= $("#courseType").val();
			var dept = $("#dept").val();
			var major= $("#major").val();
			var teacher= $("#teacher").val();
			var adress= $("#adress").val();
			var creatMan= $("#creatMan").val();
			var creatTime= $("#creatTime").val();
			var courseImages = $("#courseImages").val();
			var courseDescription = $("#courseDescription").val();
			
			if(!courseName || !subject || !courseType || !dept || !major || !teacher || !adress || !creatMan || !creatTime || !courseImages || !courseDescription) {
				alert("课程名、学科类别、课程类别、学院、专业、课程教师、课程网站、创建人、创建时间、课程图片、课程简介都不能为空！");
				return false;
			}
			$("#form").submit();
		});
	});
	</script>

	</body>
</html>