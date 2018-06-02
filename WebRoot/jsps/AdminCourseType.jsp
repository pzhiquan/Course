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
	<script src="<c:url value='/js/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/heigthChange.js'/>" type="text/javascript"></script>
<script type="text/javascript">
			/*
 * 点击编辑按钮时执行本函数
 */

	$(function () {
		
			if("${msg}"!=0){
			alert("${msg}");
			}
		});
	
	</script>
	
  </head>
<body class="main-bg">
	 <!--头部开始-->
	<%@include file="top-manage.jsp"%>

	
	<!-- 标签 -->
	<div class="container">
		<div class="row" style="position:relative;">
			<img class="label-img" src="/course/images/label.png" >
			<div class="labeldiv">
				<h4 class="label-title">课程类别修改</h4>
			</div>
		</div>
	</div>
	<div style="clear：both"></div>
	<!-- 主体内容 -->
		<div class="container">
		<div class="col-md-10 col-md-push-1">
		
		<c:forEach items="${coursetypeName }" var="coursetypeName">
			<button class="close" data-toggle="modal" data-target="#del${coursetypeName.courseTypeID}" style="color: #d81616;font-size: 50px;opacity: .4;">
		                        <span>&times;</span>
		                    </button>
			<a href="#" data-toggle="modal" data-target="#${coursetypeName.courseTypeName}" class="button button-block button-rounded  button-large">${coursetypeName.courseTypeName}</a>
			<br>
			<!-- 删除窗口 -->
		    <div id="del${coursetypeName.courseTypeID}" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-body">
		                    <button class="close" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">确认删除${coursetypeName.courseTypeName}课程类别吗？</h4>
		                </div>
		        
		                <div class="modal-body" style="text-align:center">
		                    
										<a href="<c:url value='/CourseTypeServlet?method=delete&courseTypeID=${coursetypeName.courseTypeID}'/>" class="button button-glow button-rounded button-raised button-primary" style="height: 40px;font-size: 26px;width: 100px;">确认</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="#" data-dismiss="modal" class="button button-glow button-rounded button-caution" style="height: 40px;font-size: 26px;width: 100px;">取消</a>
									
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
			<!-- 修改窗口 -->
		    <div id="${coursetypeName.courseTypeName}" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-body">
		                    <button class="close" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">课程类别修改</h4>
		                </div>
		                <form class="form-group" action="<c:url value='/ChangeCourseTypeServlet'/>" enctype="multipart/form-data" method="post" id="form1${coursetypeName.courseTypeID}">
		        			<input type="text"  style="display:none;" class="form-control" name="courseTypeID" id=""  value="${coursetypeName.courseTypeID}" placeholder="" aria-describedby="sizing-addon1">
							<input type="text" style="text-align: center;font-size: 26px;" class="form-control" name="courseTypeName" id="TypeName${coursetypeName.courseTypeID}"  value="${coursetypeName.courseTypeName}" placeholder="" aria-describedby="sizing-addon1">
						</form>
		                <div class="modal-body" style="text-align:center">
		                    <a id="btn${coursetypeName.courseTypeID}" href="#" class="button button-glow button-rounded button-raised button-primary" style="height: 40px;font-size: 26px;width: 100px;">确认</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" data-dismiss="modal" class="button button-glow button-rounded button-caution" style="height: 40px;font-size: 26px;width: 100px;">取消</a>
						</div>
		                
		                </div>
		            </div>
		        </div>
		  
		    <script type="text/javascript">
			/*
 * 点击编辑按钮时执行本函数
 */
	$(function () {
		$("#btn${coursetypeName.courseTypeID}").click(function() {
			var TypeName=$("#TypeName${coursetypeName.courseTypeID}").val();
			if(!TypeName ) {
				alert("课程类别不能为空！");
				return false;
			}
			$("#form1${coursetypeName.courseTypeID}").submit();

		});
		
	});
	
	
	</script>
</c:forEach>
		<a href="#" data-toggle="modal" data-target="#BtnB" class="button button-block button-rounded button-primary  button-large" style="font-size:50px">+</a>						
		<!-- 修改窗口 -->
		    <div id="BtnB" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-body">
		                    <button class="close" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">课程类别添加</h4>
		                </div>
		                <form class="form-group" action="<c:url value='/AddCourseTypeServlet'/>" enctype="multipart/form-data" method="post" id="formBtn">
		        			
							<input type="text" style="text-align: center;font-size: 26px;" class="form-control" name="courseTypeName" id="TypeN"  value="" placeholder="" aria-describedby="sizing-addon1">
						</form>
		                <div class="modal-body" style="text-align:center">
		                    <a id="btnn" href="#" class="button button-glow button-rounded button-raised button-primary" style="height: 40px;font-size: 26px;width: 100px;">添加 </a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" data-dismiss="modal" class="button button-glow button-rounded button-caution" style="height: 40px;font-size: 26px;width: 100px;">取消</a>
						</div>
		                
		                </div>
		            </div>
		        </div>
		</div>
	</div>
	 <script type="text/javascript">
			/*
 * 点击编辑按钮时执行本函数
 */
	$(function () {
		$("#btnn").click(function() {
			var TypeN=$("#TypeN").val();
			if(!TypeN ) {
				alert("课程类别名不能为空！");
				return false;
			}
			$("#formBtn").submit();

		});
		
	});
	
	
	</script>

	<!-- 尾部 -->
		<div></div>

		
			

	</body>
</html>