<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

	<!-- 注册窗口 -->
    <%--<div id="register" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content" style="opacity: 0.9;">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">注册</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="">
                            <div class="form-group">
                                <label for="">用户名</label>
                                <input class="form-control" type="text" placeholder="6-15位字母或数字">
                            </div>
                            <div class="form-group">
                                <label for="">真实姓名</label>
                                <input class="form-control" type="text" placeholder="真实姓名">
                            </div>
                            <div class="form-group">
                                <label for="">所在单位</label>
                                <input class="form-control" type="text" placeholder="所在单位">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input class="form-control" type="password" placeholder="至少6位字母或数字">
                            </div>
                            <div class="form-group">
                                <label for="">再次输入密码</label>
                                <input class="form-control" type="password" placeholder="至少6位字母或数字">
                            </div>
                            <div class="text-right">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>--%>
   
	<!-- 登录窗口 -->
    <div id="login" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content" style="opacity: 0.9;">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h1 class="text-center">管理员登录</h1>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="<c:url value='/AdminServlet'/>" method="post">
                    	<input type="hidden" name="method" value="login" />
                            <div class="form-group">
                                <label for="">用户名</label>
                                <input class="form-control" type="text" placeholder="${msg }" name="adminName" value="${Admin.adminName }">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input class="form-control" type="password" placeholder="" name="passWord">
                            </div>
                            <div class="text-right">
                                <button class="btn btn-primary" type="submit">登录</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


