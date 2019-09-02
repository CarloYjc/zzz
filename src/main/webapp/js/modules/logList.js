layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate'],function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer,
		laydate = layui.laydate, $ = layui.jquery, nowTime = new Date().valueOf(), max = null, 
		active = {
			search: function() {
			    var operation = $("#operation"),
			    createTimeStart = $("#createTimeStart"),
			    createTimeEnd = $("#createTimeEnd");
			    // 执行重载
			    table.reload('logList', {
			        page: {
			            curr: 1 // 重新从第 1 页开始
			        },
			        where: {
			            operation: operation.val(),
			            createTimeStart: createTimeStart.val(),
			            createTimeEnd: createTimeEnd.val()
			        }
			    });
			}
    	};
		    
	var start = laydate.render({
	    elem: '#createTimeStart',
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
	    elem: '#createTimeEnd',
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
	
	// 加载页面数据
	table.render({
	    id: 'logList',
	    elem: '#logList',
	    url: ctx + '/log/getLogList', // 数据接口
	    limit: 10, // 每页默认数
	    limits: [10, 15, 20, 25],
	    cols: [[ // 表头
	    	{field: 'id', title: 'ID', width: 70},
	    	{field: 'operation', title: '操作'},
	    	{field: 'method', title: '请求路径'},
	    	{field: 'params', title: '请求参数'},
	    	{field: 'ip', title: 'ip'},
	    	{field: 'username', title: '操作人'},
	    	{field: 'createTime', title: '操作时间'}
    	]],
	    page: true, // 开启分页
	    where: {timestamp: (new Date()).valueOf()}
	});
	
	// 查询
	$(".search_btn").click(function() {
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
	
	// 重置
	$(".reset_btn").click(function() {
		$("#operation").val('');
		$("#createTimeStart").val('');
		$("#createTimeEnd").val('');
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	})
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