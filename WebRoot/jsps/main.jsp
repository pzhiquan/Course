<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>网络课程管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
	<%@include file="top.jsp"%>
	<%@include file="choose.jsp"%>
	<!-- 主体内容 -->
	<!-- 轮播图模块 -->
	<%@include file="figure.jsp"%>
	
	<!-- 管理员登录模块 -->
	<%@include file="login.jsp" %>
<!-- 网络课程精选模块 -->
	<%@include file="label.jsp"%>
	<%@include file="course.jsp"%>


	<!-- 尾部 -->
		<div></div>

		
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/js/heigthChange.js'/>" type="text/javascript"></script>
	<script type="text/javascript">
$(function(){
	$('#myCarousel').carousel({
	//设置自动播放/3 秒
	interval : 3000,
	});
	//调整轮播器箭头位置
	$('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
	$('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
	$(window).resize(function() {
		var $height = $('.carousel-inner img').eq(0).height() ||
				  	  $('.carousel-inner img').eq(1).height() ||
				      $('.carousel-inner img').eq(2).height();
		$('.carousel-control').css('line-height', $height + 'px');
	});
});
</script>		
	</body>
</html>