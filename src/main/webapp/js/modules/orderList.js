layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate'], function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer,
		laydate = layui.laydate, $ = layui.jquery, max = null, nowTime = new Date().valueOf(),  
		active = {
			search: function() {
			    // 执行重载
			    table.reload('orderList', {
			        page: {
			            curr: 1 // 重新从第 1 页开始
			        },
			        where: {
			        	oid: $("#oid").val(),
			        	custName: $("#custName").val(),
			        	orderDateStart: $("#orderDateStart").val(),
			        	orderDateEnd: $("#orderDateEnd").val(),
			        	orderStatus: $("#orderStatus").val()
			        }
			    });
			}
    	};
	
	var start = laydate.render({
	    elem: '#orderDateStart',
	    type: 'datetime',
	    max: nowTime,
	    btns: ['clear', 'confirm'],
	    done: function(value, date) {
	        endMax = end.config.max;
	        end.config.min = date;
	        end.config.min.month = date.month - 1;
	    }
	});
	
	var end = laydate.render({
	    elem: '#orderDateEnd',
	    type: 'datetime',
	    max: nowTime,
	    done: function(value, date) {
	        if ($.trim(value) == '') {
	            var curDate = new Date();
	            date = {
	                'date': curDate.getDate(),
	                'month': curDate.getMonth() + 1,
	                'year': curDate.getFullYear()
	            };
	        }
	        start.config.max = date;
	        start.config.max.month = date.month - 1;
	    }
	})
	
	//数据表格
	table.render({
		id: 'orderList',
	    elem: '#orderList',
	    url: ctx + '/actual/getOrderList',
	    cellMinWidth: 80,
	    limit: 10,//每页默认数
	    limits: [10, 15, 20, 25], 
	    cols: [[ //表头
	    	{type: 'checkbox'},
	    	{field: 'aid', title: 'ID', templet: '#idLink', event: 'aid'},
	    	{field: 'oid', title: '订单号'},
	    	{field: 'custName', title: '客户名称'},
	    	{field: 'orderDate', title: '订单日期'},
	    	{field: 'tamt', title: '订单金额', templet: function (m){
	    		return '<div style = "text-align: right">' + m.tamt.toFixed(2) +'</div>'; 
	    	}},
	    	{field: 'orderStatus', title: '客户是否确认', templet: '#sexTpl'},
	    	{field: 'atamt', title: '实收金额', templet: function (m){
	    		return '<div style = "text-align: right">' + m.atamt.toFixed(2) +'</div>'; 
	    	}},
	    ]],
	    page: true, //开启分页
		where: {timestamp: (new Date()).valueOf()}
	});
	
	// 回车键查询
	$("body").keydown(function () {
        if (event.keyCode == "13") {
        	//keyCode=13是回车键
            $('.search_btn').click();
        }
    });
	
	// 查询
	$(".search_btn").click(function() {
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
	
	// 重置
	$(".reset_btn").click(function() {
		$("#oid").val('');
    	$("#custName").val('');
    	$("#orderDateStart").val('');
    	$("#orderDateEnd").val('');
    	$("#orderStatus").val('-1');
    	form.render('select');
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
	
	//导出订单
	$(".btnExportOrder").click(function() {
		var checkStatus = table.checkStatus('orderList'), data = checkStatus.data;
		if(data.length != 1){
			layer.msg("请选择一个订单！", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			window.open(ctx + '/actual/exportOrder/' + data[0].aid);
		}
	})
	
	//确认订单
	$(".btnConfirmOrder").click(function() {
		var checkStatus = table.checkStatus('orderList'), data = checkStatus.data;
		if(data.length != 1){
			layer.msg("请选择一个订单！", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			if(data[0].orderStatus == "1"){
				layer.msg("此订单已确认！", {
					icon : 5
				});
				return;
			}
			layer.confirm('是否确认？', function(index) {
            	$.ajax({
					url : ctx + '/actual/confirmOrder/' + data[0].aid,
					type : "post",
					success : function(res) {
						if (res.code == 0) {
							layer.msg("确认成功！", {icon : 1});
							$('.search_btn').click();
						} else {
							layer.msg(res.msg, {icon : 5});
						}
					}
				})
            });
		}
	})
	
	$(".btnColMoney").click(function() {
		var checkStatus = table.checkStatus('orderList'), data = checkStatus.data;
		if(data.length != 1){
			layer.msg("请选择一个订单！", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			if(data[0].orderStatus == "0"){
				layer.msg("此订单尚未确认！", {
					icon : 5
				});
				return;
			}
			layer.prompt({
				formType : 2,
				title : '收到订单号 [' + data[0].oid + '] 回款金额',
				value : data[0].atamt
			}, function(value, index) {
				layer.close(index);
				if (data[0].atamt.toString() != value) {
					$.ajax({
						type: "POST",
						url: ctx + '/actual/updateOrderAtamt',
						async: false,
						data: {
							'aid': data[0].aid ,
							'atamt': value
						},
						success: function(res) {
							if (res.code == 0) {
								layer.msg("修改成功！", {icon : 1});
								$('.search_btn').click();
							} else {
								layer.msg(res.msg, {icon : 5});
								value = data[0].atamt;
							}
						}
					});
				}else{
					layer.msg('两次金额一致!', {icon : 5});
				}
			});
		}
	})
	
	// 监听单元格编辑
	table.on('tool(test)', function(obj) {
		var data = obj.data;
		if (obj.event === 'aid') {
			layer.open({
				type: 2,
				title: "订单明细",
				area: ['710px', '500px'],
				content: ctx + "/actual/openOrderInfo/" + data.aid
			})
		}
	});
})
