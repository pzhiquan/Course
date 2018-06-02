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
	<c:forEach items="${admin}" var="admin">
		<form action="<c:url value='/ChangeAdminServlet'/>" enctype="multipart/form-data" method="post" id="form${admin.adminId }">
		<div class="container">
			<div class="col-md-10 col-md-push-1">
			
				 <div class="input-group input-group-lg" style="display:none;">
					<span class="input-group-addon" id="sizing-addon1">管理员ID</span>
					<input type="text" class="form-control" value="${admin.adminId }" name="adminId " id="adminId${admin.adminId } " placeholder="" aria-describedby="sizing-addon1">
				</div>
				 <div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">登录用户名</span>
					<input type="text" class="form-control" value="${admin.adminName }" name="adminName" id="adminName${admin.adminId }" placeholder="" aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1" >所属单位</span>
					<select class="form-control" name="deptName" id="deptName${admin.adminId }">
						<option>${admin.deptName}</option>
						<c:forEach items="${deptName }" var="deptName">
						<option>${deptName.deptName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">管理员真实姓名</span>
					<input type="text" class="form-control" name="realName" id="realName${admin.adminId }" placeholder="" value="${admin.realName}" aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg">
					<span class="input-group-addon" id="sizing-addon1">登录密码</span>
					<input type="text" class="form-control" name="passWord" id="passWord${admin.adminId }" placeholder="" value="${admin.passWord}" aria-describedby="sizing-addon1">
				</div>
				<a href="#" id="btn${admin.adminId }" class="button button-block button-rounded button-primary  button-large">提交修改</a>							
				<a href="#"  data-toggle="modal" data-target="#id${admin.adminId }" class="button button-block button-rounded button-caution button-large">删除</a>
			</div>
		</div>
		<div style="width:100%;height:50px"></div>
		<!-- 课程删除窗口 -->
		    <div id="id${admin.adminId }" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-body">
		                    <button class="close" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">确认删除${admin.adminName }用户吗？</h4>
		                </div>
		        
		                <div class="modal-body" style="text-align:center">
		                    
										<a href="<c:url value='/AdminServlet?method=delete&adminId=${admin.adminId }'/>" class="button button-glow button-rounded button-raised button-primary" style="height: 40px;font-size: 26px;width: 100px;">确认</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="#" data-dismiss="modal" class="button button-glow button-rounded button-caution" style="height: 40px;font-size: 26px;width: 100px;">取消</a>
									
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
	</form> 
	<script type="text/javascript">
			/*
 * 点击编辑按钮时执行本函数
 */
	$(function () {
		$("#btn${admin.adminId }").click(function() {
			var passWord=$("#passWord${admin.adminId }").val();
			var realName= $("#realName${admin.adminId }").val();
			var deptName= $("#deptName${admin.adminId }").val();
			var adminName = $("#adminName${admin.adminId }").val();
			
			
			if(!passWord || !realName || !deptName || !adminName ) {
				alert("用户名、真实姓名、所属单位、密码都不能为空！");
				return false;
			}
			$("#form${admin.adminId }").submit();
			
		});
		
	});
	
	
	</script>
	
	
	
	
</c:forEach>

	<!-- 尾部 -->
		<div></div>

		
			

	</body>
</html>