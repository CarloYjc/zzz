<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售订单</title>
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
	<blockquote class="layui-elem-quote list_search">
		<form class="layui-form">
			<div>
				<div class="layui-inline">
					<div class="layui-input-inline">
						<input type="text" id="oid" value="" placeholder="请输入订单号" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" id="custName" value="" placeholder="请输入公司名称" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" id="orderDateStart" value="" placeholder="请输入起始时间" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" id="orderDateEnd" value="" placeholder="请输入结束时间" class="layui-input">
					</div>
					<div class="layui-input-inline layui-form">
						<select name="orderStatus" class="" id="orderStatus">
							<option value="未选择状态">请选择订单状态</option>
							<option value="订单输入">订单输入</option>
							<option value="制作中">制作中</option>
							<option value="发货中">发货中</option>
							<option value="对账中">对账中</option>
							<option value="待收款">待收款</option>
							<option value="订单结束">订单结束</option>
						</select>
					</div>
					<div class="layui-input-inline">
						<input type="text" id="note" value="" placeholder="请输入备注" class="layui-input">
					</div>
					&nbsp;&nbsp;&nbsp;
					<a class="layui-btn search_btn" lay-submit="" data-type="search" lay-filter="search">查询</a>
					<a class="layui-btn layui-btn-danger reset_btn" lay-submit="" data-type="search" lay-filter="search">重置</a>
				</div>
			</div>
			<div>
				<div class="layui-inline">
					<a class="layui-btn layui-btn-normal btnAddSell">
						<cite>新增订单</cite>
					</a>
				</div>
				<div class="layui-inline">
					<a class="layui-btn btnUpdateSell">
						<cite>编辑订单</cite>
					</a>
				</div>
                <div class="layui-inline">
	                <a class="layui-btn layui-btn-danger btnDeleteSell">
	                    <cite>删除订单</cite>
	                </a>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-normal btnEndSell">
                        <cite>结束订单</cite>
                    </a>
                </div>
			</div>
		</form>
	</blockquote>
	<!-- 数据表格 -->
	<table id="sellList" lay-filter="test"></table>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/sellList.js"></script>
</body>
</html>