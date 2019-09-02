layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery'],function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery;
		
	// 自定义验证规则
	form.verify({ 
		pass: [/(.+){6,16}$/, '密码必须6到16位'],
		repass: function(value){
			var repassvalue = $('#password').val();
			if(value != repassvalue){
				return '两次输入的密码不一致!';
			}
		}
	});
		
	$("#username").blur(function(){
		$.ajax({
            type: "get",
            url: ctx + "/user/checkUserName/" + $("#username").val(),
            success: function(data){
            	if(data.code != 0){
            		top.layer.msg(data.msg);
            		$("#username").val("");
            		$("#username").focus();
            	}
            }
        });
	});
	
 	form.on("submit(addUser)",function(data){
 		// 弹出loading
 		var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
 		var msg;
 		$.ajax({
    		type: "post",
            url: ctx + "/user/insertUser",
            data: data.field,
			dataType: "json",
			success: function(d){
				if(d.code == 0){
		        	msg = "新增成功！";
				}else{
		        	msg = d.msg;
				}
			}
        });
 		setTimeout(function() {
			top.layer.close(index);
			top.layer.msg(msg);
			layer.closeAll("iframe");
			// 刷新父页面
			parent.location.reload();
		}, 2000);
 		return false;
 	})
	
})