layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery'], function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery;
	
	$(".searchItemInfo").click(function(){
		layer.open({
			type: 2,
			title: "选择货号",
			area: ['700px', '620px'],
			content: ctx + "/item/searchItem/" + window.name
		})
	})

 	form.on("submit(addSellInfo)",function(data){
 		var index = top.layer.msg('数据提交中，请稍候', {icon : 16, time : false, shade : 0.8});
		var msg = "";
 		$.ajax({
    		type: "post",
			url: ctx + "/sell/insertSellInfo",
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
 			if (msg == "添加成功！") {
				top.layer.msg(msg, {
					icon : 1
				});
				$("#itemno").val('');
	        	$("#itemName").val('');
	        	$("#itemSpec").val('');
	        	$("#weight").val('');
	        	$("#num").val('');
			} else {
				top.layer.msg(msg, {
					icon : 5
				});
			}
        }, 2000);
 		return false;
 	})
})