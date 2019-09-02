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
@media ( max-width :1240px) {
    .layui-inline{
        width: 100%;
        float: none;
    }
}
</style>
</head>
<body class="childrenBody">
    <form class="layui-form" style="width: 98%; margin-top: 10px;">
        <input type="hidden" name="status" value="${sell.status }"/>
        <input type="hidden" name="tamt" value="${sell.tamt }"/>
        <input type="hidden" name="atamt" value="${sell.atamt }"/>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">订单号</label>
                <div class="layui-input-inline">
                    <input type="text" id="oid" class="layui-input" readonly="readonly" name="oid" value="${sell.oid }">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="custName" class="layui-input" lay-verify="required" name="custName" value="${sell.custName }">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">订单日期</label>
                <div class="layui-input-inline">
                    <input type="text" id="orderDate" class="layui-input" lay-verify="required" name="orderDate" value="${sell.orderDate}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">交货日期</label>
                <div class="layui-input-inline">
                    <input type="text" id="deliDate" class="layui-input" lay-verify="required" name="deliDate" value="${sell.deliDate}">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">订单状态</label>
                <div class="layui-input-inline">
                    <input type="text" id="orderStatus" class="layui-input" readonly="readonly" name="orderStatus" value="${sell.orderStatus }">
                </div>
            </div>
            <div class="layui-inline">
	            <label class="layui-form-label">备注</label>
	            <div class="layui-input-inline">
	               <input type="text" id="note" class="layui-input" name="note" value="${sell.note }" >
	            </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" lay-submit="" lay-filter="btnSave">立即保存</button>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal btnAddShip">
                    <cite>发货单</cite>
                </a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger btnDeleteShip">
                    <cite>删除订单</cite>
                </a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn btnMergeShip">
                    <cite>合并对账</cite>
                </a>
            </div>
        </div>
    </form>
    <div style="float:left; margin-right: 20px;">
        <div class="layui-inline" style="margin-left: 10px">
            <a class="layui-btn layui-btn-normal btnAddSellInfo">
                <cite>新增明细</cite>
            </a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn btnEditSellInfo">
                <cite>编辑明细</cite>
            </a>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-danger btnDeleteSellInfo">
                <cite>删除明细</cite>
            </a>
        </div>
        &nbsp;&nbsp;&nbsp;
        <div class="layui-inline">
            <a class="layui-btn layui-btn-warm btnMake">
                <cite>制作</cite>
            </a>
        </div>
        <table id="sellInfoList" lay-filter="test"></table>
    </div>
    <div>
       <table id="shipInfoList" lay-filter="test"></table>
    </div>
    <script type="text/javascript" src="${ctx }/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx }/js/modules/sellInfo.js"></script>
</body>
</html>