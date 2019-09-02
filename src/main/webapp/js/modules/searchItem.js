layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'laypage', 'table', 'laytpl'], function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer, 
	laypage = layui.laypage, $ = layui.jquery, active = {
		search : function() {
			// 执行重载
			table.reload('itemList', {
				page : {
					curr : 1
				// 重新从第 1 页开始
				},
				where : {
					itemno : $("#itemno").val(),
					itemName : $("#itemName").val(),
					status : "1"
				}
			});
		}
	};
	
	// 数据表格
	table.render({
		id: 'itemList',
	    elem: '#itemList',
	    url: ctx + '/item/getSellItem',
	    cellMinWidth: 60,
	    limit: 10,//每页默认数
	    limits: [10, 15, 20, 25], 
	    cols: [[ //表头
	    	{type: 'checkbox'},
	    	{field: 'id', title: 'ID'},
	    	{field: 'itemno', title: '货号'},
	    	{field: 'itemName', title: '品名'},
	    	{field: 'price', title: '单价', templet: function (m){
	    		return '<div style = "text-align: right">' + m.price.toFixed(2) +'</div>'; 
	    	}},
	    	{field: 'itemSpec', title: '规格'},
	    	{field: 'weight', title: '重量'}
	    ]],
	    page: true, //开启分页
		where: {timestamp: (new Date()).valueOf()}
	});
	
	// 查询
	$(".search_btn").click(function() {
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
	
	// 重置
	$(".reset_btn").click(function() {
		$("#itemno").val('');
		$("#itemName").val('');
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
	
	//选择
	$(".select_btn").click(function() {
		var checkStatus = table.checkStatus('itemList'), data = checkStatus.data;
		if(data.length != 1){
			layer.msg("请选择一个货号!", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			var parentName = $("#parentName").val();
			var ifrc = window.parent.frames[parentName];
			var winc = ifrc.window || ifrc.contentWindow;
			winc.document.getElementById("itemno").value = data[0].itemno;
			winc.document.getElementById("itemName").value = data[0].itemName;
			winc.document.getElementById("itemSpec").value = data[0].itemSpec;
			winc.document.getElementById("weight").value = data[0].weight;
			winc.document.getElementById("num").value = "";
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	})
	
})
