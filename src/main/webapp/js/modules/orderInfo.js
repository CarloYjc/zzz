layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate'], function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;
	
	//数据表格
	table.render({
		id: 'orderInfoList',
	    elem: '#orderInfoList',
	    url: ctx + '/actual/getOrderInfoList/' + $("#aid").val(),
	    limit: 200,
	    cols: [[ //表头
	    	{title: '序号', templet: '#serialNumber', width: 60},
	    	{field: 'itemno', title: '货号', width: 100},
	    	{field: 'itemName', title: '品名', width: 100},
	    	{field: 'itemSpec', title: '规格', width: 100},
	    	{field: 'weight', title: '重量', width: 100},
	    	{field: 'num', title: '数量', width: 60},
	    	{field: 'aprice', title: '单价', width: 80, templet: function (m){
	    		return '<div style = "text-align: right">' + m.aprice.toFixed(2) +'</div>'; 
	    	}},
	    	{field: 'amt', title: '金额', width: 80, templet: function (m){
	    		return '<div style = "text-align: right">' + m.amt.toFixed(2) +'</div>'; 
	    	}},
	    ]],
	    page: false
    });

})
