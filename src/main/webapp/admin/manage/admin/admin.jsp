<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var rootPath = '${pageContext.request.contextPath}/';
$('#admin_admin_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/adminAction!getAdmins.action',
	fit : true,
	border : false,
	pagination : true,
	pagePosition:'bottom',
	idField : 'aid',
	pageSize : 10,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	checkOnSelect : false,
	selectOnCheck : false,
	frozenColumns : [ [ {
		field : 'aid',
		title : '编号',
		width : 100,
		checkbox : true
	}, {
		field : 'username',
		title : '管理员登录名',
		width : 200
	} ] ],
	columns : [ [ {
		field : 'password',
		title : '登陆密码',
		width : 260
	},{
		field : 'createTime',
		title : '创建时间',
		width : 160
	}, {
		field : 'modifyTime',
		title : '修改时间',
		width : 160
	}  ] ],
	toolbar : [ {
		text : '增加',
		iconCls : 'icon-add',
		handler : function() {
			AdminManager.showPanel();
		}
	}]
});

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/admin/AdminManager.js"></script>
<div id="admin_admin_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:true">
		<table id="admin_admin_datagrid"></table>
	</div>
</div>
<style>
<!--
 .alignCls{width:360px;clear: both;margin:20px 0;height:30px;}
 .labelCls{width:60px;margin-left:70px;float:left;}
 .inCls{width:200px;float:right;}
 #addBook{padding-top:20px;}
 .cssImg{width:100%;height:41px;}
-->
</style>

<div id="addAdminPanel">
<form id="adminFormInfo">
	<div class="alignCls">
		<div class="labelCls">
        	<label for="name">登陆名:</label>
        </div>
        <div class="inCls">
        	<input class="easyui-textbox" type="text" name="username" data-options="required:true" />
        </div>
    </div>
    <div class="alignCls">
		<div class="labelCls">
        	<label for="name">登陆密码:</label>
        </div>
        <div class="inCls">
        	<input class="easyui-textbox" type="text" name="password" data-options="required:true" />
        </div>
    </div>
    <div class="alignCls">
		<div class="labelCls">
        	<label for="name"></label>
        </div>
        <div class="inCls">
        	<a href="javascript:AdminManager.saveAdmin()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
        </div>
    </div>
</form>
</div>










