layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate', 'element'], function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery,
		laydate = layui.laydate, table = layui.table, element = layui.element;

	//数据表格
	table.render({
		id: 'mergeInfo',
	    elem: '#mergeInfo',
	    url: ctx + '/sell/getMergeInfo',
	    limit: 200,
	    cols: [[ //表头
	    	{field: 'itemno', title: '货号', width: 100},
	    	{field: 'itemName', title: '品名', width: 100},
	    	{field: 'itemSpec', title: '规格', width: 100},
	    	{field: 'weight', title: '重量', width: 100},
	    	{field: 'num', title: '数量', width: 85},
	    	{field: 'price', title: '参考单价', width: 92},
	    	{field: 'aprice', title: '实际单价', width: 92, edit: 'text'},
	    	{field: 'amt', title: '实际金额', width: 92}
	    ]],
	    page: false,
	    where: { oid: $("#oid").val(), sid : $("#sid").val() },
	    done: function (res, curr, count) {
	        var that = this.elem.next();
	        res.data.forEach(function (item, index) {
	            if (index % 2 == 0) {
	                var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#fff");
	            } else {
	                var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#f7f7f7");
	            }
	        });
	    }
    });
	
	//监听单元格编辑
	table.on('edit(test)', function(obj){
	    var value = obj.value;
	    var reg = /^\d{1,4}(\.\d{1,2})?$/;
        if(value != "" && !reg.test(value)) {
        	$(this).val("");
        	obj.tr.find('td[data-field=amt]').find('div.layui-table-cell').html("");
    	    layer.msg('不符合正确格式!');
        }else{
        	value = obj.data.num * value
        	obj.tr.find('td[data-field=amt]').find('div.layui-table-cell').html(value.toFixed(2));
        }
	});
	
 	form.on("submit(btnMergeShip)", function(){
 		var data = table.cache['mergeInfo'], flag = false, msg = "";
 		for (var i = 0; i < data.length; i++) {
			if (data[i].aprice == '') {
				msg += (i + 1) + ",";
			}else{
				data[i].amt = data[i].num * data[i].aprice;
			}
		}
 		if (msg.length > 0) {
			layer.msg("第" + msg.substring(0, msg.length - 1) + "行实际单价不能为空！");
			return false;
		}

 		var obj = [];
 		obj.push({
			"oid" : $("#oid").val(),
			"sid" : $("#sid").val(),
			"data" : data
		});
 		
 		var index = top.layer.msg('数据提交中，请稍候', {icon : 16, time : false, shade : 0.8});		
 		$.ajax({
    		type: "post",
			url: ctx + "/sell/mergeShipInfo",
			data: JSON.stringify(obj),
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: function(result) {
				if(result.code == 0){
 					flag = true;
				}
				msg = result.msg;
			},
			error: function() {
				msg = "发生错误，请检查输入！";
			}
        });
 		setTimeout(function(){
 			top.layer.close(index);
			top.layer.msg(msg);
 			if(flag){
 				var parentName = $("#parentName").val();
 				var ifrc = window.parent.frames[parentName];
 				var winc = ifrc.window || ifrc.contentWindow;
 				var orderStatus = winc.document.getElementById("orderStatus").value;
 				if(orderStatus == "发货中"){
 					winc.document.getElementById("orderStatus").value = "对账中";
 				}
 				var index = parent.layer.getFrameIndex(window.name);
 				parent.layer.close(index);
 			}
        }, 2000);
		return false;
 	})
})