<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx}/css/font_eolqem241z66flxr.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/css/main.css" media="all" />
<script type="text/javascript" src="${ctx}/js/echarts.js"></script>
<script>
	var ctx = "${ctx}";
</script>
</head>
<body class="childrenBody" style="margin: 1%">
	<!-- 事件线 -->
	<div>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>报表</legend>
		</fieldset>
        <div id="container1" style="height: 250px;"></div>
        <div id="container2" style="height: 250px;"></div>
	</div>
	<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/js/modules/main.js?3"></script>
</body>
</html>