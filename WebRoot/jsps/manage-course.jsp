<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<div class="container">
		<div class="row" style="position:relative;">
			<img class="label-img" src="/course/images/label.png" >
			<div class="labeldiv">
				<h4 class="label-title">课程修改</h4>
			</div>
		</div>
	</div>
	<div class="container">
	<div class="row">
		<c:forEach items="${pb.beanList}" var="course">
			<div class="col-md-3 col-sm-5 col-xs-12" style="padding: 0 0 0 20px">
		 		<div class="polaroid">
		 			<button class="close" data-toggle="modal" data-target="#${course.courseId }" data-dismiss="modal" style="color:#d81616;font-size: 40px;opacity: .4;">
                        <span>&times;</span>
                    </button>
		  			<a href="#" data-toggle="modal" data-target="#${course.courseName }">
		  			
                    <img src="${course.courseImages}" alt="${course.courseName }" class="img-responsive" style="min-height: 225px;max-height: 225px;min-width: 225px;width:100%;height:100%;">
                    </a>
		  			<div class="course-title">
		    			<p>${course.courseName}</p>
		    		</div>
				</div>
			</div>
			<!-- 课程删除窗口 -->
		    <div id="${course.courseId }" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-body">
		                    <button class="close" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">确认删除${course.courseName}课程吗？</h4>
		                </div>
		        
		                <div class="modal-body" style="text-align:center">
		                    
										<a href="<c:url value='/CourseServlet?method=delete&courseId=${course.courseId }'/>" class="button button-glow button-rounded button-raised button-primary" style="height: 40px;font-size: 26px;width: 100px;">确认</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="#" data-dismiss="modal" class="button button-glow button-rounded button-caution" style="height: 40px;font-size: 26px;width: 100px;">取消</a>
									
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
			<!-- 课程修改窗口 -->
		    <div id="${course.courseName }" class="modal fade">
		        <div class="modal-dialog">
		            <div class="modal-content" style="opacity: 0.9;">
		                <div class="modal-body">
		                    <button class="close" data-dismiss="modal">
		                        <span>&times;</span>
		                    </button>
		                </div>
		        
		                <div class="modal-body">
		                    <form class="form-group" action="<c:url value='/AdminCourseServlet'/>" enctype="multipart/form-data" method="post" id="form${course.courseId}">
		                    	
		                            <div class="input-group input-group-lg">
		                            	<div class="input-group input-group-lg" style="display:none;">
										  <span class="input-group-addon" id="sizing-addon1">课程Id</span>
										  <input type="text" class="form-control" placeholder="" id="courseId${course.courseId }" name="courseId"  value="${course.courseId }" aria-describedby="sizing-addon1">
										</div>
			                            <div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程名称</span>
										  <input type="text" class="form-control" name="courseName" id="courseName${course.courseId }"  value="${course.courseName}" placeholder="" aria-describedby="sizing-addon1">
										</div>
										  <span class="input-group-addon" id="sizing-addon1">学科门类</span>
										  <select class="form-control" name="subject" id="subject${course.courseId }">
										  <option>${course.subject}</option>
										  <c:forEach items="${subjectName }" var="subjectName" >
												<option>${subjectName.subjectName}</option>	
										  </c:forEach>
										</select>
										</div>
										
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程类别</span>
										  <select class="form-control"  name="courseType" id="courseType${course.courseId }">
										  <option>${course.courseType}</option>
										  <c:forEach items="${courseTypeName}" var="courseTypeName">
										  	<option>${courseTypeName.courseTypeName}</option>
										  </c:forEach>
										</select>
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">所属学院</span>
										  <select class="form-control" name="dept" id="dept${course.courseId }">
										  <option>${course.dept}</option>
										  <c:forEach items="${deptName }" var="deptName">
										  	<option>${deptName.deptName}</option>
										  </c:forEach>
										</select>
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程专业</span>
										  <select class="form-control" name="major" id="major${course.courseId }">
										  <option>${course.major}</option>
										  <c:forEach items="${majorName }" var="majorName">
										  	<option>${majorName.majorName}</option>
										  </c:forEach>
										</select>
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程老师</span>
										  <input type="text" class="form-control" placeholder=""  name="teacher" id="teacher${course.courseId }"  value="${course.teacher}" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程网址</span>
										  <input type="text" class="form-control" placeholder="" name="adress" id="adress${course.courseId }"  value="${course.adress }" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">创建人</span>
										  <input type="text" class="form-control" placeholder=""  name="creatMan" id="creatMan${course.courseId }" value="${sessionUser.adminName}" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">创建时间</span>
										  <input type="date" class="form-control" placeholder=""  name="creatTime" id="creatTime${course.courseId }"  value="${course.creatTime }" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程图片</span>
										  <input type="file" class="form-control" placeholder="" name="courseImages" id="courseImages${course.courseId }"  value="${course.courseImages}" aria-describedby="sizing-addon1">
										</div>
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">课程简介</span>
										  <input type="text" class="form-control" placeholder=""  name="courseDescription" id="courseDescription${course.courseId }" value="${course.courseDescription}" aria-describedby="sizing-addon1">
										</div>
										<a href="#" id="btn${course.courseId }" class="button button-block button-rounded button-action button-large">提交修改</a>
										<a href="#"  data-dismiss="modal" class="button button-block button-rounded button-caution button-large">取消</a>
									
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
<script type="text/javascript">
			/*
 * 点击编辑按钮时执行本函数
 */

	$(function () {
		$("#btn${course.courseId}").click(function() {
			var courseId=$("#courseId${course.courseId }").val();
			var courseName= $("#courseName${course.courseId }").val();
			var subject= $("#subject${course.courseId }").val();
			var courseType= $("#courseType${course.courseId }").val();
			var dept = $("#dept${course.courseId }").val();
			var major= $("#major${course.courseId }").val();
			var teacher= $("#teacher${course.courseId }").val();
			var adress= $("#adress${course.courseId }").val();
			var creatMan= $("#creatMan${course.courseId }").val();
			var creatTime= $("#creatTime${course.courseId }").val();
			var courseImages = $("#courseImages${course.courseId }").val();
			var courseDescription = $("#courseDescription${course.courseId }").val();
			
			if(!courseName || !subject || !courseType || !dept || !major || !teacher || !adress || !creatMan || !creatTime || !courseImages || !courseDescription) {
				alert("课程名、学科类别、课程类别、学院、专业、课程教师、课程网站、创建人、创建时间、课程简介都不能为空！");
				return false;
			}
			$("#form${course.courseId}").submit();
			
		});
		
	});
	
	
	</script>
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
