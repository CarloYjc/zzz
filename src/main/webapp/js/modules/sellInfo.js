layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'table', 'laydate', 'element'], function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery, 
	laydate = layui.laydate, table = layui.table, element = layui.element;
	
	var start = laydate.render({
		elem : '#orderDate',
		type: 'datetime',
		done: function(value, date) {
	        endMax = end.config.max;
	        end.config.min = date;
	        end.config.min.month = date.month - 1;
	    }
	});
	
	var end = laydate.render({
		elem : '#deliDate',
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
	});
	
	loadShipInfoList();

	// 数据表格
	table.render({
		id: 'sellInfoList',
	    elem: '#sellInfoList',
	    url: ctx + '/sell/getSellInfoList',
	    limit: 200,
	    cols: [[ // 表头
	    	{type: 'checkbox', width: 48},
	    	{field: 'id', title: 'ID', width: 60},
	    	{field: 'oid', title: '订单号', width: 100},
	    	{field: 'itemno', title: '货号', width: 100},
	    	{field: 'itemName', title: '品名', width: 100},
	    	{field: 'itemSpec', title: '规格', width: 100},
	    	{field: 'weight', title: '重量', width: 100},
	    	{field: 'num', title: '数量', width: 78}
	    ]],
	    page: false,
	    where: { oid: $("#oid").val()},
	    done: function (res, curr, count) {
	    	$("[data-field='id']").css('display','none');
 	        $("[data-field='oid']").css('display','none');
	        var that = this.elem.next();
	        res.data.forEach(function (item, index) {
	            // console.log(item.empName);item表示每列显示的数据
	            if (index % 2 == 0) {
	                var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#fff");
	            } else {
	                var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#f7f7f7");
	            }
	        });
	    }
    });
	
	$(".btnAddSellInfo").click(function(){
 		var oid = $("#oid").val(), orderStatus = $("#orderStatus").val();
 		if(oid == ""){
 			layer.msg("请新增订单头！", {icon : 5});
 			return;
 		}
 		if(orderStatus == "订单结束"){
 			layer.msg("订单已结束！", {icon : 5});
 			return;
 		}
 		layer.open({
			type: 2,
			title: "新增明细",
			area: ['380px', '450px'],
			content: ctx + "/sell/addSellInfo/" + oid,
			end: function() {
				reloadTable();
				loadShipInfoList();
			}
		})
	})
	
	$(".btnEditSellInfo").click(function(){
		var checkStatus = table.checkStatus('sellInfoList'), data = checkStatus.data;
		if(data.length == 0 || data.length > 1){
			layer.msg("请选择一条明细！", {
				icon : 5
			});
			return;
		}
 		var orderStatus = $("#orderStatus").val();
 		if(orderStatus == "订单结束"){
 			layer.msg("订单已结束！", {icon : 5});
 			return;
 		}
		if(data != ''){
			layer.open({
 				type: 2,
 				title: "编辑明细",
 				area: ['380px', '450px'],
 				content: ctx + "/sell/editSellInfo/" + data[0].id,
 				end: function() {
 					reloadTable();
 					loadShipInfoList();
 				}
			})
		}
	})
	
	$(".btnDeleteSellInfo").click(function(){
		var checkStatus = table.checkStatus('sellInfoList'), data = checkStatus.data, idStr = '', 
			orderStatus = $("#orderStatus").val();
		if (data.length == 0) {
			layer.msg("请选择要操作的明细！", {icon : 5});
			return;
		}
		if (orderStatus != "订单输入"){
			layer.msg("当前状态无法删除明细！", {icon : 5});
			return;
		}
		$.each(data, function (n, value) {
			idStr += value.id + ',';
        });
		idStr = idStr.substring(0, idStr.length - 1);
        layer.confirm('确定删除<strong>' + data.length + '</strong>条数据吗？', function(index) {
        	$.ajax({
				url : ctx + '/sell/deleteSellInfo/' + idStr,
				type : "post",
				success : function(res) {
					if (res.code == 0) {
						layer.msg(res.msg, {icon : 1});
						reloadTable();
					} else {
						layer.msg(res.msg, {icon : 5});
					}
				}
			})
        });
	})
	
	$(".btnMake").click(function(){
		var oid = $("#oid").val(), orderStatus = $("#orderStatus").val();
 		if(oid == ""){
 			layer.msg("请新增订单头！", {icon : 5});
 			return;
 		}
 		if(orderStatus == "订单结束"){
 			layer.msg("订单已结束！", {icon : 5});
 			return;
 		}
		if(table.cache.sellInfoList.length > 0){
        	$.ajax({
				url : ctx + '/sell/makeSell/' + $("#oid").val(),
				type : "post",
				success : function(res) {
					if (res.code == 0) {
						if(res.msg == "制作中"){
							$("#orderStatus").val("制作中");
						}
					    var bdhtml = window.document.body.innerHTML;
			            var prnhtml = '<html><head><title>销售订单</title><style>table.cust-table{width:100%;border:solid #333;border-width:0;font-size:#333;border-collapse:collapse;border-spacing:0;table-layout:fixed}table.cust-table tbody tr td{padding:3px 5px;text-align:left;border:solid #333;border-width:0}table.default-table{width:100%;border:solid #333;border-width:1px 0 0 1px;font-size:#333;border-collapse:collapse;border-spacing:0;table-layout:fixed}table.cust-table tbody tr,table.default-table tbody tr{height:20px;line-height:20px}table.default-table tbody tr.odd,table.cust-table tbody tr.odd{background-color:#fff}table.default-table tbody tr.even,table.cust-table tbody tr.even{background-color:#f5f5f5}table.default-table tbody tr:hover,table.cust-table tbody tr:hover{background-color:#eee}table.default-table tbody tr td{padding:3px 5px;text-align:left;border:solid #333;border-width:0 1px 1px 0}table.default-table tbody tr td.tfw{font-weight:bold;text-align:center}table.cust-table tbody tr td.tfw{font-weight:bold;text-align:left}table.default-table tbody tr td.tac{text-align:center}table.default-table tbody tr td a:hover,table.cust-table tbody tr td a:hover{color:#0080c0}</style></head><body>';
			            var prnhtml = prnhtml + '<h2 align="center">客户订货单</h1>';
			            var prnhtml = prnhtml + '<table class="cust-table" style="margin-top:10px"><tr><td class="tfw">客户名称：' + $("#custName").val() + '</td><td></td></tr>';
			            var prnhtml = prnhtml + '<tr><td class="tfw">订货日期：' + $("#orderDate").val() + '</td><td class="tfw">交货日期：' + $("#deliDate").val() + '</td></tr>'; 
			            var prnhtml = prnhtml + '<tr><td class="tfw">订单号：' + $("#oid").val() + '</td><td class="tfw">备注：' + $("#note").val() + '</td></tr></table>'; 
			            var prnhtml = prnhtml + '<table class="default-table" style="margin-top:10px">';
			            if(Object.keys(res.data).length > 0){
			            	var prnhtml = prnhtml + '<tr><td class="tfw">货号</td><td class="tfw">品名</td><td class="tfw">规格</td><td class="tfw">数量</td><td class="tfw">注意事项</td>';
			            	for(i = 0; i < res.data.data.length ; i++){
			            		var prnhtml = prnhtml + '<tr><td class="tac">' + res.data.data[i].itemno + '</td>';
			            		var prnhtml = prnhtml + '<td class="tac">' + res.data.data[i].itemName + '</td>';
			            		var prnhtml = prnhtml + '<td class="tac">' + res.data.data[i].itemSpec + '</td>';
			            		var prnhtml = prnhtml + '<td class="tac">' + res.data.data[i].num + '</td>';
			            		var prnhtml = prnhtml + '<td class="tac"></td></tr>';
			            	}
			            }
			            var prnhtml = prnhtml + '</table></body>';
			            //alert(prnhtml);
			            window.document.body.innerHTML = prnhtml;
			            window.print();
			            window.document.body.innerHTML = bdhtml;
			            window.location.reload();;
					} else {
						layer.msg(res.msg, {icon : 5});
					}
				}
			})
		}else{
			layer.msg("明细为空!", {icon : 5});
		}
	})
	
	$(".btnAddShip").click(function(){
		var oid = $("#oid").val(), orderStatus = $("#orderStatus").val();
 		if(oid == ""){
 			layer.msg("请新增订单头！", {icon : 5});
 			return;
 		}
 		if(orderStatus == "订单结束"){
 			layer.msg("订单已结束！", {icon : 5});
 			return;
 		}
 		layer.open({
			type: 2,
			title: "新增出货",
			area: ['350px', '600px'],
			content: ctx + "/sell/addShip/" + oid + "/" + window.name,
			end: function() {
				loadShipInfoList();
			}
		})
	})
	
	$(".btnDeleteShip").click(function(){
		if($('[name="layTable3Checkbox"]:checked').length == 1){
			var numIndex = $($('[name="layTable3Checkbox"]:checked')[0]).attr("data-index");
			var sid = $("#shipInfoList").find("tr").eq(1).find("td").eq(numIndex).attr("data-value");
			var status = $("#shipInfoList").find("tr").eq(2).find("td").eq(numIndex).attr("data-value");
			if(status == "1"){
				layer.confirm('确定删除发货单？', function(index) {
					$.ajax({
						url : ctx + '/sell/deleteShip/' + sid,
						type : "post",
						success : function(res) {
							if (res.code == 0) {
								layer.msg("删除成功！", {icon : 1});
								loadShipInfoList();
							} else {
								layer.msg(res.msg, {icon : 5});
							}
						}
					})
				});
			}
			else{
				layer.msg("订单已经出货!", {icon : 5});
			}
		}else{
			layer.msg("请选择一条明细！", {icon : 5});
		}
	})
	
	$(".btnMergeShip").click(function(){
		if($('[name="layTable3Checkbox"]:checked').length >= 1){
			var str = "";
			$('[name="layTable3Checkbox"]:checked').each(function(i) {
				var index = $(this).attr("data-index");
				str += $("#shipInfoList").find("tr").eq(1).find("td").eq(index).attr("data-value") + ",";
			});
			if(str.length > 0){
				layer.open({
	 				type: 2,
	 				title: "合并对账",
	 				area: ['820px', '500px'],
	 				content: ctx + "/sell/mergeShip",
	 				success: function(layero, index) {
	 					var body = layer.getChildFrame('body', index);
	 					body.find('#oid').val($("#oid").val());
	 					body.find('#sid').val(str.substr(0, str.length - 1));
	 					body.find('#parentName').val(window.name);
					},
	 				end: function() {
	 					loadShipInfoList();
	 				}
	 			});
			}
		}else{
			layer.msg("请选择一条明细!", {icon : 5});
		}
	})
	
	function loadShipInfoList(){
		var oid = $("#oid").val();
		if(oid == ""){
			return;
		}
		$.ajax({
            type: "get",
            data: {oid: oid},
            url: ctx + '/sell/getShipInfoList',
            success: function(res){
        		$("#shipInfoList").html("");
            	if(res != "" && res.data.length > 1){
            		var data = res.data, y = Object.keys(data).length, datakey = ["sid", "ship_status", "ship_date"];
//                	for(var key in data[0]){
//                		if (key != "sid" && key != "ship_status" && key != "ship_date") {
//                			datakey.push(key);
//                		}
//            	    }
            		var str = res.msg.split(',');
            		for(var index in str){
            			datakey.push(str[index]);
            		}
                	var x = datakey.length;
            		var str = '<div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-3" style="">';
            		str += '<div class="layui-table-box">';
            		str += '<div class="layui-table-body layui-table-main">';
            		str += '<table cellspacing="0" cellpadding="0" border="0" class="layui-table">';
            		str += '<tbody>';
            		// checkbox
            		str += '<tr data-index="0" style="background-color: rgb(255, 255, 255);" class="">';
            		for(i = 0; i < y ; i++){
            			if(data[i]["ship_status"] == "2"){
                			str += '<td data-field="0"><div class="layui-table-cell laytable-cell-0"></div></td>';
            			}else{
	            			str += '<td data-field="0" class="layui-table-col-special">';
	        				str += '<div class="layui-table-cell laytable-cell-1 laytable-cell-checkbox">';
	            			str += '<input type="checkbox" name="layTable3Checkbox" data-index="' + i + '" lay-skin="primary" />';
	            			str += '<div class="layui-form-checkbox" lay-skin="primary">';
	            			str += '<i class="layui-icon layui-icon-ok"></i>';
	            			str += '</div>';
	            			str += '</div>';
	            			str += '</td>';
            			}
            		}
            		str += '</tr>';
            		for(j = 0; j < x; j++){
            			if(j % 2 == 0){
            				str += '<tr data-index="' + (j + 1) + '" style="background-color: rgb(247, 247, 247);" class="">';
            			}else{
            				str += '<tr data-index="' + (j + 1) + '" style="background-color: rgb(255, 255, 255);" class="">';
            			}
            			for(i = 0; i < y ; i++){
            				str += '<td data-field="' + datakey[j] + '" data-value="' + data[i][datakey[j]] + '" class="">';
            				if(i == 0){
            					str += '<div class="layui-table-cell laytable-cell-0">';
            				}else{
            					str += '<div class="layui-table-cell laytable-cell-0">';
            				}
            				str += data[i][datakey[j]];
            				str += '</div>';
            				str += '</td>';
            			}
                		str += '</tr>';
            		}
            		str += '</tbody>';
            		str += '</table>';
            		str += '</div>';
            		str += '</div>';
            		str += '<style>.laytable-cell-0{ width: 78px; } </style>';
            		str += '</div>';
            		$("#shipInfoList").html(str);
            		$("[data-field='sid']").css('display','none');
            		$("[data-field='ship_status']").css('display','none');
            		form.render('checkbox');
            	}
            }
        });
	}
	
    function reloadTable() {
    	var oid = $("#oid").val();
    	if(oid != ""){
	        table.reload("sellInfoList", { 
	        	url: ctx + '/sell/getSellInfoList',
	        	page: false,
	    	    where: { oid: oid},
	    	    done: function (res, curr, count) {
	    	        $("[data-field='id']").css('display','none');
	    	        $("[data-field='oid']").css('display','none');
	    	        var that = this.elem.next();
	    	        res.data.forEach(function (item, index) {
	    	            // console.log(item.empName);item表示每列显示的数据
	    	            if (index % 2 == 0) {
	    	                var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#fff");
	    	            } else {
	    	                var tr = that.find(".layui-table-box tbody tr[data-index='" + index + "']").css("background-color", "#f7f7f7");
	    	            }
	    	        });
	    	    }
	        });
    	}
    };
	
 	form.on("submit(btnSave)", function(data){
 		var index = top.layer.msg('数据提交中，请稍候', {icon : 16, time : false, shade : 0.8});
		var msg = "";
 		$.ajax({
    		type: "post",
			url: ctx + "/sell/saveSell",
			data: data.field,
			dataType: "json",
			success: function(res) {
				msg = res.msg;
			},
			error: function() {
				msg = "发生错误，请检查输入！";
			}
        });
 		setTimeout(function(){
 			top.layer.close(index);
 			if (msg == "保存成功！") {
				top.layer.msg(msg, {
					icon : 1
				});
			} else if(msg == "保存失败！" || msg == "发生错误，请检查输入！" || msg == "当前状态无法修改！") {
				top.layer.msg(msg, {
					icon : 5
				});
			} else {
				$("#oid").val(msg);
				top.layer.msg("保存成功！", {
					icon : 1
				});
			}
        }, 2000);
 		return false;
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