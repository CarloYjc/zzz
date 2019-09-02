layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery', 'laypage', 'table', 'laytpl'], function(){
	var form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage, $ = layui.jquery;
	//数据表格
	table.render({
		id: 'userList',
	    elem: '#userList',
	    url: ctx + '/user/getUserList',
	    cellMinWidth: 80,
	    limit: 10,//每页默认数
	    limits: [10, 15, 20, 25], 
	    cols: [[ //表头
	    	{type: 'checkbox'},
	    	{field: 'id', title: 'ID'},
	    	{field: 'username', title: '用户名'},
	    	{field: 'fullname', title: '全称'},
	    	{field: 'status', title: '状态', templet: '#sexTpl'},
		 	{field: 'roleName', title: '角色'}
	    ]],
	    page: true, //开启分页
		where: {timestamp: (new Date()).valueOf()}
    });
	
	$(".btnAddUser").click(function(){
		layer.open({
			type: 2,
			title: "新增用户",
			area: ['380px', '430px'],
			content: ctx + "/user/addUser"
		})
	})
	
	$(".btnUpdateUser").click(function() {
		var checkStatus = table.checkStatus('userList'),
			data = checkStatus.data;
		if(data.length == 0 || data.length > 1){
			layer.msg("请选择一个!", {
				icon : 5
			});
			return ;
		}
		if(data != ''){
			id = data[0].id;
			layer.open({
				type: 2,
				title: "编辑用户",
				area: ['380px', '430px'],
				content: ctx + "/user/editUser/" + id
			})
		}
	});				
})
