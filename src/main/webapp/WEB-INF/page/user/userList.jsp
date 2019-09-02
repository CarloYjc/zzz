<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/font_eolqem241z66flxr.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/list.css" media="all" />
<script>
	var ctx = "${ctx}";
</script>
</head>
<body class="childrenBody">
	<input type="hidden" id="userId" value="<shiro:principal property="id"/>" />
	<blockquote class="layui-elem-quote list_search">
		<shiro:hasPermission name="sys:user:insert">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal btnAddUser">
					<i class="layui-icon">&#xe608;</i> 
					<cite>添加用户</cite>
				</a>
			</div>
		</shiro:hasPermission>
		<shiro:hasPermission name="sys:user:update">
			<div class="layui-inline">
				<a class="layui-btn btnUpdateUser">
					<i class="layui-icon">&#xe640;</i>
					<cite>编辑用户</cite>
				</a>
			</div>
		</shiro:hasPermission>
	</blockquote>
	<!-- 数据表格 -->
	<table id="userList" lay-filter="test"></table>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/userList.js"></script>
	<script type="text/html" id="sexTpl">
 		{{#  if(d.status === '0'){ }}
   			<span style="color: #F581B1;">禁用</span>
  		{{#  } else if(d.status === '1'){ }}
   		 	正常
		{{#  } else{ }}

  		{{#  } }}
	</script>
</body>
</html>