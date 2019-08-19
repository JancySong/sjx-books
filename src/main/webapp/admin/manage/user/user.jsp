<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/Constants.js"></script>
<script type="text/javascript">
$('#user_user_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/userAction!getUsers.action',
	fit : true,
	border : false,
	pagination : true,
	pagePosition:'bottom',
	idField : 'userId',
	pageSize : 10,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	checkOnSelect : true,
	selectOnCheck : false,
	frozenColumns : [ [ {
		field : 'userId',
		title : '编号',
		width : 100,
		checkbox : true
	}, {
		field : 'username',
		title : '登录名称',
		width : 180,
		sortable : true,
		formatter : function(value, row, index) {
			return '<span title="'+value+'">'+value+'</span>';
		}
	} ] ],
	columns : [ [ {
		field : 'password',
		title : '密码',
		width : 260
	}, {
		field : 'email',
		title : '邮箱',
		width : 200,
		sortable : true
	}, {
		field : 'phoneNum',
		title : '联系电话',
		width : 100,
		sortable : true
	}, {
		field : 'status',
		title : '在线状态',
		width : 60,
		formatter:function(value,row,index){
			if(value == Constants.USER_OFF_LINE){
				return "<span style='color:#999;'>离线</span>";
			}else if(value == Constants.USER_ON_LINE){
				return "<span style='color:#0F0;'>在线</span>";
			}
		}
	}, {
		field : 'isActivate',
		title : '激活状态',
		width : 60,
		sortable : true,
		formatter:function( value, row, index){
			if(value=="1"){
				return "已激活";
			}else if(value=="0"){
				return "未激活";
			}
		}
	}, {
		field : 'createTime',
		title : '创建时间',
		width : 130,
		sortable : true
	}  ] ],
	toolbar : [ {
		text : '密码重置',
		iconCls : 'icon-edit',
		handler : function() {
		}
	}, '-' ],
	rowStyler:function(index,row){
		if(row.isActivate=="0"){
			return 'background-color:#EEE;';
		}
	}
});
var userStatusOptionsHtml ="";
userStatusOptionsHtml += "<option >--请选择--</option>";
userStatusOptionsHtml += "<option value='"+Constants.USER_OFF_LINE+"'>离线</option>";
userStatusOptionsHtml += "<option value='"+Constants.USER_ON_LINE+"'>在线</option>";
$("#user_user_status_select").append(userStatusOptionsHtml);

var userIsActivateOptionsHtml ="";
userIsActivateOptionsHtml += "<option >--请选择--</option>";
userIsActivateOptionsHtml += "<option value='0'>未激活</option>";
userIsActivateOptionsHtml += "<option value='1'>已激活</option>";
$("#user_user_activate_select").append(userIsActivateOptionsHtml);
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/user/UserManager.js"></script>
<div id="user_user_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false,height:100,hidden:true">
		<form id="user_user_searchForm">
			<div style="text-align:left;margin-top:10px;height:25px;">
				<div style="width:330px;float:left;text-align:right;">
					用户名： <input class="easyui-textbox" name="username" />
				</div>
				<div style="width:258px;float:left;text-align:right;">
					在线状态： <select id="user_user_status_select" class="easyui-combobox" name="status"></select>
				</div>
				<div style="width:246px;float:left;text-align:right;">
					激活状态：<select id="user_user_activate_select" class="easyui-combobox" name="isActivate"></select>
				</div>
			</div>
			<div style="text-align:left;margin-top:5px;height:25spx;">
				<div style="width:330px;float:left;text-align:right;">
					创建时间从：<input id="createTimeFrom" class="easyui-datebox" name="createTimeFrom" />
				</div>
				<div style="width:330px;float:left;text-align:right;">
					创建时间到：<input id="createTimeTo" class="easyui-datebox" name="createTimeTo" />
				</div>
				<div style="width:330px;float:left;text-align:right;">
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="UserManager.search()">查询</a> 
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'sjx-icon-trash'" onclick="UserManager.clear()">清空</a>
				</div>
			</div>
		</form>
	</div>
	<div data-options="region:'center',border:true">
		<table id="user_user_datagrid"></table>
	</div>
</div>
