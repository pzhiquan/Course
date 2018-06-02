<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<div class="container" >
	<div class="row">
		<div id="myCarousel" class="carousel slide col-md-6 col-xs-12 col-sm-12 col-lg-6" style="padding:0;">
			<div class="carousel-inner">
				<div class="item active">
					<a href="#"><img src="/bs-course/images/gaill.jpg" alt="第一张"></a>
					<div class="bantext"><a href="#" target="_blank" rel="nofollow">概率论与数理统计</a></div>
				</div>
				<div class="item">
					<a href="#"><img src="/bs-course/images/gaill2.jpg" alt="第二张"></a>
					<div class="bantext"><a href="#" target="_blank" rel="nofollow">概率论与数理统计</a></div>
				</div>
				<div class="item">
					<a href="#"><img src="/bs-course/images/gaill.jpg" alt="第三张"></a>
					<div class="bantext"><a href="#" target="_blank" rel="nofollow">概率论与数理统计</a></div>
				</div>
			</div>
		
				<a href="#myCarousel" data-slide="prev" class="carousel-control left ">&lsaquo;</a>
				<a href="#myCarousel" data-slide="next" class="carousel-control right">&rsaquo;</a>
		</div>

		<div class="col-xs-6 col-md-3 col-lg-3 pic-mid" style="top: 20px;"> 
			<ul> 
				<li>
					<a href="#"> 
  						<img src="/bs-course/images/gongao.png" alt="课程公告" class="img-responsive"> 
  						
  					</a>
  				</li> 
  				<li>
  					<a href="<c:url value='/CourseServlet?method=findByDate'/>"> 
  						<img src="/bs-course/images/zuixin.png" alt="最新课程" class="img-responsive" > 
						
					</a>
				</li> 
			</ul> 
		</div>
		<div class="col-xs-6 col-md-3 col-lg-3 pic-right" style="top: 20px;">
			<ul> 
				<li>
					<a href="<c:url value='/CourseServlet?method=findByPageView'/>"> 
						<img src="/bs-course/images/remen.png" alt="热门课程" class="img-responsive"> 
						 
					</a>
				</li> 
				<li data-toggle="modal" data-target="#login">
					<a href="#"> 
						<img src="/bs-course/images/guanly.png" alt="管理员登录" class="img-responsive"> 
					</a>
				</li> 
			</ul> 
		</div> 

</div>

<div style="clear：both"></div>


