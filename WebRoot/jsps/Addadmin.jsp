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
				<h4 class="label-title">管理员信息修改</h4>
			</div>
		</div>
	</div>
	<div style="clear：both"></div>
	<!-- 主体内容 -->
	
	<form action="<c:url value='/AddAdminServlet'/>" enctype="multipart/form-data" method="post" id="form">
	<div class="container">
		<div class="col-md-10 col-md-push-1">
		<p style="font-weight: 900; color: red;font-size: 20px;margin: 0 auto;">${msg }</p>
			 <div class="input-group input-group-lg">
				<span class="input-group-addon" id="sizing-addon1">登录用户名</span>
				<input type="text" class="form-control" value="" name="adminName" id="adminName" placeholder="" aria-describedby="sizing-addon1">
			</div>
			<div class="input-group input-group-lg">
				<span class="input-group-addon" id="sizing-addon1" >所属单位</span>
				<select class="form-control" name="deptName" id="deptName">
					<option></option>
					<c:forEach items="${deptName}" var="deptName">
					<option>${deptName.deptName}</option>
					</c:forEach>
				</select>
			</div>
			<div class="input-group input-group-lg">
				<span class="input-group-addon" id="sizing-addon1">管理员真实姓名</span>
				<input type="text" class="form-control" name="realName" id="realName" placeholder="" value="" aria-describedby="sizing-addon1">
			</div>
			<div class="input-group input-group-lg">
				<span class="input-group-addon" id="sizing-addon1">设置登录密码</span>
				<input type="text" class="form-control" name="passWord" id="passWord" placeholder="" value="" aria-describedby="sizing-addon1">
			</div>
			<a href="#" id="btn" class="button button-block button-rounded button-primary  button-large">添加管理员</a>	
			<a href="/bs-course/jsps/Addadmin.jsp" class="button button-block button-rounded   button-large">重置</a>						
		</div>
	</div>
</form> 
<script type="text/javascript">
			/*
 * 点击编辑按钮时执行本函数
 */
	$(function () {
		$("#btn").click(function() {
			var passWord=$("#passWord").val();
			var realName= $("#realName").val();
			var deptName= $("#deptName").val();
			var adminName = $("#adminName").val();
			
			
			if(!passWord || !realName || !deptName || !adminName ) {
				alert("用户名、真实姓名、所属单位、密码都不能为空！");
				return false;
			}
			else if(adminName.length < 3 || adminName.length > 20) {
				alert("用户名长度必须在3 ~ 20之间！");
				return false;
			}
			$.ajax({
				url:"/bs-course/AdminServlet",//要请求的servlet
				data:{method:"ajaxValidateLoginname", loginname:adminName},//给服务器的参数
				type:"POST",
				dataType:"json",
				async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。
				cache:false,
				success:function(result) {
					if(!result) {//如果校验失败
						alert("用户名已被注册！");
						return false;
					}else{
					$("#form").submit();
					}
					}
				});
					
				
			
			}
		);
		
	});

	
	</script>

	<!-- 尾部 -->
		<div></div>

		
			

	</body>
</html>