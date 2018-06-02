<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<!-- 导航选择 -->
    <div id="course-type" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" style="opacity: 0.9;">
                <div class="modal-header">
                    <button class="close" style="font-size:30px" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">课程类别</h4>
                </div>
                
                <c:forEach items="${courseTypeName }" var="courseTypeName">
                	<%-- url标签会自动对参数进行url编码 --%>
				<c:url value="/CourseServlet" var="courseTypeUrl">
					<c:param name="method" value="findByCtname"/>
					<c:param name="ctname" value="${courseTypeName.courseTypeName}"/>
				</c:url>
                	<a href="${courseTypeUrl}" class="button button-block button-rounded button-large">${courseTypeName.courseTypeName}</a>
				</c:forEach>
				</div>
        </div>
    </div>
    <div id="discipline-fields" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" style="opacity: 0.9;">
                <div class="modal-header">
                    <button class="close" style="font-size:30px" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">学科门类</h4>
                </div>
                <c:forEach items="${subjectName }" var="subjectName">
                <%-- url标签会自动对参数进行url编码 --%>
                <c:url value="/CourseServlet" var="subjectUrl">
					<c:param name="method" value="findBySubject"/>
					<c:param name="subject" value="${subjectName.subjectName}"/>
				</c:url>
                	<a href="${subjectUrl}" class="button button-block button-rounded button-large">${subjectName.subjectName}</a>
				</c:forEach>
				</div>
        </div>
    </div>
    <div id="college-courses" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" style="opacity: 0.9;">
                <div class="modal-header">
                    <button class="close" style="font-size:30px" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">学院课程</h4>
                </div>
                <c:forEach items="${deptName }" var="deptName">
                <%-- url标签会自动对参数进行url编码 --%>
                <c:url value="/CourseServlet" var="deptUrl">
					<c:param name="method" value="findByDept"/>
					<c:param name="dept" value="${deptName.deptName}"/>
				</c:url>
                	<a href="${deptUrl }" class="button button-block button-rounded button-large">${deptName.deptName}</a>
				</c:forEach>
				</div>
        </div>
    </div>
    <div id="major-courses" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" style="opacity: 0.9;">
                <div class="modal-header">
                    <button class="close" style="font-size:30px" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" style="text-align: center;font-size: 26px;">专业课程</h4>
                </div>
                <c:forEach items="${majorName }" var="majorName">
                <%-- url标签会自动对参数进行url编码 --%>
                <c:url value="/CourseServlet" var="majorUrl">
					<c:param name="method" value="findByMajor"/>
					<c:param name="major" value="${majorName.majorName}"/>
				</c:url>
                	<a href="${majorUrl }" class="button button-block button-rounded button-large">${majorName.majorName}</a>
				</c:forEach>
				</div>
        </div>
    </div>


