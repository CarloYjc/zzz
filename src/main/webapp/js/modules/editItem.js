layui.config({
	base : "js/"
}).use([ 'form', 'layer', 'jquery' ], function() {
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery;

	// 自定义验证规则
	form.verify({
		validateMoney : [ /^$|\d{1,4}(\.\d{1,2})?$/, '请输入正确价格！' ]
	});

	form.on("submit(editItem)", function(data) {
		var index = top.layer.msg('数据提交中，请稍候', {
			icon : 16,
			time : false,
			shade : 0.8
		});
		var msg = "";
		$.ajax({
			type : "post",
			url : ctx + "/item/updateItem",
			data : data.field,
			dataType : "json",
			success : function(res) {
				msg = res.msg;
			},
			error: function() {
				msg = "发生错误，请检查输入！";
			}
		});
		setTimeout(function() {
			top.layer.close(index);
			if (msg == "修改成功！") {
				top.layer.msg(msg, {
					icon : 1
				});
				layer.closeAll("iframe");
			} else {
				top.layer.msg(msg, {
					icon : 5
				});
			}
		}, 2000);
		return false;
	})

})