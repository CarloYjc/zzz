var menu = {
	setting : {
		view : {
			showIcon : false,
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "menuId",
				pIdKey : "parentId",
			},
			key : {
				name : "title",
			}
		},
		check : {
			enable : true
		}
	},
	loadMenuTree : function() {
		$.ajax({
			type : "post",
			url : ctx + '/role/xtreedata',
			dataType : "json",
			success : function(data) {
				$.fn.zTree.init($("#xtree1"), menu.setting, data);
			}
		})
	}
};

$().ready(function(data){
	menu.loadMenuTree();
	$("#checkAllTrue").bind("click", {type : "checkAllTrue"}, checkNode);
	$("#checkAllFalse").bind("click", {type : "checkAllFalse"}, checkNode);
});

function checkNode(e) {
    var zTree = $.fn.zTree.getZTreeObj("xtree1"), nodes = zTree.getSelectedNodes(), type = e.data.type;
	if (type.indexOf("All") < 0 && nodes.length == 0) {
	    alert("请先选择一个节点");
	}
	if (type == "checkAllTrue") {
	    zTree.checkAllNodes(true);
	} else if (type == "checkAllFalse") {
        zTree.checkAllNodes(false);
    }
	return false;
}

layui.config({
	base : "js/"
}).use(['form', 'layer', 'jquery'], function(){
	var form = layui.form, layer = parent.layer === undefined ? layui.layer : parent.layer, $ = layui.jquery;
	
 	$("#roleName").blur(function(){
 		$.ajax({
            type: "get",
            url: ctx + "/role/checkRoleName/" + $("#roleName").val(),
            success:function(data){
            	if(data.code != 0){
            		top.layer.msg(data.msg);
            		$("#roleName").val("");
            		$("#roleName").focus();
            	}
            }
        });
 	})
 	
 	form.on("submit(addRole)",function(data){
 		var treeObj = $.fn.zTree.getZTreeObj("xtree1");
 		var list = treeObj.getCheckedNodes(true);
 		var menuStr = "";
		for (var i = 0; i < list.length; i++) {
			menuStr += list[i].menuId + ",";
		}
		menuStr = menuStr.substring(0, menuStr.length - 1);
		$("#menu").val(menuStr);
 		var index = top.layer.msg('数据提交中，请稍候', {icon: 16, time: false, shade: 0.8});
 		var msg;
 		$.ajax({
            type: "POST",
            url: ctx + "/role/insertRole",
            data: $("#roleForm").serialize(),
            success: function(d){
				if(d.code == 0){
					msg = "新增成功！";
				}else{
					msg = d.msg;
				}
			}
        });
 		setTimeout(function(){
        	top.layer.close(index);
        	top.layer.msg(msg);
 			layer.closeAll("iframe");
	 		parent.location.reload();
        }, 2000);
 		return false;
 	})
 	
})
