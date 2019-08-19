<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
$('#user_user_comment_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/userCommentAction!findUserCommentsByCondition.action',
	fit : true,
	border : false,
	pagination : true,
	pagePosition:'bottom',
	idField : 'commId',
	pageSize : 10,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	checkOnSelect : true,
	selectOnCheck : false,
	frozenColumns : [ [ {
		field : 'commId',
		title : '编号',
		width : 100,
		checkbox : true
	}, {
		field : 'bookName',
		title : '图书名称',
		width : 100
	} ] ],
	columns : [ [ {
		field : 'userName',
		title : '用户名',
		width : 100
	}, {
		field : 'commTime',
		title : '评论时间',
		width : 150,
		sortable : true
	}, {
		field : 'content',
		title : '评论内容',
		width : 350
	} ] ],
	toolbar : [ {
		text : '增加',
		iconCls : 'icon-add',
		handler : function() {
		}
	}, '-', {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
		}
	}, '-', {
		text : '修改',
		iconCls : 'icon-edit',
		handler : function() {
		}
	}, '-' ]
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/comment/UserCommentManager.js"></script>
<div id="user_user_comment_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false,height:70,hidden:true" style="padding:5px 30px;">
		<form id="user_user_comment_searchForm">
			用户名：<input class="easyui-textbox" name="name" /> 
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="searchFun();">查询</a> 
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'sjx-icon-trash'" onclick="clearFun();">清空</a>
		</form>
	</div>
	<div data-options="region:'center',border:true">
		<table id="user_user_comment_datagrid"></table>
	</div>
</div>
