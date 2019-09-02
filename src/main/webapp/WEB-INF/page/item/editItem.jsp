<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>编辑货号</title>
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
		<input type="hidden" name="id" value="${item.id }"/>
		<div class="layui-form-item">
			<label class="layui-form-label">货号</label>
			<div class="layui-input-block">
				<input type="text" id="itemno" class="layui-input" lay-verify="required" readonly="readonly" 
				    name="itemno" value="${item.itemno }">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">品名</label>
			<div class="layui-input-block">
				<input type="text" name="itemName" class="layui-input" lay-verify="required" placeholder="请输入品名" 
				    value="${item.itemName }">
			</div>
		</div>
		<div class="layui-form-item">
            <label class="layui-form-label">单价</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" lay-verify="validateMoney" placeholder="请输入单价" name="price" 
                    value="${item.price }">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" placeholder="请输入规格" name="itemSpec" value="${item.itemSpec }">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重量</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" placeholder="请输入重量" name="weight" value="${item.weight }">
            </div>
        </div>
		<div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-block">
				<c:if test="${item.status == '0' }">
	                <input type="radio" name="status" value="0" title="禁用" checked> 
					<input type="radio" name="status" value="1" title="正常" >
				</c:if>
				<c:if test="${item.status == '1' }">
					<input type="radio" name="status" value="0" title="禁用" > 
	                <input type="radio" name="status" value="1" title="正常" checked>
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="editItem">立即保存</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/editItem.js"></script>
</body>
</html>