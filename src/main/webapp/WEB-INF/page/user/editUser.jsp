<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>编辑用户</title>
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
		<!-- 管理员id -->
		<input type="hidden" name="id" value="${user.id }"/>
		<div class="layui-form-item">
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-block">
				<input type="text" id="username" class="layui-input" lay-verify="required" readonly="readonly" 
				    name="username" value="${user.username }">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">全称</label>
			<div class="layui-input-block">
				<input type="text" name="fullname" class="layui-input" lay-verify="required" placeholder="请输入姓名" 
				    value="${user.fullname }">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<c:if test="${user.status == '0' }">
	                <input type="radio" name="status" value="0" title="禁用" checked> 
					<input type="radio" name="status" value="1" title="正常" >
				</c:if>
				<c:if test="${user.status == '1' }">
					<input type="radio" name="status" value="0" title="禁用" > 
	                <input type="radio" name="status" value="1" title="正常" checked>
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">分配角色</label>
			<div class="layui-input-block">
				<select name="roleId">
					<option value="">请选择</option>
					<c:forEach items="${roles }" var="r">
						<c:if test="${user.roleId == r.roleId }">
							<option value="${r.roleId }" selected>${r.roleName }</option>
						</c:if>
						<c:if test="${user.roleId != r.roleId }">
							<option value="${r.roleId }">${r.roleName }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="editUser">立即保存</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/editUser.js"></script>
</body>
</html>