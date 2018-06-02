<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<div class="container">
	<div class="row">
		<c:forEach items="${pb.beanList}" var="course">
			<div class="col-md-3 col-sm-5 col-xs-12" style="padding: 0 0 0 20px">
		 		<div class="polaroid">
		  			<a href="${course.adress }"><img src="${course.courseImages}" alt="${course.courseName }" class="img-responsive" style="min-height: 225px;max-height: 225px;min-width: 225px;width:100%;height:100%;"></a>
		  			<div class="course-title">
		    			<p>${course.courseName}</p>
		    		</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-5 col-xs-12" style="padding:0;">
				<div class="description" style="min-height: 360px;">
					
					院部：${course.dept}<br>
					专业：${course.major}<br>
					教师：${course.teacher}<br>
					学科门类：${course.subject}<br>
					课程简介：${course.courseDescription}<br>
				</div>
			</div>
			</c:forEach>
		</div>

		<div class="row" style="display: flex;align-items: center;">
			<ul class="pagination pagination-lg" style="margin:0 auto;opacity: 0.8;">
			<%--上一页 --%>
				<c:choose>
					<c:when test="${pb.pc eq 1 }"><li class="disabled"><a href="#">&laquo;</a></li></c:when>
					<c:otherwise><li><a href="${pb.url }&pc=${pb.pc-1}">&laquo;</a></li></c:otherwise>
				</c:choose>
				
				<%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
				计算它们需要通过当前页码！
				1. 总页数不足4页--> begin=1, end=最大页
				2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
				3. 如果begin<1，那么让begin=1，end=4
				4. 如果end>tp, 让begin=tp-3, end=tp
				 --%>
				 <c:choose>
				 	<c:when test="${pb.tp <= 4 }">
				 		<c:set var="begin" value="1"/>
				 		<c:set var="end" value="${pb.tp }"/>
				 	</c:when>
				 	<c:otherwise>
				 		<c:set var="begin" value="${pb.pc-1 }"/>
				 		<c:set var="end" value="${pb.pc + 2}"/>
				 		<c:if test="${begin < 1 }">
				 		  <c:set var="begin" value="1"/>
				 		  <c:set var="end" value="4"/>
				 		</c:if>
				 		<c:if test="${end > pb.tp }">
				 		  <c:set var="begin" value="${pb.tp-3 }"/>
				 		  <c:set var="end" value="${pb.tp }"/>
				 		</c:if> 		
				 	</c:otherwise>
				 </c:choose>
				 
				 <c:forEach begin="${begin}" end="${end }" var="i">
				   <c:choose>
				   	  <c:when test="${i eq pb.pc }">
				   	    <li class="active"><a>${i }</a></li>
				   	  </c:when>
				   	  <c:otherwise>
				   	    <li><a href="${pb.url }&pc=${i}">${i }</a></li>
				   	  </c:otherwise>
				   </c:choose>
				  </c:forEach>
				  <c:if test="${end < pb.tp }">
      				<li>...</li>
    			  </c:if>
				<%--下一页 --%>
				<c:choose>
					<c:when test="${pb.pc eq pb.tp }"><li class="disabled"><a href="#">&raquo;</a></li></c:when>
					<c:otherwise><li><a href="${pb.url }&pc=${pb.pc+1}">&raquo;</a></li></c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
