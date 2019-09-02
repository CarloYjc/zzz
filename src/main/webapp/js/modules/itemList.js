layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'laypage', 'table', 'laytpl', 'upload', 'element'], function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer, 
		laypage = layui.laypage, $ = layui.jquery, max = null, upload = layui.upload, active = {
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
					status : $("#status").val()
				}
			});
		}
	};
	
	// 数据表格
	table.render({
		id : 'itemList',
		elem : '#itemList',
		url : ctx + '/item/getItemList',
		cellMinWidth : 80,
		limit : 10,// 每页默认数
		limits : [ 10, 15, 20, 25 ], 
	    cols: [[ //表头
	    	{type: 'checkbox'},
	    	{field: 'id', title: 'ID'},
	    	{field: 'itemno', title: '货号'},
	    	{field: 'itemName', title: '品名'},
	    	{field: 'price', title: '单价', templet: function (m){
	    		return '<div style = "text-align: right">' + m.price.toFixed(2) +'</div>'; 
	    	}},
	    	{field: 'itemSpec', title: '规格'},
	    	{field: 'weight', title: '重量'},
	    	{field: 'status', title: '状态', templet: '#sexTpl'}
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
		$("#status").val('-1');
		form.render('select');
		var type = $(this).data('type');
		active[type] ? active[type].call(this) : '';
	})
	
	$(".btnAddItem").click(function() {
		layer.open({
			type : 2,
			title : "新增货号",
			area : [ '380px', '450px' ],
			content : ctx + "/item/addItem",
			end : function() {
				$("#itemno").val('');
				$("#itemName").val('');
				$("#status").val('-1');
				form.render('select');
				var recodeLimit = $(".layui-laypage-limits").find("option:selected").val();
				var count = $(".layui-laypage-count").text(); // 共xxxx条
				count = count.substring(count.indexOf(' ') + 1, count.lastIndexOf(' '));
				table.reload('itemList', {
					page : {
						curr : Math.ceil((count * 1 + 1) / (recodeLimit * 1))
					},
					where : {
						itemno : '',
						itemName : '',
						status : '-1'
					}
				});
			}
		})
	})
	
	$(".btnUpdateItem").click(function() {
		var checkStatus = table.checkStatus('itemList'), data = checkStatus.data;
		if (data.length == 0 || data.length > 1) {
			layer.msg("请选择一个货号！", {
				icon : 5
			});
			return;
		}
		if (data != '') {
			layer.open({
				type : 2,
				title : "编辑货号",
				area : [ '380px', '450px' ],
				content : ctx + "/item/editItem/" + data[0].id,
				end : function() {
					table.reload('itemList', {
						page : {
							curr : $(".layui-laypage-em").next().html()
						},
						where : {
							itemno : $("#itemno").val(),
							itemName : $("#itemName").val(),
							status : $("#status").val()
						}
					});
				}
			})
		}
	});
	
	$(".btnExportItem").click(function() {
		window.open(ctx + '/item/exportItem');
	});

	$(".btnExportTemplate").click(function() {
		window.open(ctx + '/item/exportTemplate');
	});
	
	upload.render({
		elem : '#btnUploadExcel',
		url : ctx + '/item/importExcel',
		accept : 'file',
		exts : 'xlsx|xls',
		done : function(res) {
			if (res.code == 0) {
				layer.msg("导入成功！", {
					icon : 1
				});
			} else {
				layer.msg(res.msg, {
					icon : 5
				});
			}
		}
	});
})
