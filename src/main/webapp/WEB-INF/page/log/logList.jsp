<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/font_eolqem241z66flxr.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/list.css" media="all" />
<script>  
    var ctx = "${ctx}";  
</script> 
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote list_search">
		<form class="layui-form">
		<div>
			</div>
			<div class="layui-inline">
				<input type="text" id="operation" class="layui-input" name="operation" placeholder="请输入需要查询的操作" 
				    value="">
			</div>
			<div class="layui-inline">
				<input type="text" id="createTimeStart" class="layui-input" name="createTimeStart" 
				    placeholder="操作时间(开始)" value="">
			</div>		
			<div class="layui-inline">
				<input type="text" id="createTimeEnd" class="layui-input" name="createTimeEnd" 
				    placeholder="操作时间(结束)" value="">
			</div>	
			<a class="layui-btn search_btn" lay-submit="" data-type="search" lay-filter="search">查询</a>
			<a class="layui-btn layui-btn-danger reset_btn" lay-submit="" data-type="search" lay-filter="search">重置</a>
	   </form>
    </blockquote>
	<div class="layui-form">
	  	<table id="logList" lay-filter="logList"></table>
	</div>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/logList.js"></script>
</body>
</html>