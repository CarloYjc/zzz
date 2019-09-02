<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加明细</title>
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
	    <input type="hidden" name="oid" value="${oid }"/>
		<div class="layui-form-item">
			<label class="layui-form-label">货号</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" lay-verify="required" placeholder="请选择货号" 
					id="itemno" name="itemno" value="" readonly="readonly" >
			</div>
			<div class="layui-input-inline">
			     <a class="layui-btn layui-btn-normal searchItemInfo">
                    <cite>查询</cite>
                </a>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">品名</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input" id="itemName" value="" readonly="readonly">
			</div>
		</div>
		<div class="layui-form-item">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="itemSpec" value="" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重量</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="weight" value="" readonly="readonly">
            </div>
        </div>
		<div class="layui-form-item">
			<label class="layui-form-label">数量</label>
			<div class="layui-input-block">
                <input type="text" class="layui-input" placeholder="请输入数量" lay-verify="number" name="num" id="num" 
                    value="">
            </div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addSellInfo">立即提交</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/addSellItemInfo.js"></script>
</body>
</html>