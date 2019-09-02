<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/zTreeStyle/zTreeStyle.css" media="all" />
<script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx }/js/jquery.ztree.all.js"></script>
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
	<form class="layui-form" style="width: 80%; margin-top: 10px;" id="roleForm">
		<input type="hidden" id="menu" name="menu"/>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名</label>
			<div class="layui-input-block">
				<input type="text" id="roleName" class="layui-input userName" lay-verify="required" 
				    placeholder="请输入角色名" name="roleName" value="">
			</div>
		</div>
		<div class="layui-form-item"> 
			<label class="layui-form-label">角色描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入角色描述" class="layui-textarea linksDesc" lay-verify="required" 
				    name="roleRemark" ></textarea>
			</div>
		</div>
		<!--权限树xtree  -->
		<div class="layui-form-item">
			<label class="layui-form-label">分配权限：</label>
			<div style="padding-left: 35%">
				<button id="checkAllTrue" class="layui-btn layui-btn-xs">全选</button>
                <button id="checkAllFalse" class="layui-btn layui-btn-xs">取消全选</button> 
			</div>
			<ul id="xtree1" class="ztree" style="width: 200px; margin-left: 105px"></ul>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addRole">立即提交</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/addRole.js"></script>
</body>
</html>