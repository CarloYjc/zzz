layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate', 'element'], function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery,
		laydate = layui.laydate, table = layui.table, element = layui.element;

	//数据表格
	table.render({
		id: 'shipInfo',
	    elem: '#shipInfo',
	    url: ctx + '/sell/getShipInfo',
	    limit: 200,
	    cols: [[ //表头
	    	{field: 'itemno', title: '货号', width: 100},
	    	{field: 'itemName', title: '品名', width: 100},
	    	{field: 'num', title: '数量', width: 85, edit: 'text'}
	    ]],
	    page: false,
	    where: { oid: $("#oid").val()},
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
	    var reg = /^[1-9]\d*$/;
        if(value != "" && !reg.test(value)) {
        	$(this).val("");
    	    layer.msg('不符合正确格式!');
        }
	});
	
 	form.on("submit(btnAddShip)", function(){
 		var data = table.cache['shipInfo'], flag = false;
 		for (var i = data.length -1; i >= 0; i--) {
			if(data[i].num == ''){
				data.splice(i, 1);
 			}
		}
		if(data.length > 0){
 	 		var index = top.layer.msg('数据提交中，请稍候', {icon : 16, time : false, shade : 0.8});		
 	 		$.ajax({
 	    		type: "post",
 				url: ctx + "/sell/insertShip/" + $("#oid").val(),
 				data: JSON.stringify(data),
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
 	 				if(orderStatus == "制作中"){
 	 					winc.document.getElementById("orderStatus").value = "发货中";
 	 				}
 	 				var index = parent.layer.getFrameIndex(window.name);
 	 				parent.layer.close(index);
 	 			}
 	        }, 2000);
 		}else{
 			layer.msg('所有数量不能都为空!');
 		}
		return false;
 	})
})