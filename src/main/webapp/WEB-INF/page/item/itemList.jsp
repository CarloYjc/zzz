<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货号列表</title>
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
						<input type="text" id="itemno" value="" placeholder="请输入货号" class="layui-input">
					</div>
					<div class="layui-input-inline">
						<input type="text" id="itemName" value="" placeholder="请输入品名" class="layui-input">
					</div>
					<div class="layui-input-inline layui-form">
						<select name="status" class="" id="status">
							<option value="-1">请选择货号状态</option>
							<option value="0">禁用</option>
							<option value="1">正常</option>
						</select>
					</div>
					&nbsp;&nbsp;&nbsp;
					<a class="layui-btn search_btn" lay-submit="" data-type="search" lay-filter="search">查询</a>
					<a class="layui-btn layui-btn-danger reset_btn" lay-submit="" data-type="search" lay-filter="search">重置</a>
				</div>
			</div>
			<div>
				<div class="layui-inline">
					<a class="layui-btn layui-btn-normal btnAddItem">
						<cite>新增货号</cite>
					</a>
				</div>
				<div class="layui-inline">
					<a class="layui-btn btnUpdateItem">
						<cite>编辑货号</cite>
					</a>
				</div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-danger btnExportItem">
                        <cite>导出货号</cite>
                    </a>
                </div>
                <div class="layui-inline">
                    <a class="layui-btn layui-btn-warm btnExportTemplate">
                        <cite>下载模板</cite>
                    </a>
                </div>
                <div class="layui-inline">
                	<button type="button" class="layui-btn" id="btnUploadExcel">
                		<i class="layui-icon"></i>
                		<cite>上传模板</cite>
               		</button>
                </div>
			</div>
		</form>
	</blockquote>
	<!-- 数据表格 -->
	<table id="itemList" lay-filter="test"></table>
	<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx }/js/modules/itemList.js"></script>
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