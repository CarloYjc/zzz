layui.config({
	base : "js/"
}).use(['element', 'layer', 'form', 'treeGrid', 'jquery'], function() {
	var treeGrid = layui.treeGrid, form = layui.form, $ = layui.jquery, table = layui.table;
	var treeTable = treeGrid.render({
		id: 'treeTable',
		elem: '#treeTable',
		url: ctx + '/menu/menuList',
		cellMinWidth: 100,
		treeId: 'menuId',
		treeUpId: 'parentId',
		treeShowName: 'title',
		cols: [[
			{field: 'menuId', title: ' ', type: 'checkbox', unresize: true},
			{field: 'title', title: '菜单名'},
			{field: 'icon', title: '图标', templet: '#iconTpl'},
			{field: 'href', title: '链接'},
			{field: 'perms', title: '权限标识'},
			{field: 'sorting', title: '排序', event: 'sorting', style: 'cursor: pointer;'}
		]],
		page: false
	});

	// 监听单元格编辑
	treeGrid.on('tool(treeTable)', function(obj) {
		var data = obj.data;
		if (obj.event === 'sorting') {
			var msg = '', flag = false;
			layer.prompt({
				formType : 2,
				title : '修改ID为 [' + data.menuId + '] 的排序',
				value : data.sorting
			}, function(value, index) {
				layer.close(index);
				if (data.sorting.toString() != value) {
					$.ajax({
						type: "POST",
						url: ctx + '/menu/updateMenuSort',
						async: false,
						data: {
							'menuId': data.menuId,
							'sorting': value
						},
						success: function(d) {
							if (d.code == 0) {
								msg = "修改成功";
								flag = true;
							} else {
								if (d.code == null || d.code == '') {
									msg = "权限不足，联系超管！";
								} else {
									msg = d.msg;
								}
								value = data.sorting;
							}
						}
					});
					if (flag) {
						layer.msg(msg, {icon : 1});
						// 同步更新表格和缓存对应的值
						treeGrid.reload("treeTable", {})
					} else {
						layer.msg(msg, {icon : 5});
					}
				}else{
					layer.msg('两次排序一致!', {icon : 5});
				}
			});
		}
	});

	$("#btnAddMenu").click(function() {
		var checkStatus = treeGrid.checkStatus('treeTable'), data = checkStatus.data, parentId = 0;
		if (data.length > 1) {
			layer.msg("只能选择一个！", {icon : 5});
			return;
		}
		if (data.length > 0) {
			parentId = data[0].menuId;
		}
		if (parentId == 1) {
			layer.msg("不允许编辑此菜单!", {icon : 5});
			return;
		}
		layer.open({
			type: 2,
			title: "添加菜单",
			area: ['470px', '420px'],
			content: ctx + "/menu/addMenu/" + parentId,
			end: function() {
				location.reload();
			}
		});
	})

	$("#btnEditMenu").click(function() {
		var checkStatus = treeGrid.checkStatus('treeTable'), data = checkStatus.data, menuId = -1;
		if (data.length == 0) {
			layer.msg("请选择要操作的菜单!", {icon : 5});
			return;
		}
		if (data.length > 1) {
			layer.msg("只能选择一个!", {icon : 5});
			return;
		}
		menuId= data[0].menuId;
		if (menuId == 1) {
			layer.msg("不允许编辑此菜单!", {icon : 5});
			return;
		}
		
		layer.open({
			type: 2,
			title: "编辑菜单",
			area: ['470px', '420px'],
			content : ctx + "/menu/editMenu/" + menuId
		})

	})

	$("#btnDeleteMenu").click(function() {
		var checkStatus = treeGrid.checkStatus('treeTable'), data = checkStatus.data, menuId = -1;
		if (data.length == 0) {
			layer.msg("请选择要操作的菜单!", {icon : 5});
			return;
		}
		if (data.length > 1) {
			layer.msg("只能选择一个!", {icon : 5});
			return;
		}
		menuId= data[0].menuId;
		if (menuId == 1) {
			layer.msg("不允许删除此菜单!", {icon : 5});
			return;
		}
		layer.confirm('确定删除菜单?', function(index) {
			$.ajax({
				url : ctx + '/menu/deleteMenu/' + menuId,
				type : "post",
				success : function(d) {
					if (d.code == 0) {
						layer.msg("删除成功！", {icon : 1});
						setTimeout(function() {treeGrid.reload("treeTable", {})}, 500);
					} else {
						layer.msg(d.msg, {icon : 5});
					}
				}
			})
			layer.close(index);
		});

	})
});