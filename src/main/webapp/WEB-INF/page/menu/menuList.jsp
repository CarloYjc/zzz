<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>菜单列表</title>
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
/* 数据表格复选框正常显示 */
.layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
	top: 50%;
	transform: translateY(-50%);
}
</style>
</head>
<body class="layui-layout-body" style="overflow: auto">
	<div class="layui-btn-group TableTools" style="margin-left: 10px;margin-top: 10px">
		<div class="layui-form-item">
		    <div style="float: left; margin-left: 10px;">
		        <shiro:hasPermission name="sys:menu:insert">
	                <button class="layui-btn layui-btn-normal" id="btnAddMenu">添加菜单</button>
	            </shiro:hasPermission>
		    </div>
		    <div style="float: left; margin-left: 10px;">
                <shiro:hasPermission name="sys:menu:update">
	                <button class="layui-btn" id="btnEditMenu">编辑菜单</button>
	            </shiro:hasPermission>
            </div>
            <div style="float: left; margin-left: 10px;">
                <shiro:hasPermission name="sys:menu:delete">
	                <button class="layui-btn layui-btn-danger" id="btnDeleteMenu">删除菜单</button>
	            </shiro:hasPermission>
            </div>
            <div style="float: left; margin-left: 20px;">
                <button class="layui-btn layui-btn-primary">
                    <strong>
                        <cute>备注:</cute>
                        <span style="color:red">不选中为添加顶级菜单,选中添加子菜单</span>
                    </strong>
	            </button>
            </div>
		</div>
	</div>
	<div>
		<table class="layui-hidden" id="treeTable" lay-filter="treeTable"></table>
	</div>
    <script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/menuList.js"></script>
	<script type="text/html" id="iconTpl">
 		{{#  if(d.icon === null){ }}
		{{#  } else{ }}
		    <i class="layui-icon">{{ d.icon }}</i>  
  		{{#  } }}
	</script>
</body>
</html>