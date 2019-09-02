<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<script type="text/javascript">  
    var ctx = "${ctx}";
    if(window != top){
        top.location.href = location.href;
    }
</script>
<link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/css/login.css" media="all" />
<body>
	<div class="video_mask"></div>
	<div class="login">
	    <h1>用户登录</h1>
	    <form class="layui-form" id="form">
	        <div class="layui-form-item">
	            <input class="layui-input" name="username" placeholder="用户名" lay-verify="required" type="text" autocomplete="off">
	        </div>
	        <div class="layui-form-item">
	            <input class="layui-input" name="password" placeholder="密码" lay-verify="required" type="password" autocomplete="off">
	        </div>
	        <div class="layui-form-item form_code">
	            <input class="layui-input" style="width: 140px;" name="vcode" placeholder="验证码" lay-verify="required" type="text" autocomplete="off" maxlength="4">
	            <div class="code"><img id="captcha" src="${ctx }/sys/vcode" width="100" height="36" onclick="refreshCode(this)"></div>
	        </div>
	        <button class="layui-btn login_btn" id="btn" lay-submit="" lay-filter="login">登录</button>
	    </form>
	</div>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/modules/login.js"></script>
</body>
</html>