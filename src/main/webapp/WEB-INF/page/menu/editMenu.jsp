<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>编辑菜单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
<link rel="stylesheet" href="${ctx }/layui/css/layui.css">
<link rel="stylesheet" href="${ctx }/css/font_eolqem241z66flxr.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/list.css" media="all" />
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
	<form class="layui-form" style="width: 80%; margin-top: 10px;" id="menuForm">
		<input type="hidden" name="menuId" value="${menu.menuId }"/>
		<input type="hidden" name="parentId" value="${menu.parentId }"/>
		<div class="layui-form-item">
			<label class="layui-form-label">菜单名</label>
			<div class="layui-input-block">
				<input type="text" id="title" class="layui-input" lay-verify="required" placeholder="请输入菜单名" 
				    name="title" value="${menu.title }" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图标</label>
			<div class="layui-input-block">
				<input type="text" id="iconPicker" lay-filter="iconPicker" class="layui-input" name="icon" 
				    value="${menu.icon }" />
				<label></label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">资源路径</label>
			<div class="layui-input-block">
				<input type="text" name="href" class="layui-input" placeholder="请输入资源路径" value="${menu.href }" />
				<label>（<span style="color: red">*</span>例：log/logList）</label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序</label>
			<div class="layui-input-block">
				<input type="number" name="sorting" class="layui-input" placeholder="排序(整数)" lay-verify="require" 
				    value="${menu.sorting }" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">权限标识</label>
			<div class="layui-input-block">
				<input type="text" name="perms" class="layui-input" placeholder="权限标识" value="${menu.perms }" />
				<label>（例：sys:role:list）</label>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="editMenu">立即提交</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/editMenu.js"></script>
</body>
</html>