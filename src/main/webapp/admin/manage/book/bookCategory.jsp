<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/Constants.js"></script>
<script type="text/javascript">
	var rootPath = '${pageContext.request.contextPath}/';
$('#book_book_category_datagrid').datagrid({
	url : '${pageContext.request.contextPath}/bookCategoryAction!getCategoryByLevel.action',
	fit : true,
	border : false,
	pagination : true,
	pagePosition:'bottom',
	idField : 'bid',
	pageSize : 5,
	pageList : [ 5,10, 20, 30, 40, 50 ],
	sortName : 'name',
	sortOrder : 'asc',
	checkOnSelect : false,
	selectOnCheck : false,
	columns : [ [ {
		field : 'cid',
		title : '编号',
		width : 100
	}, {
		field : 'cname',
		title : '类别名称',
		width : 200,
		sortable : true
	} ] ],
	toolbar : [ {
		text : '添加',
		iconCls : 'icon-add',
		handler : function() {
			BookCategoryManager.addBookCategory();
		}
	}, '-',{
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
var optionsHtml = "<option value='"+Constants.LEVEL_ONE+"'>一级分类</option>";
optionsHtml+="<option value='"+Constants.LEVEL_TWO+"'>二级分类</option>";
$('#sel').append(optionsHtml);

$('#sel').combobox({
	onChange:function(curr,prev){
		if(curr==Constants.LEVEL_TWO){
			var html = "<input id='bookC1' name='cid1'>";
			$('#conditionPanel').append(html);
			$('#bookC1').combobox({
			    url:'${pageContext.request.contextPath}/bookCategoryAction!getBookCategory.action',
			    valueField:'value',
			    textField:'name',
			    onChange:function(n,o){
			    }
			});
		}else{
			$('#bookC1').combobox("destroy");
		}
	}
});
$('#bookCategory11').combobox({
    url:'${pageContext.request.contextPath}/bookCategoryAction!getBookCategory.action',
    valueField:'value',
    textField:'name',
    onChange:function(n,o){
    	
    }
});

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/manage/book/BookCategoryManager.js"></script>

<div id="book_book_category_layout" class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',title:'查询条件',border:false,height:100,hidden:true">
		<form id="book_book_category_searchForm">
		<div id="conditionPanel" style="width:100%;height:30px;text-align:center;margin-top:5px;">
				类别：
			<select id="sel" class="easyui-combobox" name="level">
			</select>
		</div>
		<div style="width:100%;height:30px;text-align:center">
 			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="BookCategoryManager.searchBookCategory()">查询</a> 
 		</div>
		</form>
	</div>
	<div data-options="region:'center',border:true">
		<table id="book_book_category_datagrid"></table>
	</div>
</div>

<div id="addLevel">
	<div  class="easyui-tabs" data-options="border:false">
	 	<div title="一级分类" data-options="border:false" style="padding:60px;">
	 		<div style="padding:5px;">
		        <label for="name">一级类别:</label>
		        <input id="levelOneInput" class="easyui-validatebox" type="text" name="name" data-options="required:true" />
		    </div>
		    <div style="padding:5px;text-align:center">
		   		 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="BookCategoryManager.saveLevelOne()">保存</a>
		    </div>
	    </div>
	    <div title="二级分类"  data-options="border:false" style="padding:40px;">
	 		<div style="padding:5px;">
		        <label style="float:left;display:block" for="name">一级类别:</label>
		        <input style="float:left;display:block" id="bookCategory11" name="cid" value="2">
		        <a style="float:right;display:block" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="BookCategoryManager.reloadLevelOne()">刷新</a>
		    </div>
	 		<div style="padding:5px;">
		        <label for="name">二级类别:</label>
		        <input id="levelTwoInput" class="easyui-validatebox" type="text" name="name" data-options="required:true" />
		    </div>
		    <div style="padding:5px;text-align:center">
		   		 <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="BookCategoryManager.saveLevelTwo()">保存</a>
		    </div>
	    </div>
	</div>
</div>

