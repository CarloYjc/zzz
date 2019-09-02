layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery'], function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery;
	
 	form.on("submit(editSellInfo)",function(data){
 		var index = top.layer.msg('数据提交中，请稍候', {icon : 16, time : false, shade : 0.8});
		var msg = "";
 		$.ajax({
    		type: "post",
			url: ctx + "/sell/updateSellInfo",
			data: data.field,
			dataType: "json",
			async: false,
			success: function(res) {
	        	msg = res.msg;
			},
			error: function() {
				layer = "发生错误，请检查输入！";
			}
        });
 		setTimeout(function(){
 			top.layer.close(index);
 			if (msg == "修改成功！") {
				top.layer.msg(msg, {
					icon : 1
				});
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			} else {
				top.layer.msg(msg, {
					icon : 5
				});
			}
        }, 2000);
 		return false;
 	})
})