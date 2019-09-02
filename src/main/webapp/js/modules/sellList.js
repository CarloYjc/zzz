layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate'], function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer,
		laydate = layui.laydate, $ = layui.jquery, max = null, nowTime = new Date().valueOf(), 
		active = {
			search: function() {
			    table.reload('sellList', {
			        page: {
			            curr: 1 // 重新从第 1 页开始
			        },
			        where: {
			        	oid: $("#oid").val(),
			        	custName: $("#custName").val(),
			        	orderDateStart: $("#orderDateStart").val(),
			        	orderDateEnd: $("#orderDateEnd").val(),
			        	orderStatus: $("#orderStatus").val(),
			        	note: $("#note").val()
			        }
			    });
			}
    	};
	
	var start = laydate.render({
	    elem: '#orderDateStart',
	    type: 'datetime',
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
	    btns: ['clear', 'confirm'],
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
	
	// 数据表格
	table.render({
		id: 'sellList',
	    elem: '#sellList',
	    url: ctx + '/sell/getSellList',
	    limit: 10,// 每页默认数
	    limits: [10, 15, 20, 25], 
	    cols: [[ // 表头
	    	{type: 'checkbox'},
	    	{field: 'oid', title: 'ID', width: 85},
	    	{field: 'custName', title: '客户名称', width: 200},
	    	{field: 'orderDate', title: '订单日期', width: 190},
	    	{field: 'deliDate', title: '交货日期', width: 190},
	    	{field: 'orderStatus', title: '订单状态', width: 95},
	    	{field: 'note', title: '备注'},
	    	{field: 'tamt', title: '订单金额', width: 95, templet: function (m){
	    		return '<div style = "text-align: right">' + m.tamt.toFixed(2) +'</div>'; 
	    	}},
	    	{field: 'atamt', title: '实收金额', width: 95, templet: function (m){
	    		return '<div style = "text-align: right">' + m.atamt.toFixed(2) +'</div>'; 
	    	}}
	    ]],
	    page: true, // 开启分页
		where: {timestamp: (new Date()).valueOf()}
	});
	
	// 回车键查询
	$("body").keydown(function () {
        if (event.keyCode == "13") {
        	// keyCode=13是回车键
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
    	$("#orderStatus").val('未选择状态');
    	$("#note").val('');
    	form.render('select');
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
	
	$(".btnAddSell").click(function(){
		var index = layui.layer.open({
            title: "新增订单",
            type: 2,
            content: ctx + "/sell/addSell",
            success: function(layero, index) {}
        })
        $(window).resize(function() {
            layui.layer.full(index);
        })
        layui.layer.full(index);
	})
	
	$(".btnUpdateSell").click(function() {
		var checkStatus = table.checkStatus('sellList'), data = checkStatus.data;
		if(data.length != 1){
			layer.msg("请选择一个订单！", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			var index = layui.layer.open({
	            title: "编辑订单",
	            type: 2,
	            content: ctx + "/sell/editSell/" + data[0].oid,
	            success: function(layero, index) {}
	        })
	        $(window).resize(function() {
	            layui.layer.full(index);
	        })
	        layui.layer.full(index);
		}
	});
	
	$(".btnDeleteSell").click(function() {
		var checkStatus = table.checkStatus('sellList'), data = checkStatus.data;
		if(data.length == 0 || data.length > 1){
			layer.msg("请选择一个订单！", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			layer.confirm('确定删除这个订单吗？', function(index) {
            	$.ajax({
					url : ctx + '/sell/deleteSell/' + data[0].oid,
					type : "post",
					success : function(res) {
						if (res.code == 0) {
							layer.msg("删除成功！", {icon : 1});
							$('.search_btn').click();
						} else {
							layer.msg(res.msg, {icon : 5});
						}
					}
				})
            });
		}
	});
	
	$(".btnEndSell").click(function() {
		var checkStatus = table.checkStatus('sellList'), data = checkStatus.data;
		if(data.length == 0 || data.length > 1){
			layer.msg("请选择一个订单！", {
				icon : 5
			});
			return;
		}
		if(data != ''){
			layer.confirm('确定结束这个订单吗？', function(index) {
            	$.ajax({
					url : ctx + '/sell/endSell/' + data[0].oid,
					type : "post",
					success : function(res) {
						if (res.code == 0) {
							layer.msg("修改成功！", {icon : 1});
							$('.search_btn').click();
						} else {
							layer.msg(res.msg, {icon : 5});
						}
					}
				})
            });
		}
	});
})

// 格式化时间
function formatTime(datetime, fmt) {
    alert(datetime);
    if (datetime == null || datetime == 0) {
        return "";
    }
    if (parseInt(datetime) == datetime) {
        if (datetime.length == 10) {
            datetime = parseInt(datetime) * 1000;
        } else if (datetime.length == 13) {
            datetime = parseInt(datetime);
        }
    }
    datetime = new Date(datetime);
    var o = {
        "M+": datetime.getMonth() + 1,// 月份
        "d+": datetime.getDate(),// 日
        "h+": datetime.getHours(), // 小时
        "m+": datetime.getMinutes(),// 分
        "s+": datetime.getSeconds(),// 秒
        "q+": Math.floor((datetime.getMonth() + 3) / 3),// 季度
        "S": datetime.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o) if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}