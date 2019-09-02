layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'laypage', 'table'],function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage, $ = layui.jquery;
	//数据表格
	table.render({
		id: 'roleList',
	    elem: '#roleList',
	    url: ctx + '/role/getRoleList',
	    cellMinWidth: 80,
	    limit: 10,//每页默认数
	    limits: [10, 15, 20, 25], 
	    cols: [[ //表头
	    	{type: 'checkbox'},
	    	{field: 'roleId', title: 'ID'},
	    	{field: 'roleName', title: '角色名'},
	    	{field: 'roleRemark', title: '角色描述'}
	    ]],
	    page: true, //开启分页
		where: {timestamp: (new Date()).valueOf()}
    });
	
	//添加角色
	$(".btnAddRole").click(function(){
		layer.open({
			type: 2,
			title: "新增角色",
			area: ['380px', '600px'],
			content: ctx + "/role/addRole"
		})
	})
	
	$(".btnUpdateRole").click(function() {
		var checkStatus = table.checkStatus('roleList'),
			data = checkStatus.data;
		if(data.length == 0 || data.length > 1){
			layer.msg("请选择一个角色!", {
				icon : 5
			});
			return ;
		}
		if(data != ''){
			if(data.roleName == '管理员'){
	    		layer.msg("不允许操作此角色！", {icon: 5});
	    		return;
			}
			id = data[0].roleId;
			layer.open({
				type: 2,
				title: "编辑角色",
				area: ['380px', '600px'],
				content: ctx + "/role/editRole/" + id
			})
		}
	});	

	$(".btnDeleteRole").click(function(){
		var checkStatus = table.checkStatus('roleList'), data = checkStatus.data, roleStr = '', flag = false;	
		if(data.length > 0){
	    	$.each(data, function (n, value) {
				if(value.roleName == '管理员'){
					flag = true;
	            	layer.msg("不允许操作此角色!", {icon: 5});
	            	return;
	            }
	            roleStr += value.roleId + ',';
            });
	    	if(flag){
	    		return;
	    	}
	    	roleStr = roleStr.substring(0, roleStr.length - 1);
			layer.confirm('真的要删除<strong>' + data.length + '</strong>条数据吗？', function(index){
				//调用删除接口
				$.ajax({
					url: ctx + '/role/deleteRole/' + roleStr,
		    		type: "get",
		    		success: function(d){
		    			if(d.code == 0){
		    				//删除成功，刷新父页面
		    				parent.location.reload();
		    			}else{
		    				layer.msg("权限不足请联系管理员！", {icon: 5});
	    			    }
	    		    }
		    	})
			});
		}else{
			layer.msg("请至少选择一个角色！");
		}
		
	})
	
})
