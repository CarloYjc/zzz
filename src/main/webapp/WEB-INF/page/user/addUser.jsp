<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<script>  
    var ctx = "${ctx}";  
</script>  
<style type="text/css">
	.layui-form-item .layui-inline {
		width: 33.333%;
		float: left;
		margin-right: 0;
	}
	
	@media ( max-width :1240px) {
		.layui-form-item .layui-inline {
			width: 100%;
			float: none;
		}
	}
</style>
</head>
<body class="childrenBody">
	<form class="layui-form" style="width: 80%; margin-top: 10px;">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" id="username" class="layui-input" lay-verify="required" placeholder="请输入用户名" 
					name="username" value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-block">
				<input type="password" id="password" class="layui-input" lay-verify="pass" placeholder="请输入密码" 
					name="password" value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" class="layui-input" lay-verify="repass" placeholder="请输入确认密码" value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">全称</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input" lay-verify="required" placeholder="请输入姓名" 
					name="fullname" value="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<input type="radio" name="status" value="0" title="禁用">
				<input type="radio" name="status" value="1" title="正常" checked>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">分配角色</label>
			<div class="layui-input-block">
				<select name="roleId">
					<option value="">请选择</option>
					<c:forEach items="${roles}" var="r">
						<option value="${r.roleId}">${r.roleName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addUser">立即提交</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/addUser.js"></script>
</body>
</html>